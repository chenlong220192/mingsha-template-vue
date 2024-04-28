package site.mingsha.biz.service.impl;

import site.mingsha.biz.manager.AsyncManager;
import site.mingsha.biz.manager.factory.AsyncFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import site.mingsha.biz.service.ISysConfigService;
import site.mingsha.biz.service.ISysUserService;
import site.mingsha.common.constant.CacheConstants;
import site.mingsha.common.constant.Constants;
import site.mingsha.common.constant.UserConstants;
import site.mingsha.dal.system.model.SysUserDO;
import site.mingsha.biz.model.dto.RegisterBodyDTO;
import site.mingsha.common.redis.RedisCache;
import site.mingsha.common.exception.user.CaptchaException;
import site.mingsha.common.exception.user.CaptchaExpireException;
import site.mingsha.common.utils.MessageUtils;
import site.mingsha.biz.utils.SecurityUtils;
import site.mingsha.common.utils.StringUtils;

/**
 * 注册校验方法
 * 
 * @author mingsha
 */
@Component
public class SysRegisterService
{
    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 注册
     */
    public String register(RegisterBodyDTO registerBodyDTO)
    {
        String msg = "", username = registerBodyDTO.getUsername(), password = registerBodyDTO.getPassword();
        SysUserDO sysUserDO = new SysUserDO();
        sysUserDO.setUserName(username);

        // 验证码开关
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            validateCaptcha(username, registerBodyDTO.getCode(), registerBodyDTO.getUuid());
        }

        if (StringUtils.isEmpty(username))
        {
            msg = "用户名不能为空";
        }
        else if (StringUtils.isEmpty(password))
        {
            msg = "用户密码不能为空";
        }
        else if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            msg = "账户长度必须在2到20个字符之间";
        }
        else if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            msg = "密码长度必须在5到20个字符之间";
        }
        else if (!userService.checkUserNameUnique(sysUserDO))
        {
            msg = "保存用户'" + username + "'失败，注册账号已存在";
        }
        else
        {
            sysUserDO.setNickName(username);
            sysUserDO.setPassword(SecurityUtils.encryptPassword(password));
            boolean regFlag = userService.registerUser(sysUserDO);
            if (!regFlag)
            {
                msg = "注册失败,请联系系统管理人员";
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.REGISTER, MessageUtils.message("user.register.success")));
            }
        }
        return msg;
    }

    /**
     * 校验验证码
     * 
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
        String captcha = redisCache.getCacheObject(verifyKey);
        redisCache.deleteObject(verifyKey);
        if (captcha == null)
        {
            throw new CaptchaExpireException();
        }
        if (!code.equalsIgnoreCase(captcha))
        {
            throw new CaptchaException();
        }
    }
}

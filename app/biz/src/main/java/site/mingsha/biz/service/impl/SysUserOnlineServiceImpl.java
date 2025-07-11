package site.mingsha.biz.service.impl;

import org.springframework.stereotype.Service;
import site.mingsha.biz.service.ISysUserOnlineService;
import site.mingsha.biz.model.dto.LoginUser;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.dal.system.model.SysUserOnlineDO;

/**
 * 在线用户 服务层处理
 * 
 * @author mingsha
 * @date 2025-07-11
 */
@Service
public class SysUserOnlineServiceImpl implements ISysUserOnlineService {
    /**
     * 通过登录地址查询信息
     * 
     * @param ipaddr 登录地址
     * @param user 用户信息
     * @return 在线用户信息
     */
    @Override
    public SysUserOnlineDO selectOnlineByIpaddr(String ipaddr, LoginUser user) {
        if (StringUtils.equals(ipaddr, user.getIpaddr())) {
            return loginUserToUserOnline(user);
        }
        return null;
    }

    /**
     * 通过用户名称查询信息
     * 
     * @param userName 用户名称
     * @param user 用户信息
     * @return 在线用户信息
     */
    @Override
    public SysUserOnlineDO selectOnlineByUserName(String userName, LoginUser user) {
        if (StringUtils.equals(userName, user.getUsername())) {
            return loginUserToUserOnline(user);
        }
        return null;
    }

    /**
     * 通过登录地址/用户名称查询信息
     * 
     * @param ipaddr 登录地址
     * @param userName 用户名称
     * @param user 用户信息
     * @return 在线用户信息
     */
    @Override
    public SysUserOnlineDO selectOnlineByInfo(String ipaddr, String userName, LoginUser user) {
        if (StringUtils.equals(ipaddr, user.getIpaddr()) && StringUtils.equals(userName, user.getUsername())) {
            return loginUserToUserOnline(user);
        }
        return null;
    }

    /**
     * 设置在线用户信息
     * 
     * @param user 用户信息
     * @return 在线用户
     */
    @Override
    public SysUserOnlineDO loginUserToUserOnline(LoginUser user) {
        if (StringUtils.isNull(user) || StringUtils.isNull(user.getUser())) {
            return null;
        }
        SysUserOnlineDO sysUserOnlineDO = new SysUserOnlineDO();
        sysUserOnlineDO.setTokenId(user.getToken());
        sysUserOnlineDO.setUserName(user.getUsername());
        sysUserOnlineDO.setIpaddr(user.getIpaddr());
        sysUserOnlineDO.setLoginLocation(user.getLoginLocation());
        sysUserOnlineDO.setBrowser(user.getBrowser());
        sysUserOnlineDO.setOs(user.getOs());
        sysUserOnlineDO.setLoginTime(user.getLoginTime());
        if (StringUtils.isNotNull(user.getUser().getDept())) {
            sysUserOnlineDO.setDeptName(user.getUser().getDept().getDeptName());
        }
        return sysUserOnlineDO;
    }
}

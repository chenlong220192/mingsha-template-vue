package site.mingsha.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.biz.core.BaseController;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.biz.model.dto.RegisterBodyDTO;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.biz.service.impl.SysRegisterService;
import site.mingsha.biz.service.ISysConfigService;

/**
 * 注册验证
 * 
 * @author mingsha
 * @date 2025-07-11
 */
@RestController
public class SysRegisterController extends BaseController {
    @Autowired
    private SysRegisterService registerService;

    @Autowired
    private ISysConfigService  configService;

    @PostMapping("/register")
    public AjaxResponseDTO register(@RequestBody RegisterBodyDTO user) {
        if (!("true".equals(configService.selectConfigByKey("sys.account.registerUser")))) {
            return error("当前系统没有开启注册功能！");
        }
        String msg = registerService.register(user);
        return StringUtils.isEmpty(msg) ? success() : error(msg);
    }
}

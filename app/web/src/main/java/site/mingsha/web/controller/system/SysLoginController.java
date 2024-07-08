package site.mingsha.web.controller.system;

import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.common.constant.Constants;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.dal.system.model.SysMenuDO;
import site.mingsha.dal.system.model.SysUserDO;
import site.mingsha.biz.model.dto.LoginBodyDTO;
import site.mingsha.biz.utils.SecurityUtils;
import site.mingsha.biz.service.impl.SysLoginService;
import site.mingsha.biz.service.impl.SysPermissionService;
import site.mingsha.biz.service.ISysMenuService;

/**
 * 登录验证
 * 
 * @author mingsha
 */
@RestController
public class SysLoginController {
    @Autowired
    private SysLoginService      loginService;

    @Autowired
    private ISysMenuService      menuService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 登录方法
     * 
     * @param loginBodyDTO 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResponseDTO login(@RequestBody LoginBodyDTO loginBodyDTO) {
        AjaxResponseDTO ajax = AjaxResponseDTO.success();
        // 生成令牌
        String token = loginService.login(loginBodyDTO.getUsername(), loginBodyDTO.getPassword(), loginBodyDTO.getCode(), loginBodyDTO.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResponseDTO getInfo() {
        SysUserDO user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResponseDTO ajax = AjaxResponseDTO.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResponseDTO getRouters() {
        Long userId = SecurityUtils.getUserId();
        List<SysMenuDO> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResponseDTO.success(menuService.buildMenus(menus));
    }
}

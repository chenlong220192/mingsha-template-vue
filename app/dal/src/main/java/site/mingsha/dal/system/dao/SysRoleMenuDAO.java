package site.mingsha.dal.system.dao;

import java.util.List;
import site.mingsha.dal.system.model.SysRoleMenuDO;

/**
 * 角色与菜单关联表 数据层
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public interface SysRoleMenuDAO {
    /**
     * 查询菜单使用数量
     * 
     * @param menuId 菜单ID
     * @return 结果
     */
    public int checkMenuExistRole(Long menuId);

    /**
     * 通过角色ID删除角色和菜单关联
     * 
     * @param roleId 角色ID
     * @return 结果
     */
    public int deleteRoleMenuByRoleId(Long roleId);

    /**
     * 批量删除角色菜单关联信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteRoleMenu(Long[] ids);

    /**
     * 批量新增角色菜单信息
     * 
     * @param roleMenuList 角色菜单列表
     * @return 结果
     */
    public int batchRoleMenu(List<SysRoleMenuDO> roleMenuList);
}

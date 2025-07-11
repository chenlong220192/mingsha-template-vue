package site.mingsha.biz.service;

import java.util.List;
import site.mingsha.dal.system.model.SysLoginLogDO;

/**
 * 系统访问日志情况信息 服务层
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public interface ISysLoginLogService {
    /**
     * 新增系统登录日志
     * 
     * @param logininfor 访问日志对象
     */
    public void insertLoginLog(SysLoginLogDO logininfor);

    /**
     * 查询系统登录日志集合
     * 
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    public List<SysLoginLogDO> selectLoginLogList(SysLoginLogDO logininfor);

    /**
     * 批量删除系统登录日志
     * 
     * @param infoIds 需要删除的登录日志ID
     * @return 结果
     */
    public int deleteLoginLogByIds(Long[] infoIds);

    /**
     * 清空系统登录日志
     */
    public void cleanLoginLog();
}

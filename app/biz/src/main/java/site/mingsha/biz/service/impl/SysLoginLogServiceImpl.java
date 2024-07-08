package site.mingsha.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.mingsha.biz.service.ISysLoginLogService;
import site.mingsha.dal.system.model.SysLoginLogDO;
import site.mingsha.dal.system.dao.SysLoginLogDAO;

/**
 * 系统访问日志情况信息 服务层处理
 * 
 * @author mingsha
 */
@Service
public class SysLoginLogServiceImpl implements ISysLoginLogService {

    @Autowired
    private SysLoginLogDAO loginLogMapper;

    /**
     * 新增系统登录日志
     * 
     * @param logininfor 访问日志对象
     */
    @Override
    public void insertLoginLog(SysLoginLogDO logininfor) {
        loginLogMapper.insertLoginLog(logininfor);
    }

    /**
     * 查询系统登录日志集合
     * 
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    @Override
    public List<SysLoginLogDO> selectLoginLogList(SysLoginLogDO logininfor) {
        return loginLogMapper.selectLoginLogList(logininfor);
    }

    /**
     * 批量删除系统登录日志
     * 
     * @param infoIds 需要删除的登录日志ID
     * @return 结果
     */
    @Override
    public int deleteLoginLogByIds(Long[] infoIds) {
        return loginLogMapper.deleteLoginLogByIds(infoIds);
    }

    /**
     * 清空系统登录日志
     */
    @Override
    public void cleanLoginLog() {
        loginLogMapper.cleanLoginLog();
    }
}

package site.mingsha.biz.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.mingsha.biz.service.IGenTableColumnService;
import site.mingsha.common.utils.text.Convert;
import site.mingsha.dal.generator.model.GenTableColumnDO;
import site.mingsha.dal.generator.dao.GenTableColumnDAO;

/**
 * 业务字段 服务层实现
 * 
 * @author mingsha
 */
@Service
public class GenTableColumnServiceImpl implements IGenTableColumnService {
    @Autowired
    private GenTableColumnDAO genTableColumnDAO;

    /**
     * 查询业务字段列表
     * 
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    @Override
    public List<GenTableColumnDO> selectGenTableColumnListByTableId(Long tableId) {
        return genTableColumnDAO.selectGenTableColumnListByTableId(tableId);
    }

    /**
     * 新增业务字段
     * 
     * @param genTableColumnDO 业务字段信息
     * @return 结果
     */
    @Override
    public int insertGenTableColumn(GenTableColumnDO genTableColumnDO) {
        return genTableColumnDAO.insertGenTableColumn(genTableColumnDO);
    }

    /**
     * 修改业务字段
     * 
     * @param genTableColumnDO 业务字段信息
     * @return 结果
     */
    @Override
    public int updateGenTableColumn(GenTableColumnDO genTableColumnDO) {
        return genTableColumnDAO.updateGenTableColumn(genTableColumnDO);
    }

    /**
     * 删除业务字段对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteGenTableColumnByIds(String ids) {
        return genTableColumnDAO.deleteGenTableColumnByIds(Convert.toLongArray(ids));
    }
}

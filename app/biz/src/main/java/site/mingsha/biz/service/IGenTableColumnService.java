package site.mingsha.biz.service;

import java.util.List;
import site.mingsha.dal.generator.model.GenTableColumnDO;

/**
 * 业务字段 服务层
 * 
 * @author mingsha
 */
public interface IGenTableColumnService
{
    /**
     * 查询业务字段列表
     * 
     * @param tableId 业务字段编号
     * @return 业务字段集合
     */
    public List<GenTableColumnDO> selectGenTableColumnListByTableId(Long tableId);

    /**
     * 新增业务字段
     * 
     * @param genTableColumnDO 业务字段信息
     * @return 结果
     */
    public int insertGenTableColumn(GenTableColumnDO genTableColumnDO);

    /**
     * 修改业务字段
     * 
     * @param genTableColumnDO 业务字段信息
     * @return 结果
     */
    public int updateGenTableColumn(GenTableColumnDO genTableColumnDO);

    /**
     * 删除业务字段信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteGenTableColumnByIds(String ids);
}

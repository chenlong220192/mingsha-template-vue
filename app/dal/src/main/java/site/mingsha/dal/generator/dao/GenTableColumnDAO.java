package site.mingsha.dal.generator.dao;

import java.util.List;

import site.mingsha.dal.generator.model.GenTableColumnDO;

/**
 * 业务字段 数据层
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public interface GenTableColumnDAO {
    /**
     * 根据表名称查询列信息
     * 
     * @param tableName 表名称
     * @return 列信息
     */
    public List<GenTableColumnDO> selectDbTableColumnsByName(String tableName);

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
     * 删除业务字段
     * 
     * @param genTableColumnDOS 列数据
     * @return 结果
     */
    public int deleteGenTableColumns(List<GenTableColumnDO> genTableColumnDOS);

    /**
     * 批量删除业务字段
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteGenTableColumnByIds(Long[] ids);
}

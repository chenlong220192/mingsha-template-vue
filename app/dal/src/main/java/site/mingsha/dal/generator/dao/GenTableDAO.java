package site.mingsha.dal.generator.dao;

import java.util.List;
import site.mingsha.dal.generator.model.GenTableDO;

/**
 * 业务 数据层
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public interface GenTableDAO {
    /**
     * 查询业务列表
     * 
     * @param genTableDO 业务信息
     * @return 业务集合
     */
    public List<GenTableDO> selectGenTableList(GenTableDO genTableDO);

    /**
     * 查询据库列表
     * 
     * @param genTableDO 业务信息
     * @return 数据库表集合
     */
    public List<GenTableDO> selectDbTableList(GenTableDO genTableDO);

    /**
     * 查询据库列表
     * 
     * @param tableNames 表名称组
     * @return 数据库表集合
     */
    public List<GenTableDO> selectDbTableListByNames(String[] tableNames);

    /**
     * 查询所有表信息
     * 
     * @return 表信息集合
     */
    public List<GenTableDO> selectGenTableAll();

    /**
     * 查询表ID业务信息
     * 
     * @param id 业务ID
     * @return 业务信息
     */
    public GenTableDO selectGenTableById(Long id);

    /**
     * 查询表名称业务信息
     * 
     * @param tableName 表名称
     * @return 业务信息
     */
    public GenTableDO selectGenTableByName(String tableName);

    /**
     * 新增业务
     * 
     * @param genTableDO 业务信息
     * @return 结果
     */
    public int insertGenTable(GenTableDO genTableDO);

    /**
     * 修改业务
     * 
     * @param genTableDO 业务信息
     * @return 结果
     */
    public int updateGenTable(GenTableDO genTableDO);

    /**
     * 批量删除业务
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteGenTableByIds(Long[] ids);

    /**
     * 创建表
     *
     * @param sql 表结构
     * @return 结果
     */
    public int createTable(String sql);
}

package site.mingsha.biz.service;

import java.util.List;
import java.util.Map;
import site.mingsha.dal.generator.model.GenTableDO;

/**
 * 业务 服务层
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public interface IGenTableService {
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
     * 查询业务信息
     * 
     * @param id 业务ID
     * @return 业务信息
     */
    public GenTableDO selectGenTableById(Long id);

    /**
     * 修改业务
     * 
     * @param genTableDO 业务信息
     * @return 结果
     */
    public void updateGenTable(GenTableDO genTableDO);

    /**
     * 删除业务信息
     * 
     * @param tableIds 需要删除的表数据ID
     * @return 结果
     */
    public void deleteGenTableByIds(Long[] tableIds);

    /**
     * 创建表
     *
     * @param sql 创建表语句
     * @return 结果
     */
    public boolean createTable(String sql);

    /**
     * 导入表结构
     *
     * @param tableList 导入表列表
     * @param operName 操作人员
     */
    public void importGenTable(List<GenTableDO> tableList, String operName);

    /**
     * 预览代码
     * 
     * @param tableId 表编号
     * @return 预览数据列表
     */
    public Map<String, String> previewCode(Long tableId);

    /**
     * 生成代码（下载方式）
     * 
     * @param tableName 表名称
     * @return 数据
     */
    public byte[] downloadCode(String tableName);

    /**
     * 生成代码（自定义路径）
     * 
     * @param tableName 表名称
     * @return 数据
     */
    public void generatorCode(String tableName);

    /**
     * 同步数据库
     * 
     * @param tableName 表名称
     */
    public void synchDb(String tableName);

    /**
     * 批量生成代码（下载方式）
     * 
     * @param tableNames 表数组
     * @return 数据
     */
    public byte[] downloadCode(String[] tableNames);

    /**
     * 修改保存参数校验
     * 
     * @param genTableDO 业务信息
     */
    public void validateEdit(GenTableDO genTableDO);
}

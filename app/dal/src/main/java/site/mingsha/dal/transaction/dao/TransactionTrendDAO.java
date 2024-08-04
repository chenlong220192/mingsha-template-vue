package site.mingsha.dal.transaction.dao;

import site.mingsha.dal.transaction.model.TransactionTrendDO;

import java.util.List;

/**
 * 交易趋势DAO接口
 *
 * @author mingsha
 * @date 2024-08-02
 */
public interface TransactionTrendDAO {
    /**
     * 查询交易趋势
     *
     * @param id 交易趋势主键
     * @return 交易趋势
     */
    public TransactionTrendDO selectTransactionTrendById(Long id);

    /**
     * 查询交易趋势列表
     *
     * @param transactionTrendDO 交易趋势
     * @return 交易趋势集合
     */
    public List<TransactionTrendDO> selectTransactionTrendList(TransactionTrendDO transactionTrendDO);

    /**
     * 新增交易趋势
     *
     * @param transactionTrendDO 交易趋势
     * @return 结果
     */
    public int insertTransactionTrend(TransactionTrendDO transactionTrendDO);

    /**
     * 修改交易趋势
     *
     * @param transactionTrendDO 交易趋势
     * @return 结果
     */
    public int updateTransactionTrend(TransactionTrendDO transactionTrendDO);

    /**
     * 删除交易趋势
     *
     * @param id 交易趋势主键
     * @return 结果
     */
    public int deleteTransactionTrendById(Long id);

    /**
     * 批量删除交易趋势
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTransactionTrendByIds(Long[] ids);
}

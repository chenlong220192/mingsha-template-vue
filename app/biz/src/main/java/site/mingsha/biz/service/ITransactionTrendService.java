package site.mingsha.biz.service;

import site.mingsha.dal.transaction.model.TransactionTrendDO;

import java.util.List;

/**
 * 交易趋势Service接口
 *
 * @author mingsha
 * @date 2024-08-02
 */
public interface ITransactionTrendService {
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
     * 批量删除交易趋势
     *
     * @param ids 需要删除的交易趋势主键集合
     * @return 结果
     */
    public int deleteTransactionTrendByIds(Long[] ids);

    /**
     * 删除交易趋势信息
     *
     * @param id 交易趋势主键
     * @return 结果
     */
    public int deleteTransactionTrendById(Long id);
}

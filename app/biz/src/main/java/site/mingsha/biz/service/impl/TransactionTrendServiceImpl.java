package site.mingsha.biz.service.impl;

import java.util.List;

import site.mingsha.biz.service.ITransactionTrendService;
import site.mingsha.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import site.mingsha.dal.transaction.dao.TransactionTrendDAO;
import site.mingsha.dal.transaction.model.TransactionTrendDO;

/**
 * 交易趋势Service业务层处理
 *
 * @author mingsha
 * @date 2024-08-02
 */
@Service
public class TransactionTrendServiceImpl implements ITransactionTrendService {
    @Autowired
    private TransactionTrendDAO transactionTrendDAO;

    /**
     * 查询交易趋势
     *
     * @param id 交易趋势主键
     * @return 交易趋势
     */
    @Override
    public TransactionTrendDO selectTransactionTrendById(Long id) {
        return transactionTrendDAO.selectTransactionTrendById(id);
    }

    /**
     * 查询交易趋势列表
     *
     * @param transactionTrendDO 交易趋势
     * @return 交易趋势
     */
    @Override
    public List<TransactionTrendDO> selectTransactionTrendList(TransactionTrendDO transactionTrendDO) {
        return transactionTrendDAO.selectTransactionTrendList(transactionTrendDO);
    }

    /**
     * 新增交易趋势
     *
     * @param transactionTrendDO 交易趋势
     * @return 结果
     */
    @Override
    public int insertTransactionTrend(TransactionTrendDO transactionTrendDO) {
        transactionTrendDO.setCreateTime(DateUtils.getNowDate());
        return transactionTrendDAO.insertTransactionTrend(transactionTrendDO);
    }

    /**
     * 修改交易趋势
     *
     * @param transactionTrendDO 交易趋势
     * @return 结果
     */
    @Override
    public int updateTransactionTrend(TransactionTrendDO transactionTrendDO) {
        return transactionTrendDAO.updateTransactionTrend(transactionTrendDO);
    }

    /**
     * 批量删除交易趋势
     *
     * @param ids 需要删除的交易趋势主键
     * @return 结果
     */
    @Override
    public int deleteTransactionTrendByIds(Long[] ids) {
        return transactionTrendDAO.deleteTransactionTrendByIds(ids);
    }

    /**
     * 删除交易趋势信息
     *
     * @param id 交易趋势主键
     * @return 结果
     */
    @Override
    public int deleteTransactionTrendById(Long id) {
        return transactionTrendDAO.deleteTransactionTrendById(id);
    }
}

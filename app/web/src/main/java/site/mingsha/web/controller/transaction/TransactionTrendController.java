package site.mingsha.web.controller.transaction;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.biz.service.ITransactionTrendService;
import site.mingsha.common.annotation.Log;
import site.mingsha.biz.core.BaseController;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.common.enums.BusinessType;
import site.mingsha.biz.utils.poi.ExcelUtil;
import site.mingsha.biz.model.dto.page.TableDataInfo;
import site.mingsha.dal.transaction.model.TransactionTrendDO;

/**
 * 交易趋势Controller
 *
 * @author mingsha
 * @date 2024-08-02
 */
@RestController
@RequestMapping("/transaction/trend")
public class TransactionTrendController extends BaseController
{
    @Autowired
    private ITransactionTrendService transactionTrendService;

    /**
     * 查询交易趋势列表
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:list')")
    @GetMapping("/list")
    public TableDataInfo list(TransactionTrendDO transactionTrendDO)
    {
        startPage();
        List<TransactionTrendDO> list = transactionTrendService.selectTransactionTrendList(transactionTrendDO);
        return getDataTable(list);
    }

    /**
     * 导出交易趋势列表
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:export')")
    @Log(title = "交易趋势", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TransactionTrendDO transactionTrendDO)
    {
        List<TransactionTrendDO> list = transactionTrendService.selectTransactionTrendList(transactionTrendDO);
        ExcelUtil<TransactionTrendDO> util = new ExcelUtil<TransactionTrendDO>(TransactionTrendDO.class);
        util.exportExcel(response, list, "交易趋势数据");
    }

    /**
     * 获取交易趋势详细信息
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:query')")
    @GetMapping(value = "/{id}")
    public AjaxResponseDTO getInfo(@PathVariable("id") Long id)
    {
        return success(transactionTrendService.selectTransactionTrendById(id));
    }

    /**
     * 新增交易趋势
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:add')")
    @Log(title = "交易趋势", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResponseDTO add(@RequestBody TransactionTrendDO transactionTrendDO)
    {
        return toAjax(transactionTrendService.insertTransactionTrend(transactionTrendDO));
    }

    /**
     * 修改交易趋势
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:edit')")
    @Log(title = "交易趋势", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResponseDTO edit(@RequestBody TransactionTrendDO transactionTrendDO)
    {
        return toAjax(transactionTrendService.updateTransactionTrend(transactionTrendDO));
    }

    /**
     * 删除交易趋势
     */
    @PreAuthorize("@ss.hasPermi('transaction:trend:remove')")
    @Log(title = "交易趋势", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResponseDTO remove(@PathVariable Long[] ids)
    {
        return toAjax(transactionTrendService.deleteTransactionTrendByIds(ids));
    }
}

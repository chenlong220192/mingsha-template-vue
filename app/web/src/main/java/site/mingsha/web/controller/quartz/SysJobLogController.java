package site.mingsha.web.controller.quartz;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import site.mingsha.common.annotation.Log;
import site.mingsha.biz.core.BaseController;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.biz.model.dto.page.TableDataInfo;
import site.mingsha.common.enums.BusinessType;
import site.mingsha.biz.utils.poi.ExcelUtil;
import site.mingsha.dal.quartz.model.SysJobLogDO;
import site.mingsha.biz.service.ISysJobLogService;

/**
 * 调度日志操作处理
 * 
 * @author mingsha
 */
@RestController
@RequestMapping("/monitor/jobLog")
public class SysJobLogController extends BaseController
{
    @Autowired
    private ISysJobLogService jobLogService;

    /**
     * 查询定时任务调度日志列表
     */
    @PreAuthorize("@ss.hasPermi('monitor:job:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysJobLogDO sysJobLogDO)
    {
        startPage();
        List<SysJobLogDO> list = jobLogService.selectJobLogList(sysJobLogDO);
        return getDataTable(list);
    }

    /**
     * 导出定时任务调度日志列表
     */
    @PreAuthorize("@ss.hasPermi('monitor:job:export')")
    @Log(title = "任务调度日志", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysJobLogDO sysJobLogDO)
    {
        List<SysJobLogDO> list = jobLogService.selectJobLogList(sysJobLogDO);
        ExcelUtil<SysJobLogDO> util = new ExcelUtil<SysJobLogDO>(SysJobLogDO.class);
        util.exportExcel(response, list, "调度日志");
    }
    
    /**
     * 根据调度编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('monitor:job:query')")
    @GetMapping(value = "/{jobLogId}")
    public AjaxResponseDTO getInfo(@PathVariable Long jobLogId)
    {
        return success(jobLogService.selectJobLogById(jobLogId));
    }


    /**
     * 删除定时任务调度日志
     */
    @PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @Log(title = "定时任务调度日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{jobLogIds}")
    public AjaxResponseDTO remove(@PathVariable Long[] jobLogIds)
    {
        return toAjax(jobLogService.deleteJobLogByIds(jobLogIds));
    }

    /**
     * 清空定时任务调度日志
     */
    @PreAuthorize("@ss.hasPermi('monitor:job:remove')")
    @Log(title = "调度日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public AjaxResponseDTO clean()
    {
        jobLogService.cleanJobLog();
        return success();
    }
}

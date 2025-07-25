package site.mingsha.web.controller.monitor;

import java.util.List;
import jakarta.servlet.http.HttpServletResponse;
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
import site.mingsha.biz.service.impl.SysPasswordService;
import site.mingsha.dal.system.model.SysLoginLogDO;
import site.mingsha.biz.service.ISysLoginLogService;

/**
 * 系统访问记录
 * 
 * @author mingsha
 * @date 2025-07-11
 */
@RestController
@RequestMapping("/monitor/logininfor")
public class SysLogininforController extends BaseController {
    @Autowired
    private ISysLoginLogService logininforService;

    @Autowired
    private SysPasswordService  passwordService;

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysLoginLogDO logininfor) {
        startPage();
        List<SysLoginLogDO> list = logininforService.selectLoginLogList(logininfor);
        return getDataTable(list);
    }

    @Log(title = "登录日志", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('monitor:logininfor:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysLoginLogDO logininfor) {
        List<SysLoginLogDO> list = logininforService.selectLoginLogList(logininfor);
        ExcelUtil<SysLoginLogDO> util = new ExcelUtil<SysLoginLogDO>(SysLoginLogDO.class);
        util.exportExcel(response, list, "登录日志");
    }

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
    @Log(title = "登录日志", businessType = BusinessType.DELETE)
    @DeleteMapping("/{infoIds}")
    public AjaxResponseDTO remove(@PathVariable Long[] infoIds) {
        return toAjax(logininforService.deleteLoginLogByIds(infoIds));
    }

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:remove')")
    @Log(title = "登录日志", businessType = BusinessType.CLEAN)
    @DeleteMapping("/clean")
    public AjaxResponseDTO clean() {
        logininforService.cleanLoginLog();
        return success();
    }

    @PreAuthorize("@ss.hasPermi('monitor:logininfor:unlock')")
    @Log(title = "账户解锁", businessType = BusinessType.OTHER)
    @GetMapping("/unlock/{userName}")
    public AjaxResponseDTO unlock(@PathVariable("userName") String userName) {
        passwordService.clearLoginRecordCache(userName);
        return success();
    }
}

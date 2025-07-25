package site.mingsha.biz.core;

import java.beans.PropertyEditorSupport;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import site.mingsha.common.constant.HttpStatus;
import site.mingsha.common.model.response.AjaxResponseDTO;
import site.mingsha.biz.model.dto.LoginUser;
import site.mingsha.biz.model.dto.page.PageDomain;
import site.mingsha.biz.model.dto.page.TableDataInfo;
import site.mingsha.biz.model.dto.page.TableSupport;
import site.mingsha.common.utils.DateUtils;
import site.mingsha.biz.utils.PageUtils;
import site.mingsha.biz.utils.SecurityUtils;
import site.mingsha.common.utils.StringUtils;
import site.mingsha.common.utils.sql.SqlUtil;

/**
 * web层通用数据处理
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class BaseController {
    protected final Logger logger = LoggerFactory.getLogger(this.getClass());

    /**
     * 将前台传递过来的日期格式的字符串，自动转化为Date类型
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                setValue(DateUtils.parseDate(text));
            }
        });
    }

    /**
     * 设置请求分页数据
     */
    protected void startPage() {
        PageUtils.startPage();
    }

    /**
     * 设置请求排序数据
     */
    protected void startOrderBy() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        if (StringUtils.isNotEmpty(pageDomain.getOrderBy())) {
            String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
            PageHelper.orderBy(orderBy);
        }
    }

    /**
     * 清理分页的线程变量
     */
    protected void clearPage() {
        PageUtils.clearPage();
    }

    /**
     * 响应请求分页数据
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(HttpStatus.SUCCESS);
        rspData.setMsg("查询成功");
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    /**
     * 返回成功
     */
    public AjaxResponseDTO success() {
        return AjaxResponseDTO.success();
    }

    /**
     * 返回失败消息
     */
    public AjaxResponseDTO error() {
        return AjaxResponseDTO.error();
    }

    /**
     * 返回成功消息
     */
    public AjaxResponseDTO success(String message) {
        return AjaxResponseDTO.success(message);
    }

    /**
     * 返回成功消息
     */
    public AjaxResponseDTO success(Object data) {
        return AjaxResponseDTO.success(data);
    }

    /**
     * 返回失败消息
     */
    public AjaxResponseDTO error(String message) {
        return AjaxResponseDTO.error(message);
    }

    /**
     * 返回警告消息
     */
    public AjaxResponseDTO warn(String message) {
        return AjaxResponseDTO.warn(message);
    }

    /**
     * 响应返回结果
     * 
     * @param rows 影响行数
     * @return 操作结果
     */
    protected AjaxResponseDTO toAjax(int rows) {
        return rows > 0 ? AjaxResponseDTO.success() : AjaxResponseDTO.error();
    }

    /**
     * 响应返回结果
     * 
     * @param result 结果
     * @return 操作结果
     */
    protected AjaxResponseDTO toAjax(boolean result) {
        return result ? success() : error();
    }

    /**
     * 页面跳转
     */
    public String redirect(String url) {
        return StringUtils.format("redirect:{}", url);
    }

    /**
     * 获取用户缓存信息
     */
    public LoginUser getLoginUser() {
        return SecurityUtils.getLoginUser();
    }

    /**
     * 获取登录用户id
     */
    public Long getUserId() {
        return getLoginUser().getUserId();
    }

    /**
     * 获取登录部门id
     */
    public Long getDeptId() {
        return getLoginUser().getDeptId();
    }

    /**
     * 获取登录用户名
     */
    public String getUsername() {
        return getLoginUser().getUsername();
    }
}

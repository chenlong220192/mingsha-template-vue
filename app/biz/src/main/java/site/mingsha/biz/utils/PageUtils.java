package site.mingsha.biz.utils;

import com.github.pagehelper.PageHelper;
import site.mingsha.biz.model.dto.page.PageDomain;
import site.mingsha.biz.model.dto.page.TableSupport;
import site.mingsha.common.utils.sql.SqlUtil;

/**
 * 分页工具类
 * 
 * @author mingsha
 * @date 2025-07-11
 */
public class PageUtils extends PageHelper {
    /**
     * 设置请求分页数据
     */
    public static void startPage() {
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String orderBy = SqlUtil.escapeOrderBySql(pageDomain.getOrderBy());
        Boolean reasonable = pageDomain.getReasonable();
        PageHelper.startPage(pageNum, pageSize, orderBy).setReasonable(reasonable);
    }

    /**
     * 清理分页的线程变量
     */
    public static void clearPage() {
        PageHelper.clearPage();
    }
}

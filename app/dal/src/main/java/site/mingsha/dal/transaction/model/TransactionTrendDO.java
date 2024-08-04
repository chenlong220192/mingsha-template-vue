package site.mingsha.dal.transaction.model;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import site.mingsha.common.annotation.Excel;
import site.mingsha.common.model._do.BaseDO;

/**
 * 交易趋势对象 transaction_trend
 *
 * @author mingsha
 * @date 2024-08-02
 */
public class TransactionTrendDO extends BaseDO {
    private static final long serialVersionUID = 1L;

    /** id */
    private Long              id;

    /** 币种 */
    @Excel(name = "币种")
    private String            coin;

    /** 档位 */
    @Excel(name = "档位")
    private String            gear;

    /** 日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "日期", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date              date;

    /** 开盘价 */
    @Excel(name = "开盘价")
    private String            priceStart;

    /** 收盘价 */
    @Excel(name = "收盘价")
    private String            priceEnd;

    /** 最高价 */
    @Excel(name = "最高价")
    private String            priceHighest;

    /** 最低价 */
    @Excel(name = "最低价")
    private String            priceLowest;

    /** 关键点 */
    @Excel(name = "关键点")
    private String            pricePoints;

    /** 涨跌方向 */
    @Excel(name = "涨跌方向")
    private String            direction;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setCoin(String coin) {
        this.coin = coin;
    }

    public String getCoin() {
        return coin;
    }

    public void setGear(String gear) {
        this.gear = gear;
    }

    public String getGear() {
        return gear;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return date;
    }

    public void setPriceStart(String priceStart) {
        this.priceStart = priceStart;
    }

    public String getPriceStart() {
        return priceStart;
    }

    public void setPriceEnd(String priceEnd) {
        this.priceEnd = priceEnd;
    }

    public String getPriceEnd() {
        return priceEnd;
    }

    public void setPriceHighest(String priceHighest) {
        this.priceHighest = priceHighest;
    }

    public String getPriceHighest() {
        return priceHighest;
    }

    public void setPriceLowest(String priceLowest) {
        this.priceLowest = priceLowest;
    }

    public String getPriceLowest() {
        return priceLowest;
    }

    public void setPricePoints(String pricePoints) {
        this.pricePoints = pricePoints;
    }

    public String getPricePoints() {
        return pricePoints;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getDirection() {
        return direction;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE).append("id", getId()).append("coin", getCoin()).append("gear", getGear()).append("date", getDate())
            .append("priceStart", getPriceStart()).append("priceEnd", getPriceEnd()).append("priceHighest", getPriceHighest()).append("priceLowest", getPriceLowest())
            .append("pricePoints", getPricePoints()).append("direction", getDirection()).append("createTime", getCreateTime()).append("remark", getRemark()).toString();
    }
}

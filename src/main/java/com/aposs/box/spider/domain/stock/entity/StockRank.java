package com.aposs.box.spider.domain.stock.entity;

import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author macro
 * @since 2022-06-30
 */
@Data
@Table(name="stock_rank")
public class StockRank {

    private Integer id;

    private String sCode;

    private String sName;

    private String period;

    private Boolean backWeek;

    private Date endDt;

    private Date prevDt;

    private BigDecimal endPrice;

    private BigDecimal prevPrice;

    private Double rate;

    private Integer rn;


}

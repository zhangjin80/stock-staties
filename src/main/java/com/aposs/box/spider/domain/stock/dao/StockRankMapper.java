package com.aposs.box.spider.domain.stock.dao;

import com.aposs.box.spider.config.MyMapper;
import com.aposs.box.spider.domain.stock.entity.StockRank;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface StockRankMapper extends MyMapper<StockRank> {
    void genStockRankData();
}

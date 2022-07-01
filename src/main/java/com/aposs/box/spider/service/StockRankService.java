package com.aposs.box.spider.service;

import com.aposs.box.spider.domain.stock.dao.StockRankMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockRankService {
    @Autowired
    private StockRankMapper stockRankMapper;

    public void genRankData() {
        stockRankMapper.genStockRankData();
    }
}

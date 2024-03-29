package com.aposs.box.spider;

import com.aposs.box.spider.service.StockRankService;
import com.aposs.box.spider.service.StockSpiderService;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDate;

/**
 * @author Aaron
 * @date 2020/11/26
 * <p>
 * 爬虫程序调度入口
 */
@Component
public class BoxSpiderRunner implements ApplicationRunner {

    @Resource
    private StockSpiderService stockSpiderService;
    @Resource
    private StockRankService stockRankService;


    @Override
    public void run(ApplicationArguments args) {
        // 启动程序立刻执行一次爬取程序
        stockSpiderService.runKlineSpider(30);
        stockRankService.genRankData();
    }

    /**
     * 每天 15:30 执行
     */
    @Scheduled(cron = "0 30 15 1/1 * ?")
    public void processStockSpiderSchedule() {
        // 如果当天为交易日，则执行行情数据爬取
        if (stockSpiderService.checkTradingDate(LocalDate.now())) {
            stockSpiderService.runKlineSpider(1);
        }
    }


}

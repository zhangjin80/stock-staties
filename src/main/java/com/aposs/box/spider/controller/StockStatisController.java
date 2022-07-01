package com.aposs.box.spider.controller;

import com.aposs.box.spider.model.base.BaseResponse;
import com.aposs.box.spider.service.StockRankService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping("statis")
public class StockStatisController {
    @Resource
    private StockRankService stockRankService;


    @GetMapping("/gen_rank")
    public BaseResponse genRank(){
       stockRankService.genRankData();
        return BaseResponse.success();
    }
}

package com.ruoyi.Core.util;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.other_manage.domain.CarStatus;
import com.ruoyi.other_manage.mapper.CarStatusMapper;
import com.ruoyi.other_manage.service.ICarStatusService;
import com.ruoyi.other_manage.service.impl.CarServiceImpl;
import com.ruoyi.other_manage.service.impl.CarStatusServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.UUID;


public class MqttTools {







    public MqttTools() {

    }


    public static String getUUID(){
        UUID uuid = UUID.randomUUID();
        return uuid.toString();


    }
    public static long getTimeStamp(){
        return System.currentTimeMillis();

    }



}

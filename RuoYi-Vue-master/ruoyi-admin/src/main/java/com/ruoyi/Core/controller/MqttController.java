package com.ruoyi.Core.controller;

import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.Core.MqttService;
import com.ruoyi.Core.util.MqttTools;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.page.TableDataInfo;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

@RestController
public class MqttController {
    @Autowired
    private MqttService mqttService;


    @PostConstruct
    public void init() throws MqttException {
        // 在Controller实例化后调用MqttService的方法
        mqttService.init();
    }

    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Assign")
    public void list(Map<String,String> map) throws MqttException {

        map.put("pt", map.get("lon") +","+ map.get("lat"));
        map.put("yaw",map.get("azi"));
        map.remove("lon");
        map.remove("lat");
        map.remove("azi");
        //jsondata包含pt、stationId、yaw、stationName
        JSONObject jsonObject = new JSONObject(map);
        JSONObject data = new JSONObject();

        data.put("cmd","stationList");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId",null);
        data.put("vin",jsonObject.getString("car_name"));
        //data.put("lastTimeVehicle",null);


        data.put("data",jsonObject);


        

        mqttService.publish(data);


    }
    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Pause")
    public void pause(Map<String,String> map) throws MqttException {



        JSONObject jsonObject = new JSONObject(map);
        JSONObject data = new JSONObject();

        data.put("cmd","pause");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId",null);
        data.put("vin",jsonObject.getString("car_name"));





        mqttService.publish(data);


    }
    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Resume")
    public void resume(Map<String,String> map) throws MqttException {


        JSONObject jsonObject = new JSONObject(map);
        JSONObject data = new JSONObject();

        data.put("cmd","resume");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId",null);
        data.put("vin",jsonObject.getString("car_name"));





        mqttService.publish(data);


    }
}

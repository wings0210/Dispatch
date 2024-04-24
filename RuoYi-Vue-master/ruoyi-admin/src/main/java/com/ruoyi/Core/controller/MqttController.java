package com.ruoyi.Core.controller;

import com.alibaba.fastjson2.JSONArray;
import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.ruoyi.Core.MqttService;
import com.ruoyi.Core.util.MqttTools;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.other_manage.domain.StationInfo;
import com.ruoyi.other_manage.mapper.StationInfoMapper;
import org.eclipse.paho.client.mqttv3.MqttException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.Map;

@RestController
public class MqttController {
    @Autowired
    private MqttService mqttService;

    @Autowired
    private StationInfoMapper stationInfoMapper;


    @PostConstruct
    public void init() throws MqttException {
        // 在Controller实例化后调用MqttService的方法
        mqttService.init();
    }

    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Assign")
    public void list(@RequestBody Map<String,String> map) throws MqttException {

        JSONObject jsonObject = new JSONObject();
        JSONObject data = new JSONObject();

        data.put("cmd","stationList");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId","");
        data.put("timestamp",MqttTools.getTimeStamp());
        data.put("vin",map.get("carName"));
        data.put("lastTimeVehicle",null);



        jsonObject.put("method", "set");
        jsonObject.put("coor_system", 0);
        jsonObject.put("isStart", 1);
        jsonObject.put("routeId", map.get("routeId"));
        jsonObject.put("routeName", map.get("routeName"));
        jsonObject.put("thirdCode", null);

        // 创建一个空的站点列表
        JSONArray stationList = new JSONArray();
        // 创建一个站点信息
        JSONObject station = new JSONObject();
        station.put("stationId", map.get("stationId"));
        station.put("pt", map.get("lon")+","+map.get("lat"));
        station.put("yaw", map.get("azi"));
        station.put("stationName", map.get("stationName"));
        // 创建 hookTypes 数组
        JSONArray hookTypes = new JSONArray();
        hookTypes.add(1);
        station.put("hookTypes", hookTypes);
        station.put("type", 1);
        station.put("orderByRouteId", 100);
        // 将车辆信息添加到车辆列表中
        stationList.add(station);
        jsonObject.put("stationList", stationList);


        data.put("data",jsonObject);

        JSONObject sndData = new JSONObject();
        sndData.put("content",data);

        mqttService.publish(sndData);


    }

    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Pause")
    public void pause(Map<String,String> map) throws MqttException {



        JSONObject jsonObject = new JSONObject();
        JSONObject data = new JSONObject();

        data.put("cmd","pause");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId","");
        data.put("timestamp",MqttTools.getTimeStamp());
        data.put("vin",map.get("car_name"));
        data.put("lastTimeVehicle",null);

        jsonObject.put("requestSource","SYSTEM 手动暂停");

        data.put("data",jsonObject);

        JSONObject sndData = new JSONObject();
        sndData.put("content",data);


        mqttService.publish(sndData);


    }

    @Anonymous
    @PostMapping ("/cloud_dispatch/OrderTransport/Resume")
    public void resume(Map<String,String> map) throws MqttException {


        JSONObject jsonObject = new JSONObject();
        JSONObject data = new JSONObject();

        data.put("cmd","resume");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId","");
        data.put("timestamp",MqttTools.getTimeStamp());
        data.put("vin",map.get("car_name"));
        data.put("lastTimeVehicle",null);


        jsonObject.put("requestSource","APP 手动resume恢复");

        data.put("data",jsonObject);


        JSONObject sndData = new JSONObject();
        sndData.put("content",data);


        mqttService.publish(sndData);


    }

    /**
     * 订单系统仓库叫车控制器
     * @param map
     * @throws MqttException
     */
    @Anonymous
    @PostMapping ("/MainManage/ordersStorage/dispatching")
    public void orderedCar(@RequestBody Map<String,String> map) throws MqttException {


        StationInfo stationInfo = stationInfoMapper.selectStorageStation();


        JSONObject jsonObject = new JSONObject();
        JSONObject data = new JSONObject();

        data.put("cmd","stationList");
        data.put("cmdId", MqttTools.getUUID());
        data.put("repCmdId","");
        data.put("timestamp",MqttTools.getTimeStamp());
        data.put("vin",map.get("carName"));
        data.put("lastTimeVehicle",null);



        jsonObject.put("method", "set");
        jsonObject.put("coor_system", 0);
        jsonObject.put("isStart", 1);
        jsonObject.put("routeId", 1);
        jsonObject.put("routeName", "th_1");
        jsonObject.put("thirdCode", null);

        // 创建一个空的站点列表
        JSONArray stationList = new JSONArray();
        // 创建一个站点信息
        JSONObject station = new JSONObject();
        station.put("stationId", 100);
        station.put("pt", stationInfo.getLon()+","+stationInfo.getLat());
        station.put("yaw", stationInfo.getAzi());
        station.put("stationName", stationInfo.getStationName());
        // 创建 hookTypes 数组
        JSONArray hookTypes = new JSONArray();
        hookTypes.add(1);
        station.put("hookTypes", hookTypes);
        station.put("type", 1);
        station.put("orderByRouteId", 100);
        // 将车辆信息添加到车辆列表中
        stationList.add(station);
        jsonObject.put("stationList", stationList);


        data.put("data",jsonObject);


        JSONObject sndData = new JSONObject();

        sndData.put("content",data);

        mqttService.publish(sndData);


    }

}

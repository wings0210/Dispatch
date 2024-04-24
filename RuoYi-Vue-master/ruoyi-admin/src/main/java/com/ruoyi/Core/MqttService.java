package com.ruoyi.Core;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.Core.util.MqttTools;
import com.ruoyi.other_manage.domain.CarStatus;
import com.ruoyi.other_manage.service.ICarStatusService;
import org.eclipse.paho.client.mqttv3.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class MqttService {




    private static final String brokerUrl = "tcp://localhost:1883";
    private static final String clientId = "testBackground";
    private static final String subTopic = "dc/+/data";

    //private static final String pubTopic = "dc/+/cmd";


    private  MqttClient client;

    @Autowired
    ICarStatusService iCarStatusService;



    MqttService() throws MqttException {

        //init();
    }

    public  void init() throws MqttException {
        this.client = new MqttClient(brokerUrl, clientId);

        this.client.setCallback(new SimpleMqttCallback());

        MqttConnectOptions options = new MqttConnectOptions();
        options.setAutomaticReconnect(true); // 开启自动重连

        this.client.connect();
        this.client.subscribe(subTopic);
        System.out.println("mqtt后台节点启动");

    }

     class SimpleMqttCallback implements MqttCallback {





         SimpleMqttCallback() {
         }

         public void connectionLost(Throwable throwable) {
            System.out.println("Connection lost!");
        }

        public void messageArrived(String s, MqttMessage mqttMessage) throws Exception {
            System.out.println("Message arrived on topic " + s + ": " + new String(mqttMessage.getPayload()));
            // 将消息存储到数据库
            //从主题字符串s中解析出节点ID
            String msg  =   new String(mqttMessage.getPayload());
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("data",msg);
            JSONObject newJson = jsonObject.getJSONObject("data");
            switch (newJson.getString("cmd")){
                case    "status":
                    ormStatusData(newJson.getJSONObject("data"));
                    System.out.println("完成一次orm");
                    break;
                case    "ackStationList":
                    break;
                case    "arriveSite":
                    break;
                case    "ackPause":
                    break;
                case    "ackResume":
                    break;
                case    "ackStop":
                    break;
                case    "ackParam":
                    break;
                case    "ackrelocation":
                    break;
                default:
                    break;

            }
        }

        public void deliveryComplete(IMqttDeliveryToken iMqttDeliveryToken) {
            System.out.println("Delivery complete!");
        }

        public  void ormStatusData(JSONObject jsonObject){
             CarStatus carStatus =new CarStatus();
             carStatus.setCarName(jsonObject.getString("vin"));
             carStatus.setDoorLock(jsonObject.getLong("Doorlock"));
             carStatus.setHighBeem(jsonObject.getLong("Highbeem"));
             carStatus.setLowBeem(jsonObject.getLong("Lowbeem"));
             carStatus.setSysPowMode(jsonObject.getString("SysPowMode"));
             carStatus.setWindows(jsonObject.getLong("Windows"));
             carStatus.setWindscreenWiper(jsonObject.getLong("WindscenWipSt"));
             carStatus.setAngle(jsonObject.getLong("angle"));
             carStatus.setButtonA(jsonObject.getLong("buttonA"));
             carStatus.setControlMode(jsonObject.getLong("control_mode"));
             carStatus.setCoorSystem(jsonObject.getLong("coor_system"));
             carStatus.setCurrentStop(jsonObject.getString("current_stop"));
             carStatus.setEmergencyButton(jsonObject.getLong("emergencybutton"));
             carStatus.setFaultCode(jsonObject.getString("fault_code"));
             carStatus.setFaultDesc(jsonObject.getString("fault_desc"));
             carStatus.setGears(jsonObject.getString("gears"));
             carStatus.setLocationStop(jsonObject.getString("location_stop"));
             carStatus.setLocationVeh(jsonObject.getString("location_veh"));
             carStatus.setMaxSpeed(jsonObject.getLong("maxSpeed"));
             carStatus.setOsVersion(jsonObject.getLong("osVersion"));
             carStatus.setRouteName(jsonObject.getString("routeName"));
             carStatus.setRouteStop(jsonObject.getString("route_stop"));
             carStatus.setRoutesVersion(jsonObject.getLong("routesVersion"));
             carStatus.setSignalCar(jsonObject.getLong("signal"));
             carStatus.setSoc(jsonObject.getLong("soc"));
             carStatus.setSpeed(jsonObject.getLong("speed"));
             carStatus.setTimestamp(jsonObject.getDate("timestamp"));
             carStatus.setTirePressure(jsonObject.getLong("tirePressure"));
             carStatus.setTripDistance(jsonObject.getLong("trip_distance"));
             carStatus.setTripEta(jsonObject.getLong("trip_eta"));
             carStatus.setTripLeftMileage(jsonObject.getLong("trip_left_mileage"));
             carStatus.setVehStatus(jsonObject.getLong("veh_status"));


             iCarStatusService.insertCarStatus(carStatus);



         }


    }

    public void publish(JSONObject msg) throws MqttException {

        MqttMessage message = new MqttMessage(msg.toJSONString().getBytes());
        message.setQos(1);
        JSONObject selMsg = msg.getJSONObject("content");
        String pubTopic = "dc/"+selMsg.getString("vin")+"/cmd";
        this.client.publish(pubTopic, message);
    }
}
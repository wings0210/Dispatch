package com.ruoyi.Core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class Execute {

    /*@Autowired
    private  InspectThread inspectThread;*/

    /*Execute(InspectThread inspectThread){
      this.inspectThread=inspectThread;
  }*/
    private final InspectThread inspectThread;


    Execute(InspectThread inspectThread){
        this.inspectThread=inspectThread;
        this.scheduleDatabaseOperation();
    }


    /*@Scheduled(fixedRate = 10000) // 每隔10秒执行一次*/
    public void scheduleDatabaseOperation() {
        Thread thread = new Thread(inspectThread);
        thread.start();
    }
}

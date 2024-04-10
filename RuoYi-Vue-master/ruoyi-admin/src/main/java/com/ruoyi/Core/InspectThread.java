
package com.ruoyi.Core;
import com.ruoyi.Core.service.ICoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;



@Component
public class InspectThread implements Runnable {


    @Autowired
    private ICoreService iCoreService;

    public void inspectOrders(int RestrictTime) {
        iCoreService.WarnOrders(RestrictTime);

    }

    @Override
    public void run() {

        try {
                while (true) {
                    inspectOrders(20);
                    Thread.sleep(10000);
                }
               /*inspectOrders(20);*/
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}



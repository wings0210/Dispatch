package com.ruoyi.other_manage.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 车辆状态对象 car_status
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public class CarStatus extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录编号 */
    private Long id;

    /** 车辆vin码 */
    @Excel(name = "车辆vin码")
    private String carName;

    /** door_lock */
    @Excel(name = "door_lock")
    private Long doorLock;

    /** high_beem */
    @Excel(name = "high_beem")
    private Long highBeem;

    /** hazard_ltiO */
    @Excel(name = "hazard_ltiO")
    private Long hazardLtio;

    /** low_beem */
    @Excel(name = "low_beem")
    private Long lowBeem;

    /** sys_pow_mode */
    @Excel(name = "sys_pow_mode")
    private String sysPowMode;

    /** windows */
    @Excel(name = "windows")
    private Long windows;

    /** windscreen_wiper */
    @Excel(name = "windscreen_wiper")
    private Long windscreenWiper;

    /** angle */
    @Excel(name = "angle")
    private Long angle;

    /** buttonA */
    @Excel(name = "buttonA")
    private Long buttonA;

    /** control_mode */
    @Excel(name = "control_mode")
    private Long controlMode;

    /** coor_system */
    @Excel(name = "coor_system")
    private Long coorSystem;

    /** current_stop */
    @Excel(name = "current_stop")
    private String currentStop;

    /** emergency_button */
    @Excel(name = "emergency_button")
    private Long emergencyButton;

    /** fault_code */
    @Excel(name = "fault_code")
    private Long faultCode;

    /** fault_desc */
    @Excel(name = "fault_desc")
    private String faultDesc;

    /** gears */
    @Excel(name = "gears")
    private String gears;

    /** location_stop */
    @Excel(name = "location_stop")
    private String locationStop;

    /** location_veh */
    @Excel(name = "location_veh")
    private String locationVeh;

    /** max_speed */
    @Excel(name = "max_speed")
    private Long maxSpeed;

    /** os_version */
    @Excel(name = "os_version")
    private Long osVersion;

    /** route_name */
    @Excel(name = "route_name")
    private String routeName;

    /** route_stop */
    @Excel(name = "route_stop")
    private String routeStop;

    /** routes_version */
    @Excel(name = "routes_version")
    private Long routesVersion;

    /** signal_car */
    @Excel(name = "signal_car")
    private Long signalCar;

    /** soc */
    @Excel(name = "soc")
    private Long soc;

    /** speed */
    @Excel(name = "speed")
    private Long speed;

    /** timestamp */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "timestamp", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timestamp;

    /** tire_pressure */
    @Excel(name = "tire_pressure")
    private Long tirePressure;

    /** trip_distance */
    @Excel(name = "trip_distance")
    private Long tripDistance;

    /** trip_eta */
    @Excel(name = "trip_eta")
    private Long tripEta;

    /** trip_left_mileage */
    @Excel(name = "trip_left_mileage")
    private Long tripLeftMileage;

    /** veh_status */
    @Excel(name = "veh_status")
    private Long vehStatus;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCarName(String carName) 
    {
        this.carName = carName;
    }

    public String getCarName() 
    {
        return carName;
    }
    public void setDoorLock(Long doorLock) 
    {
        this.doorLock = doorLock;
    }

    public Long getDoorLock() 
    {
        return doorLock;
    }
    public void setHighBeem(Long highBeem) 
    {
        this.highBeem = highBeem;
    }

    public Long getHighBeem() 
    {
        return highBeem;
    }
    public void setHazardLtio(Long hazardLtio) 
    {
        this.hazardLtio = hazardLtio;
    }

    public Long getHazardLtio() 
    {
        return hazardLtio;
    }
    public void setLowBeem(Long lowBeem) 
    {
        this.lowBeem = lowBeem;
    }

    public Long getLowBeem() 
    {
        return lowBeem;
    }
    public void setSysPowMode(String sysPowMode) 
    {
        this.sysPowMode = sysPowMode;
    }

    public String getSysPowMode() 
    {
        return sysPowMode;
    }
    public void setWindows(Long windows) 
    {
        this.windows = windows;
    }

    public Long getWindows() 
    {
        return windows;
    }
    public void setWindscreenWiper(Long windscreenWiper) 
    {
        this.windscreenWiper = windscreenWiper;
    }

    public Long getWindscreenWiper() 
    {
        return windscreenWiper;
    }
    public void setAngle(Long angle) 
    {
        this.angle = angle;
    }

    public Long getAngle() 
    {
        return angle;
    }
    public void setButtonA(Long buttonA) 
    {
        this.buttonA = buttonA;
    }

    public Long getButtonA() 
    {
        return buttonA;
    }
    public void setControlMode(Long controlMode) 
    {
        this.controlMode = controlMode;
    }

    public Long getControlMode() 
    {
        return controlMode;
    }
    public void setCoorSystem(Long coorSystem) 
    {
        this.coorSystem = coorSystem;
    }

    public Long getCoorSystem() 
    {
        return coorSystem;
    }
    public void setCurrentStop(String currentStop) 
    {
        this.currentStop = currentStop;
    }

    public String getCurrentStop() 
    {
        return currentStop;
    }
    public void setEmergencyButton(Long emergencyButton) 
    {
        this.emergencyButton = emergencyButton;
    }

    public Long getEmergencyButton() 
    {
        return emergencyButton;
    }
    public void setFaultCode(Long faultCode) 
    {
        this.faultCode = faultCode;
    }

    public Long getFaultCode() 
    {
        return faultCode;
    }
    public void setFaultDesc(String faultDesc) 
    {
        this.faultDesc = faultDesc;
    }

    public String getFaultDesc() 
    {
        return faultDesc;
    }
    public void setGears(String gears) 
    {
        this.gears = gears;
    }

    public String getGears() 
    {
        return gears;
    }
    public void setLocationStop(String locationStop) 
    {
        this.locationStop = locationStop;
    }

    public String getLocationStop() 
    {
        return locationStop;
    }
    public void setLocationVeh(String locationVeh) 
    {
        this.locationVeh = locationVeh;
    }

    public String getLocationVeh() 
    {
        return locationVeh;
    }
    public void setMaxSpeed(Long maxSpeed) 
    {
        this.maxSpeed = maxSpeed;
    }

    public Long getMaxSpeed() 
    {
        return maxSpeed;
    }
    public void setOsVersion(Long osVersion) 
    {
        this.osVersion = osVersion;
    }

    public Long getOsVersion() 
    {
        return osVersion;
    }
    public void setRouteName(String routeName) 
    {
        this.routeName = routeName;
    }

    public String getRouteName() 
    {
        return routeName;
    }
    public void setRouteStop(String routeStop) 
    {
        this.routeStop = routeStop;
    }

    public String getRouteStop() 
    {
        return routeStop;
    }
    public void setRoutesVersion(Long routesVersion) 
    {
        this.routesVersion = routesVersion;
    }

    public Long getRoutesVersion() 
    {
        return routesVersion;
    }
    public void setSignalCar(Long signalCar) 
    {
        this.signalCar = signalCar;
    }

    public Long getSignalCar() 
    {
        return signalCar;
    }
    public void setSoc(Long soc) 
    {
        this.soc = soc;
    }

    public Long getSoc() 
    {
        return soc;
    }
    public void setSpeed(Long speed) 
    {
        this.speed = speed;
    }

    public Long getSpeed() 
    {
        return speed;
    }
    public void setTimestamp(Date timestamp) 
    {
        this.timestamp = timestamp;
    }

    public Date getTimestamp() 
    {
        return timestamp;
    }
    public void setTirePressure(Long tirePressure) 
    {
        this.tirePressure = tirePressure;
    }

    public Long getTirePressure() 
    {
        return tirePressure;
    }
    public void setTripDistance(Long tripDistance) 
    {
        this.tripDistance = tripDistance;
    }

    public Long getTripDistance() 
    {
        return tripDistance;
    }
    public void setTripEta(Long tripEta) 
    {
        this.tripEta = tripEta;
    }

    public Long getTripEta() 
    {
        return tripEta;
    }
    public void setTripLeftMileage(Long tripLeftMileage) 
    {
        this.tripLeftMileage = tripLeftMileage;
    }

    public Long getTripLeftMileage() 
    {
        return tripLeftMileage;
    }
    public void setVehStatus(Long vehStatus) 
    {
        this.vehStatus = vehStatus;
    }

    public Long getVehStatus() 
    {
        return vehStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("carName", getCarName())
            .append("doorLock", getDoorLock())
            .append("highBeem", getHighBeem())
            .append("hazardLtio", getHazardLtio())
            .append("lowBeem", getLowBeem())
            .append("sysPowMode", getSysPowMode())
            .append("windows", getWindows())
            .append("windscreenWiper", getWindscreenWiper())
            .append("angle", getAngle())
            .append("buttonA", getButtonA())
            .append("controlMode", getControlMode())
            .append("coorSystem", getCoorSystem())
            .append("currentStop", getCurrentStop())
            .append("emergencyButton", getEmergencyButton())
            .append("faultCode", getFaultCode())
            .append("faultDesc", getFaultDesc())
            .append("gears", getGears())
            .append("locationStop", getLocationStop())
            .append("locationVeh", getLocationVeh())
            .append("maxSpeed", getMaxSpeed())
            .append("osVersion", getOsVersion())
            .append("routeName", getRouteName())
            .append("routeStop", getRouteStop())
            .append("routesVersion", getRoutesVersion())
            .append("signalCar", getSignalCar())
            .append("soc", getSoc())
            .append("speed", getSpeed())
            .append("timestamp", getTimestamp())
            .append("tirePressure", getTirePressure())
            .append("tripDistance", getTripDistance())
            .append("tripEta", getTripEta())
            .append("tripLeftMileage", getTripLeftMileage())
            .append("vehStatus", getVehStatus())
            .toString();
    }
}

package com.ruoyi.other_manage.mapper;

import java.util.List;
import com.ruoyi.other_manage.domain.Car;

/**
 * 车辆信息Mapper接口
 * 
 * @author CaiYang
 * @date 2024-03-22
 */
public interface CarMapper 
{
    /**
     * 查询车辆信息
     * 
     * @param carId 车辆信息主键
     * @return 车辆信息
     */
    public Car selectCarByCarId(Long carId);

    /**
     * 查询车辆信息列表
     * 
     * @param car 车辆信息
     * @return 车辆信息集合
     */
    public List<Car> selectCarList(Car car);

    /**
     * 新增车辆信息
     * 
     * @param car 车辆信息
     * @return 结果
     */
    public int insertCar(Car car);

    /**
     * 修改车辆信息
     * 
     * @param car 车辆信息
     * @return 结果
     */
    public int updateCar(Car car);

    /**
     * 删除车辆信息
     * 
     * @param carId 车辆信息主键
     * @return 结果
     */
    public int deleteCarByCarId(Long carId);

    /**
     * 批量删除车辆信息
     * 
     * @param carIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCarByCarIds(Long[] carIds);
}

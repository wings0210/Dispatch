package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.CarMapper;
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.service.ICarService;

/**
 * 车辆信息Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-03-22
 */
@Service
public class CarServiceImpl implements ICarService 
{
    @Autowired
    private CarMapper carMapper;

    /**
     * 查询车辆信息
     * 
     * @param carId 车辆信息主键
     * @return 车辆信息
     */
    @Override
    public Car selectCarByCarId(Long carId)
    {
        return carMapper.selectCarByCarId(carId);
    }

    /**
     * 查询车辆信息列表
     * 
     * @param car 车辆信息
     * @return 车辆信息
     */
    @Override
    public List<Car> selectCarList(Car car)
    {
        return carMapper.selectCarList(car);
    }

    /**
     * 新增车辆信息
     * 
     * @param car 车辆信息
     * @return 结果
     */
    @Override
    public int insertCar(Car car)
    {
        return carMapper.insertCar(car);
    }

    /**
     * 修改车辆信息
     * 
     * @param car 车辆信息
     * @return 结果
     */
    @Override
    public int updateCar(Car car)
    {
        return carMapper.updateCar(car);
    }

    /**
     * 批量删除车辆信息
     * 
     * @param carIds 需要删除的车辆信息主键
     * @return 结果
     */
    @Override
    public int deleteCarByCarIds(Long[] carIds)
    {
        return carMapper.deleteCarByCarIds(carIds);
    }

    /**
     * 删除车辆信息信息
     * 
     * @param carId 车辆信息主键
     * @return 结果
     */
    @Override
    public int deleteCarByCarId(Long carId)
    {
        return carMapper.deleteCarByCarId(carId);
    }
}

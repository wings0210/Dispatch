package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.CarStatusMapper;
import com.ruoyi.other_manage.domain.CarStatus;
import com.ruoyi.other_manage.service.ICarStatusService;

/**
 * 车辆状态Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@Service
public class CarStatusServiceImpl implements ICarStatusService 
{
    @Autowired
    private CarStatusMapper carStatusMapper;

    /**
     * 查询车辆状态
     * 
     * @param id 车辆状态主键
     * @return 车辆状态
     */
    @Override
    public CarStatus selectCarStatusById(Long id)
    {
        return carStatusMapper.selectCarStatusById(id);
    }

    /**
     * 查询车辆状态列表
     * 
     * @param carStatus 车辆状态
     * @return 车辆状态
     */
    @Override
    public List<CarStatus> selectCarStatusList(CarStatus carStatus)
    {
        return carStatusMapper.selectCarStatusList(carStatus);
    }

    /**
     * 新增车辆状态
     * 
     * @param carStatus 车辆状态
     * @return 结果
     */
    @Override
    public int insertCarStatus(CarStatus carStatus)
    {
        return carStatusMapper.insertCarStatus(carStatus);
    }

    /**
     * 修改车辆状态
     * 
     * @param carStatus 车辆状态
     * @return 结果
     */
    @Override
    public int updateCarStatus(CarStatus carStatus)
    {
        return carStatusMapper.updateCarStatus(carStatus);
    }

    /**
     * 批量删除车辆状态
     * 
     * @param ids 需要删除的车辆状态主键
     * @return 结果
     */
    @Override
    public int deleteCarStatusByIds(Long[] ids)
    {
        return carStatusMapper.deleteCarStatusByIds(ids);
    }

    /**
     * 删除车辆状态信息
     * 
     * @param id 车辆状态主键
     * @return 结果
     */
    @Override
    public int deleteCarStatusById(Long id)
    {
        return carStatusMapper.deleteCarStatusById(id);
    }
}

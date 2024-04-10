package com.ruoyi.other_manage.service;

import java.util.List;
import com.ruoyi.other_manage.domain.CarStatus;

/**
 * 车辆状态Service接口
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public interface ICarStatusService 
{
    /**
     * 查询车辆状态
     * 
     * @param id 车辆状态主键
     * @return 车辆状态
     */
    public CarStatus selectCarStatusById(Long id);

    /**
     * 查询车辆状态列表
     * 
     * @param carStatus 车辆状态
     * @return 车辆状态集合
     */
    public List<CarStatus> selectCarStatusList(CarStatus carStatus);

    /**
     * 新增车辆状态
     * 
     * @param carStatus 车辆状态
     * @return 结果
     */
    public int insertCarStatus(CarStatus carStatus);

    /**
     * 修改车辆状态
     * 
     * @param carStatus 车辆状态
     * @return 结果
     */
    public int updateCarStatus(CarStatus carStatus);

    /**
     * 批量删除车辆状态
     * 
     * @param ids 需要删除的车辆状态主键集合
     * @return 结果
     */
    public int deleteCarStatusByIds(Long[] ids);

    /**
     * 删除车辆状态信息
     * 
     * @param id 车辆状态主键
     * @return 结果
     */
    public int deleteCarStatusById(Long id);
}

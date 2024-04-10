package com.ruoyi.MainManage.service.impl;

import java.util.List;

import com.ruoyi.MainManage.domain.MixOrders;
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.domain.Station;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.MainManage.mapper.OrdersMapper;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.MainManage.service.IOrdersService;

/**
 * 订单处理Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-03-01
 */
@Service
public class OrdersServiceImpl implements IOrdersService 
{
    @Autowired
    private OrdersMapper ordersMapper;

    /**
     * 查询订单处理
     * 
     * @param orderId 订单处理主键
     * @return 订单处理
     */
    @Override
    public Orders selectOrdersByOrderId(Long orderId)
    {
        return ordersMapper.selectOrdersByOrderId(orderId);
    }

    /**
     * 查询订单处理列表
     * 
     * @param orders 订单处理
     * @return 订单处理
     */
    @Override
    public List<Orders> selectOrdersList(Orders orders)
    {
        return ordersMapper.selectOrdersList(orders);
    }

    /**
     * 新增订单处理
     * 
     * @param orders 订单处理
     * @return 结果
     */
    @Override
    public int insertOrders(Orders orders)
    {
        return ordersMapper.insertOrders(orders);
    }

    /**
     * 修改订单处理
     * 
     * @param orders 订单处理
     * @return 结果
     */
    @Override
    public int updateOrders(Orders orders)
    {
        return ordersMapper.updateOrders(orders);
    }

    /**
     * 批量删除订单处理
     * 
     * @param orderIds 需要删除的订单处理主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderIds(Long[] orderIds)
    {
        return ordersMapper.deleteOrdersByOrderIds(orderIds);
    }

    /**
     * 删除订单处理信息
     * 
     * @param orderId 订单处理主键
     * @return 结果
     */
    @Override
    public int deleteOrdersByOrderId(Long orderId)
    {
        return ordersMapper.deleteOrdersByOrderId(orderId);
    }

    @Override
    public List<Station> selectStation(){
        return ordersMapper.selectStation();
    }

    @Override
    public List<Component> selectComponent(){
        return ordersMapper.selectComponent();
    }

    @Override
    public List<Car> selectCar(){
        return ordersMapper.selectCar();
    }

    @Override
    public List<MixOrders> selectErrorOrders(){
        return ordersMapper.selectWarnList();
    }
    @Override
    public List<MixOrders> selectScreenReady(){
        return ordersMapper.selectReadyList();
    }
    @Override
    public List<MixOrders> selectWarnList(){
        return ordersMapper.selectWarnList();
    }
    @Override
    public List<MixOrders> selectAssemblyLine(Orders orders){
        return ordersMapper.padTransportingList(orders);
    }
    @Override
    public List<MixOrders> selectStorage(Orders orders){
        return ordersMapper.padReadyList(orders);
    }





}

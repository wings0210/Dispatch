package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.RouteMapper;
import com.ruoyi.other_manage.domain.Route;
import com.ruoyi.other_manage.service.IRouteService;

/**
 * 线路Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@Service
public class RouteServiceImpl implements IRouteService 
{
    @Autowired
    private RouteMapper routeMapper;

    /**
     * 查询线路
     * 
     * @param routeId 线路主键
     * @return 线路
     */
    @Override
    public Route selectRouteByRouteId(Long routeId)
    {
        return routeMapper.selectRouteByRouteId(routeId);
    }

    /**
     * 查询线路列表
     * 
     * @param route 线路
     * @return 线路
     */
    @Override
    public List<Route> selectRouteList(Route route)
    {
        return routeMapper.selectRouteList(route);
    }

    /**
     * 新增线路
     * 
     * @param route 线路
     * @return 结果
     */
    @Override
    public int insertRoute(Route route)
    {
        return routeMapper.insertRoute(route);
    }

    /**
     * 修改线路
     * 
     * @param route 线路
     * @return 结果
     */
    @Override
    public int updateRoute(Route route)
    {
        return routeMapper.updateRoute(route);
    }

    /**
     * 批量删除线路
     * 
     * @param routeIds 需要删除的线路主键
     * @return 结果
     */
    @Override
    public int deleteRouteByRouteIds(Long[] routeIds)
    {
        return routeMapper.deleteRouteByRouteIds(routeIds);
    }

    /**
     * 删除线路信息
     * 
     * @param routeId 线路主键
     * @return 结果
     */
    @Override
    public int deleteRouteByRouteId(Long routeId)
    {
        return routeMapper.deleteRouteByRouteId(routeId);
    }
}

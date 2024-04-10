package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.RouteInfoMapper;
import com.ruoyi.other_manage.domain.RouteInfo;
import com.ruoyi.other_manage.service.IRouteInfoService;

/**
 * 线路信息Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@Service
public class RouteInfoServiceImpl implements IRouteInfoService 
{
    @Autowired
    private RouteInfoMapper routeInfoMapper;

    /**
     * 查询线路信息
     * 
     * @param pointId 线路信息主键
     * @return 线路信息
     */
    @Override
    public RouteInfo selectRouteInfoByPointId(Long pointId)
    {
        return routeInfoMapper.selectRouteInfoByPointId(pointId);
    }

    /**
     * 查询线路信息列表
     * 
     * @param routeInfo 线路信息
     * @return 线路信息
     */
    @Override
    public List<RouteInfo> selectRouteInfoList(RouteInfo routeInfo)
    {
        return routeInfoMapper.selectRouteInfoList(routeInfo);
    }

    /**
     * 新增线路信息
     * 
     * @param routeInfo 线路信息
     * @return 结果
     */
    @Override
    public int insertRouteInfo(RouteInfo routeInfo)
    {
        return routeInfoMapper.insertRouteInfo(routeInfo);
    }

    /**
     * 修改线路信息
     * 
     * @param routeInfo 线路信息
     * @return 结果
     */
    @Override
    public int updateRouteInfo(RouteInfo routeInfo)
    {
        return routeInfoMapper.updateRouteInfo(routeInfo);
    }

    /**
     * 批量删除线路信息
     * 
     * @param pointIds 需要删除的线路信息主键
     * @return 结果
     */
    @Override
    public int deleteRouteInfoByPointIds(Long[] pointIds)
    {
        return routeInfoMapper.deleteRouteInfoByPointIds(pointIds);
    }

    /**
     * 删除线路信息信息
     * 
     * @param pointId 线路信息主键
     * @return 结果
     */
    @Override
    public int deleteRouteInfoByPointId(Long pointId)
    {
        return routeInfoMapper.deleteRouteInfoByPointId(pointId);
    }
}

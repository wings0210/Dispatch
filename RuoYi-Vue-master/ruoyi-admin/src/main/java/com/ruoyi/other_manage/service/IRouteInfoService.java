package com.ruoyi.other_manage.service;

import java.util.List;
import com.ruoyi.other_manage.domain.RouteInfo;

/**
 * 线路信息Service接口
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public interface IRouteInfoService 
{
    /**
     * 查询线路信息
     * 
     * @param pointId 线路信息主键
     * @return 线路信息
     */
    public RouteInfo selectRouteInfoByPointId(Long pointId);

    /**
     * 查询线路信息列表
     * 
     * @param routeInfo 线路信息
     * @return 线路信息集合
     */
    public List<RouteInfo> selectRouteInfoList(RouteInfo routeInfo);

    /**
     * 新增线路信息
     * 
     * @param routeInfo 线路信息
     * @return 结果
     */
    public int insertRouteInfo(RouteInfo routeInfo);

    /**
     * 修改线路信息
     * 
     * @param routeInfo 线路信息
     * @return 结果
     */
    public int updateRouteInfo(RouteInfo routeInfo);

    /**
     * 批量删除线路信息
     * 
     * @param pointIds 需要删除的线路信息主键集合
     * @return 结果
     */
    public int deleteRouteInfoByPointIds(Long[] pointIds);

    /**
     * 删除线路信息信息
     * 
     * @param pointId 线路信息主键
     * @return 结果
     */
    public int deleteRouteInfoByPointId(Long pointId);
}

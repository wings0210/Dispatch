package com.ruoyi.other_manage.service;

import java.util.List;
import com.ruoyi.other_manage.domain.Route;

/**
 * 线路Service接口
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public interface IRouteService 
{
    /**
     * 查询线路
     * 
     * @param routeId 线路主键
     * @return 线路
     */
    public Route selectRouteByRouteId(Long routeId);

    /**
     * 查询线路列表
     * 
     * @param route 线路
     * @return 线路集合
     */
    public List<Route> selectRouteList(Route route);

    /**
     * 新增线路
     * 
     * @param route 线路
     * @return 结果
     */
    public int insertRoute(Route route);

    /**
     * 修改线路
     * 
     * @param route 线路
     * @return 结果
     */
    public int updateRoute(Route route);

    /**
     * 批量删除线路
     * 
     * @param routeIds 需要删除的线路主键集合
     * @return 结果
     */
    public int deleteRouteByRouteIds(Long[] routeIds);

    /**
     * 删除线路信息
     * 
     * @param routeId 线路主键
     * @return 结果
     */
    public int deleteRouteByRouteId(Long routeId);
}

package com.ruoyi.other_manage.mapper;

import java.util.List;
import com.ruoyi.other_manage.domain.Station;

/**
 * 站点管理Mapper接口
 * 
 * @author ruoyi
 * @date 2024-02-21
 */
public interface StationMapper 
{
    /**
     * 查询站点管理
     * 
     * @param stationId 站点管理主键
     * @return 站点管理
     */
    public Station selectStationByStationId(Long stationId);

    /**
     * 查询站点管理列表
     * 
     * @param station 站点管理
     * @return 站点管理集合
     */
    public List<Station> selectStationList(Station station);

    /**
     * 新增站点管理
     * 
     * @param station 站点管理
     * @return 结果
     */
    public int insertStation(Station station);

    /**
     * 修改站点管理
     * 
     * @param station 站点管理
     * @return 结果
     */
    public int updateStation(Station station);

    /**
     * 删除站点管理
     * 
     * @param stationId 站点管理主键
     * @return 结果
     */
    public int deleteStationByStationId(Long stationId);

    /**
     * 批量删除站点管理
     * 
     * @param stationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteStationByStationIds(Long[] stationIds);

    public List<Station> selectById(Long stationId);
}

package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.StationMapper;
import com.ruoyi.other_manage.domain.Station;
import com.ruoyi.other_manage.service.IStationService;

/**
 * 站点管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-02-21
 */
@Service
public class StationServiceImpl implements IStationService 
{
    @Autowired
    private StationMapper stationMapper;

    /**
     * 查询站点管理
     * 
     * @param stationId 站点管理主键
     * @return 站点管理
     */
    @Override
    public Station selectStationByStationId(Long stationId)
    {
        return stationMapper.selectStationByStationId(stationId);
    }

    /**
     * 查询站点管理列表
     * 
     * @param station 站点管理
     * @return 站点管理
     */
    @Override
    public List<Station> selectStationList(Station station)
    {
        return stationMapper.selectStationList(station);
    }

    /**
     * 新增站点管理
     * 
     * @param station 站点管理
     * @return 结果
     */
    @Override
    public int insertStation(Station station)
    {
        return stationMapper.insertStation(station);
    }

    /**
     * 修改站点管理
     * 
     * @param station 站点管理
     * @return 结果
     */
    @Override
    public int updateStation(Station station)
    {
        return stationMapper.updateStation(station);
    }

    /**
     * 批量删除站点管理
     * 
     * @param stationIds 需要删除的站点管理主键
     * @return 结果
     */
    @Override
    public int deleteStationByStationIds(Long[] stationIds)
    {
        return stationMapper.deleteStationByStationIds(stationIds);
    }

    /**
     * 删除站点管理信息
     * 
     * @param stationId 站点管理主键
     * @return 结果
     */
    @Override
    public int deleteStationByStationId(Long stationId)
    {
        return stationMapper.deleteStationByStationId(stationId);
    }

    @Override
    public List<Station> selectById(Long stationId){
        return stationMapper.selectById(stationId);
    }
}

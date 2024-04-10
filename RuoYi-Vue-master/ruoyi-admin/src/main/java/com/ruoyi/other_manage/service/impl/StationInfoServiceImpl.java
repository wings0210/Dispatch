package com.ruoyi.other_manage.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.other_manage.mapper.StationInfoMapper;
import com.ruoyi.other_manage.domain.StationInfo;
import com.ruoyi.other_manage.service.IStationInfoService;

/**
 * 站点详细信息Service业务层处理
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@Service
public class StationInfoServiceImpl implements IStationInfoService 
{
    @Autowired
    private StationInfoMapper stationInfoMapper;

    /**
     * 查询站点详细信息
     * 
     * @param infoId 站点详细信息主键
     * @return 站点详细信息
     */
    @Override
    public StationInfo selectStationInfoByInfoId(Long infoId)
    {
        return stationInfoMapper.selectStationInfoByInfoId(infoId);
    }

    /**
     * 查询站点详细信息列表
     * 
     * @param stationInfo 站点详细信息
     * @return 站点详细信息
     */
    @Override
    public List<StationInfo> selectStationInfoList(StationInfo stationInfo)
    {
        return stationInfoMapper.selectStationInfoList(stationInfo);
    }

    /**
     * 新增站点详细信息
     * 
     * @param stationInfo 站点详细信息
     * @return 结果
     */
    @Override
    public int insertStationInfo(StationInfo stationInfo)
    {
        return stationInfoMapper.insertStationInfo(stationInfo);
    }

    /**
     * 修改站点详细信息
     * 
     * @param stationInfo 站点详细信息
     * @return 结果
     */
    @Override
    public int updateStationInfo(StationInfo stationInfo)
    {
        return stationInfoMapper.updateStationInfo(stationInfo);
    }

    /**
     * 批量删除站点详细信息
     * 
     * @param infoIds 需要删除的站点详细信息主键
     * @return 结果
     */
    @Override
    public int deleteStationInfoByInfoIds(Long[] infoIds)
    {
        return stationInfoMapper.deleteStationInfoByInfoIds(infoIds);
    }

    /**
     * 删除站点详细信息信息
     * 
     * @param infoId 站点详细信息主键
     * @return 结果
     */
    @Override
    public int deleteStationInfoByInfoId(Long infoId)
    {
        return stationInfoMapper.deleteStationInfoByInfoId(infoId);
    }
}

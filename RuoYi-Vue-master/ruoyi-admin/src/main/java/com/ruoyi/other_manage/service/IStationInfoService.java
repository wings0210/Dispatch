package com.ruoyi.other_manage.service;

import java.util.List;
import com.ruoyi.other_manage.domain.StationInfo;

/**
 * 站点详细信息Service接口
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
public interface IStationInfoService 
{
    /**
     * 查询站点详细信息
     * 
     * @param infoId 站点详细信息主键
     * @return 站点详细信息
     */
    public StationInfo selectStationInfoByInfoId(Long infoId);

    /**
     * 查询站点详细信息列表
     * 
     * @param stationInfo 站点详细信息
     * @return 站点详细信息集合
     */
    public List<StationInfo> selectStationInfoList(StationInfo stationInfo);

    /**
     * 新增站点详细信息
     * 
     * @param stationInfo 站点详细信息
     * @return 结果
     */
    public int insertStationInfo(StationInfo stationInfo);

    /**
     * 修改站点详细信息
     * 
     * @param stationInfo 站点详细信息
     * @return 结果
     */
    public int updateStationInfo(StationInfo stationInfo);

    /**
     * 批量删除站点详细信息
     * 
     * @param infoIds 需要删除的站点详细信息主键集合
     * @return 结果
     */
    public int deleteStationInfoByInfoIds(Long[] infoIds);

    /**
     * 删除站点详细信息信息
     * 
     * @param infoId 站点详细信息主键
     * @return 结果
     */
    public int deleteStationInfoByInfoId(Long infoId);


    /**
     * 查询仓库站点（编号默认为2）
     * @return
     */
    public StationInfo selectStorageStation();

}

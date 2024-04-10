package com.ruoyi.other_manage.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.other_manage.domain.StationInfo;
import com.ruoyi.other_manage.service.IStationInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 站点详细信息Controller
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@RestController
@RequestMapping("/other_manage/stationInfo")
public class StationInfoController extends BaseController
{
    @Autowired
    private IStationInfoService stationInfoService;

    /**
     * 查询站点详细信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(StationInfo stationInfo)
    {
        startPage();
        List<StationInfo> list = stationInfoService.selectStationInfoList(stationInfo);
        return getDataTable(list);
    }

    /**
     * 导出站点详细信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:export')")
    @Log(title = "站点详细信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, StationInfo stationInfo)
    {
        List<StationInfo> list = stationInfoService.selectStationInfoList(stationInfo);
        ExcelUtil<StationInfo> util = new ExcelUtil<StationInfo>(StationInfo.class);
        util.exportExcel(response, list, "站点详细信息数据");
    }

    /**
     * 获取站点详细信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:query')")
    @GetMapping(value = "/{infoId}")
    public AjaxResult getInfo(@PathVariable("infoId") Long infoId)
    {
        return success(stationInfoService.selectStationInfoByInfoId(infoId));
    }

    /**
     * 新增站点详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:add')")
    @Log(title = "站点详细信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody StationInfo stationInfo)
    {
        return toAjax(stationInfoService.insertStationInfo(stationInfo));
    }

    /**
     * 修改站点详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:edit')")
    @Log(title = "站点详细信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody StationInfo stationInfo)
    {
        return toAjax(stationInfoService.updateStationInfo(stationInfo));
    }

    /**
     * 删除站点详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:stationInfo:remove')")
    @Log(title = "站点详细信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{infoIds}")
    public AjaxResult remove(@PathVariable Long[] infoIds)
    {
        return toAjax(stationInfoService.deleteStationInfoByInfoIds(infoIds));
    }
}

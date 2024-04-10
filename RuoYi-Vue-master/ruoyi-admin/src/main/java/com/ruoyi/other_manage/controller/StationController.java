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
import com.ruoyi.other_manage.domain.Station;
import com.ruoyi.other_manage.service.IStationService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 站点管理Controller
 * 
 * @author ruoyi
 * @date 2024-02-21
 */
@RestController
@RequestMapping("/other_manage/station")
public class StationController extends BaseController
{
    @Autowired
    private IStationService stationService;

    /**
     * 查询站点管理列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:list')")
    @GetMapping("/list")
    public TableDataInfo list(Station station)
    {
        startPage();
        List<Station> list = stationService.selectStationList(station);
        return getDataTable(list);
    }

    /**
     * 导出站点管理列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:export')")
    @Log(title = "站点管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Station station)
    {
        List<Station> list = stationService.selectStationList(station);
        ExcelUtil<Station> util = new ExcelUtil<Station>(Station.class);
        util.exportExcel(response, list, "站点管理数据");
    }

    /**
     * 获取站点管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:query')")
    @GetMapping(value = "/{stationId}")
    public AjaxResult getInfo(@PathVariable("stationId") Long stationId)
    {
        return success(stationService.selectStationByStationId(stationId));
    }

    /**
     * 新增站点管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:add')")
    @Log(title = "站点管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Station station)
    {
        return toAjax(stationService.insertStation(station));
    }

    /**
     * 修改站点管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:edit')")
    @Log(title = "站点管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Station station)
    {
        return toAjax(stationService.updateStation(station));
    }

    /**
     * 删除站点管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:remove')")
    @Log(title = "站点管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{stationIds}")
    public AjaxResult remove(@PathVariable Long[] stationIds)
    {
        return toAjax(stationService.deleteStationByStationIds(stationIds));
    }


    /**
     * 查找特殊站点
     */
    @PreAuthorize("@ss.hasPermi('other_manage:station:spec')")
    @GetMapping(value = "/spec")
    /*public List<Station> select(){
        return stationService.selectById(1L);
    }*/
    public TableDataInfo select(){
        startPage();
        List<Station> list=stationService.selectById(1L);
        return getDataTable(list);
    }


}

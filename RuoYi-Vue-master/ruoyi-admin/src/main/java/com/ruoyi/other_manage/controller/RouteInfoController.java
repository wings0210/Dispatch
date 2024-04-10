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
import com.ruoyi.other_manage.domain.RouteInfo;
import com.ruoyi.other_manage.service.IRouteInfoService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 线路信息Controller
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@RestController
@RequestMapping("/other_manage/routeInfo")
public class RouteInfoController extends BaseController
{
    @Autowired
    private IRouteInfoService routeInfoService;

    /**
     * 查询线路信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:list')")
    @GetMapping("/list")
    public TableDataInfo list(RouteInfo routeInfo)
    {
        startPage();
        List<RouteInfo> list = routeInfoService.selectRouteInfoList(routeInfo);
        return getDataTable(list);
    }

    /**
     * 导出线路信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:export')")
    @Log(title = "线路信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RouteInfo routeInfo)
    {
        List<RouteInfo> list = routeInfoService.selectRouteInfoList(routeInfo);
        ExcelUtil<RouteInfo> util = new ExcelUtil<RouteInfo>(RouteInfo.class);
        util.exportExcel(response, list, "线路信息数据");
    }

    /**
     * 获取线路信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:query')")
    @GetMapping(value = "/{pointId}")
    public AjaxResult getInfo(@PathVariable("pointId") Long pointId)
    {
        return success(routeInfoService.selectRouteInfoByPointId(pointId));
    }

    /**
     * 新增线路信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:add')")
    @Log(title = "线路信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RouteInfo routeInfo)
    {
        return toAjax(routeInfoService.insertRouteInfo(routeInfo));
    }

    /**
     * 修改线路信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:edit')")
    @Log(title = "线路信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RouteInfo routeInfo)
    {
        return toAjax(routeInfoService.updateRouteInfo(routeInfo));
    }

    /**
     * 删除线路信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:routeInfo:remove')")
    @Log(title = "线路信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{pointIds}")
    public AjaxResult remove(@PathVariable Long[] pointIds)
    {
        return toAjax(routeInfoService.deleteRouteInfoByPointIds(pointIds));
    }
}

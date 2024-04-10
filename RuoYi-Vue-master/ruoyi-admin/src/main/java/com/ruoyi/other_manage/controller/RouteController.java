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
import com.ruoyi.other_manage.domain.Route;
import com.ruoyi.other_manage.service.IRouteService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 线路Controller
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@RestController
@RequestMapping("/other_manage/route")
public class RouteController extends BaseController
{
    @Autowired
    private IRouteService routeService;

    /**
     * 查询线路列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:list')")
    @GetMapping("/list")
    public TableDataInfo list(Route route)
    {
        startPage();
        List<Route> list = routeService.selectRouteList(route);
        return getDataTable(list);
    }

    /**
     * 导出线路列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:export')")
    @Log(title = "线路", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Route route)
    {
        List<Route> list = routeService.selectRouteList(route);
        ExcelUtil<Route> util = new ExcelUtil<Route>(Route.class);
        util.exportExcel(response, list, "线路数据");
    }

    /**
     * 获取线路详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:query')")
    @GetMapping(value = "/{routeId}")
    public AjaxResult getInfo(@PathVariable("routeId") Long routeId)
    {
        return success(routeService.selectRouteByRouteId(routeId));
    }

    /**
     * 新增线路
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:add')")
    @Log(title = "线路", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Route route)
    {
        return toAjax(routeService.insertRoute(route));
    }

    /**
     * 修改线路
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:edit')")
    @Log(title = "线路", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Route route)
    {
        return toAjax(routeService.updateRoute(route));
    }

    /**
     * 删除线路
     */
    @PreAuthorize("@ss.hasPermi('other_manage:route:remove')")
    @Log(title = "线路", businessType = BusinessType.DELETE)
	@DeleteMapping("/{routeIds}")
    public AjaxResult remove(@PathVariable Long[] routeIds)
    {
        return toAjax(routeService.deleteRouteByRouteIds(routeIds));
    }
}

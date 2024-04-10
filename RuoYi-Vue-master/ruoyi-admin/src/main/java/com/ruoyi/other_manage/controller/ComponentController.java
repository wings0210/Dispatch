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
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.service.IComponentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 物料管理Controller
 * 
 * @author CaiYang
 * @date 2024-03-02
 */
@RestController
@RequestMapping("/other_manage/component")
public class ComponentController extends BaseController
{
    @Autowired
    private IComponentService componentService;

    /**
     * 查询物料管理列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:list')")
    @GetMapping("/list")
    public TableDataInfo list(Component component)
    {
        startPage();
        List<Component> list = componentService.selectComponentList(component);
        return getDataTable(list);
    }

    /**
     * 导出物料管理列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:export')")
    @Log(title = "物料管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Component component)
    {
        List<Component> list = componentService.selectComponentList(component);
        ExcelUtil<Component> util = new ExcelUtil<Component>(Component.class);
        util.exportExcel(response, list, "物料管理数据");
    }

    /**
     * 获取物料管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:query')")
    @GetMapping(value = "/{componentId}")
    public AjaxResult getInfo(@PathVariable("componentId") Long componentId)
    {
        return success(componentService.selectComponentByComponentId(componentId));
    }

    /**
     * 新增物料管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:add')")
    @Log(title = "物料管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Component component)
    {
        return toAjax(componentService.insertComponent(component));
    }

    /**
     * 修改物料管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:edit')")
    @Log(title = "物料管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Component component)
    {
        return toAjax(componentService.updateComponent(component));
    }

    /**
     * 删除物料管理
     */
    @PreAuthorize("@ss.hasPermi('other_manage:component:remove')")
    @Log(title = "物料管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{componentIds}")
    public AjaxResult remove(@PathVariable Long[] componentIds)
    {
        return toAjax(componentService.deleteComponentByComponentIds(componentIds));
    }
}

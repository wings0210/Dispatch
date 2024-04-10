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
import com.ruoyi.other_manage.domain.CarStatus;
import com.ruoyi.other_manage.service.ICarStatusService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车辆状态Controller
 * 
 * @author CaiYang
 * @date 2024-04-03
 */
@RestController
@RequestMapping("/other_manage/carStatus")
public class CarStatusController extends BaseController
{
    @Autowired
    private ICarStatusService carStatusService;

    /**
     * 查询车辆状态列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:list')")
    @GetMapping("/list")
    public TableDataInfo list(CarStatus carStatus)
    {
        startPage();
        List<CarStatus> list = carStatusService.selectCarStatusList(carStatus);
        return getDataTable(list);
    }

    /**
     * 导出车辆状态列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:export')")
    @Log(title = "车辆状态", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CarStatus carStatus)
    {
        List<CarStatus> list = carStatusService.selectCarStatusList(carStatus);
        ExcelUtil<CarStatus> util = new ExcelUtil<CarStatus>(CarStatus.class);
        util.exportExcel(response, list, "车辆状态数据");
    }

    /**
     * 获取车辆状态详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(carStatusService.selectCarStatusById(id));
    }

    /**
     * 新增车辆状态
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:add')")
    @Log(title = "车辆状态", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CarStatus carStatus)
    {
        return toAjax(carStatusService.insertCarStatus(carStatus));
    }

    /**
     * 修改车辆状态
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:edit')")
    @Log(title = "车辆状态", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CarStatus carStatus)
    {
        return toAjax(carStatusService.updateCarStatus(carStatus));
    }

    /**
     * 删除车辆状态
     */
    @PreAuthorize("@ss.hasPermi('other_manage:carStatus:remove')")
    @Log(title = "车辆状态", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(carStatusService.deleteCarStatusByIds(ids));
    }
}

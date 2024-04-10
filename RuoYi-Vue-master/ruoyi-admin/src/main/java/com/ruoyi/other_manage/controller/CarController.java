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
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.service.ICarService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 车辆信息Controller
 * 
 * @author CaiYang
 * @date 2024-03-22
 */
@RestController
@RequestMapping("/other_manage/car")
public class CarController extends BaseController
{
    @Autowired
    private ICarService carService;

    /**
     * 查询车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:list')")
    @GetMapping("/list")
    public TableDataInfo list(Car car)
    {
        startPage();
        List<Car> list = carService.selectCarList(car);
        return getDataTable(list);
    }

    /**
     * 导出车辆信息列表
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:export')")
    @Log(title = "车辆信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Car car)
    {
        List<Car> list = carService.selectCarList(car);
        ExcelUtil<Car> util = new ExcelUtil<Car>(Car.class);
        util.exportExcel(response, list, "车辆信息数据");
    }

    /**
     * 获取车辆信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:query')")
    @GetMapping(value = "/{carId}")
    public AjaxResult getInfo(@PathVariable("carId") Long carId)
    {
        return success(carService.selectCarByCarId(carId));
    }

    /**
     * 新增车辆信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:add')")
    @Log(title = "车辆信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Car car)
    {
        return toAjax(carService.insertCar(car));
    }

    /**
     * 修改车辆信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:edit')")
    @Log(title = "车辆信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Car car)
    {
        return toAjax(carService.updateCar(car));
    }

    /**
     * 删除车辆信息
     */
    @PreAuthorize("@ss.hasPermi('other_manage:car:remove')")
    @Log(title = "车辆信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{carIds}")
    public AjaxResult remove(@PathVariable Long[] carIds)
    {
        return toAjax(carService.deleteCarByCarIds(carIds));
    }
}

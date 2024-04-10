package com.ruoyi.MainManage.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.MainManage.domain.MixOrders;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.domain.Station;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.MainManage.service.IOrdersService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 流水线订单/大屏处理Controller
 * 
 * @author CaiYang
 * @date 2024-03-01
 */
@RestController
/*@RequestMapping("/MainManage/orders")*/
public class OrdersController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;

    /**
     * 查询订单处理列表
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:list')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/list")
    public TableDataInfo list(Orders orders)
    {
        startPage();
        List<Orders> list = ordersService.selectOrdersList(orders);
        return getDataTable(list);
    }

    /**
     * 导出订单处理列表
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:export')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.EXPORT)
    @PostMapping("/MainManage/ordersAssemblyLine/export")
    public void export(HttpServletResponse response, Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "订单处理数据");
    }

    /**
     * 获取订单处理详细信息
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:query')")*/
    @Anonymous
    @GetMapping(value = "/MainManage/ordersAssemblyLine/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(ordersService.selectOrdersByOrderId(orderId));
    }

    /**
     * 新增订单处理
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:add')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.INSERT)
    @PostMapping("/MainManage/ordersAssemblyLine")
    public AjaxResult add(@RequestBody Orders orders)
    {

        LocalDateTime localDateTime = LocalDateTime.now();
        Date currentDate = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        orders.setCreateTime(currentDate);
        return toAjax(ordersService.insertOrders(orders));
    }

    /**
     * 修改订单处理
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:edit')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.UPDATE)
    @PutMapping("/MainManage/ordersAssemblyLine")
    public AjaxResult edit(@RequestBody Orders orders)
    {
        return toAjax(ordersService.updateOrders(orders));
    }



    /**
     * 加载动态下拉框内容
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:getStation')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/getStation")
    public List<Station> selectStation()
    {
        return ordersService.selectStation();
    }


    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:getComponent')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/getComponent")
    public List<Component> selectComponent()
    {
        return ordersService.selectComponent();
    }

    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:getCar')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/getCar")
    public List<Car> selectCar()
    {
        return ordersService.selectCar();
    }


    /**
     * 获取界面上的异常订单信息
     * @return
     */


    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:getSpecOrders')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/getSpecOrders")
    public List<MixOrders> selectErrorOrders()
    {
        return ordersService.selectErrorOrders();
    }

    /**
     * 获取流水线的处理订单信息
     * @param orders
     * @return
     */

    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersAssemblyLine:AssemblyLine')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersAssemblyLine/AssemblyLine")
    public TableDataInfo selectAssemblyLine(Orders orders){
        startPage();
        List<MixOrders> list = ordersService.selectAssemblyLine(orders);
        return getDataTable(list);
    }

    /**
     * 获取仓库大屏上下两栏订单信息
     * @return
     */

    /*@PreAuthorize("@ss.hasPermi('screen:screen:storage')")*/
    @Anonymous
    @GetMapping("/screen/screen/storage")
    public List<MixOrders> selectScreenIndex()
    {
        return ordersService.selectScreenReady();
    }

    /*@PreAuthorize("@ss.hasPermi('screen:screen:warn')")*/
    @Anonymous
    @GetMapping("/screen/screen/warn")
    public List<MixOrders> selectWarnList()
    {
        return ordersService.selectWarnList();
    }








}

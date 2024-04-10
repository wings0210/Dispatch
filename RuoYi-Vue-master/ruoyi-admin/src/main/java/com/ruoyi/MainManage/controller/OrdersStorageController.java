package com.ruoyi.MainManage.controller;

import com.ruoyi.MainManage.domain.MixOrders;
import com.ruoyi.MainManage.domain.Orders;
import com.ruoyi.MainManage.service.IOrdersService;
import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.other_manage.domain.Car;
import com.ruoyi.other_manage.domain.Component;
import com.ruoyi.other_manage.domain.Station;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

/**
 * 订单处理Controller
 *
 * @author CaiYang
 * @date 2024-03-01
 */
@RestController
public class OrdersStorageController extends BaseController
{
    @Autowired
    private IOrdersService ordersService;

    /**
     * 查询订单处理列表
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:list')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/list")
    public TableDataInfo list(Orders orders)
    {
        startPage();
        List<Orders> list = ordersService.selectOrdersList(orders);
        return getDataTable(list);
    }

    /**
     * 导出订单处理列表
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:export')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.EXPORT)
    @PostMapping("/MainManage/ordersStorage/export")
    public void export(HttpServletResponse response, Orders orders)
    {
        List<Orders> list = ordersService.selectOrdersList(orders);
        ExcelUtil<Orders> util = new ExcelUtil<Orders>(Orders.class);
        util.exportExcel(response, list, "订单处理数据");
    }

    /**
     * 获取订单处理详细信息
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:query')")*/
    @Anonymous
    @GetMapping(value = "/MainManage/ordersStorage/{orderId}")
    public AjaxResult getInfo(@PathVariable("orderId") Long orderId)
    {
        return success(ordersService.selectOrdersByOrderId(orderId));
    }

    /**
     * 新增订单处理
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:add')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.INSERT)
    @PostMapping("/MainManage/ordersStorage")
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
   /* @PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:edit')")*/
    @Anonymous
    @Log(title = "订单处理", businessType = BusinessType.UPDATE)
    @PutMapping("/MainManage/ordersStorage")
    public AjaxResult edit(@RequestBody Orders orders)
    {

        LocalDateTime localDateTime = LocalDateTime.now();
        Date currentDate = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
        orders.setCreateTime(currentDate);
        return toAjax(ordersService.updateOrders(orders));
    }



    /**
     * 加载动态下拉框内容
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:getStation')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/getStation")
    public List<Station> selectStation()
    {
        return ordersService.selectStation();
    }


    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:getComponent')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/getComponent")
    public List<Component> selectComponent()
    {
        return ordersService.selectComponent();
    }

    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:getCar')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/getCar")
    public List<Car> selectCar()
    {
        return ordersService.selectCar();
    }


    /**
     * 获取界面上的异常订单信息
     * @return
     */

    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:getSpecOrders')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/getSpecOrders")
    public List<MixOrders> selectErrorOrders()
    {
        return ordersService.selectErrorOrders();
    }



    /**
     * 获取仓库的处理订单信息
     * @param orders
     * @return
     */
    /*@PreAuthorize("@ss.hasPermi('MainManage:ordersStorage:Storage')")*/
    @Anonymous
    @GetMapping("/MainManage/ordersStorage/Storage")
    public TableDataInfo selectStorage(Orders orders){
        startPage();
        List<MixOrders> list = ordersService.selectStorage( orders);
        return getDataTable(list);
    }



}

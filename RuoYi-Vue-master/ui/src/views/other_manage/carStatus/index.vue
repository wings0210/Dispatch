<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="车辆vin码" prop="carName">
        <el-input
          v-model="queryParams.carName"
          placeholder="请输入车辆vin码"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
<!--      <el-form-item label="door_lock" prop="doorLock">
        <el-input
          v-model="queryParams.doorLock"
          placeholder="请输入door_lock"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="high_beem" prop="highBeem">
        <el-input
          v-model="queryParams.highBeem"
          placeholder="请输入high_beem"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="hazard_ltiO" prop="hazardLtio">
        <el-input
          v-model="queryParams.hazardLtio"
          placeholder="请输入hazard_ltiO"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="low_beem" prop="lowBeem">
        <el-input
          v-model="queryParams.lowBeem"
          placeholder="请输入low_beem"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="sys_pow_mode" prop="sysPowMode">
        <el-input
          v-model="queryParams.sysPowMode"
          placeholder="请输入sys_pow_mode"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="windows" prop="windows">
        <el-input
          v-model="queryParams.windows"
          placeholder="请输入windows"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="windscreen_wiper" prop="windscreenWiper">
        <el-input
          v-model="queryParams.windscreenWiper"
          placeholder="请输入windscreen_wiper"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="angle" prop="angle">
        <el-input
          v-model="queryParams.angle"
          placeholder="请输入angle"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="buttonA" prop="buttonA">
        <el-input
          v-model="queryParams.buttonA"
          placeholder="请输入buttonA"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="control_mode" prop="controlMode">
        <el-input
          v-model="queryParams.controlMode"
          placeholder="请输入control_mode"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="coor_system" prop="coorSystem">
        <el-input
          v-model="queryParams.coorSystem"
          placeholder="请输入coor_system"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="current_stop" prop="currentStop">
        <el-input
          v-model="queryParams.currentStop"
          placeholder="请输入current_stop"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="emergency_button" prop="emergencyButton">
        <el-input
          v-model="queryParams.emergencyButton"
          placeholder="请输入emergency_button"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="fault_code" prop="faultCode">
        <el-input
          v-model="queryParams.faultCode"
          placeholder="请输入fault_code"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="fault_desc" prop="faultDesc">
        <el-input
          v-model="queryParams.faultDesc"
          placeholder="请输入fault_desc"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="gears" prop="gears">
        <el-input
          v-model="queryParams.gears"
          placeholder="请输入gears"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="location_stop" prop="locationStop">
        <el-input
          v-model="queryParams.locationStop"
          placeholder="请输入location_stop"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="location_veh" prop="locationVeh">
        <el-input
          v-model="queryParams.locationVeh"
          placeholder="请输入location_veh"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="max_speed" prop="maxSpeed">
        <el-input
          v-model="queryParams.maxSpeed"
          placeholder="请输入max_speed"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="os_version" prop="osVersion">
        <el-input
          v-model="queryParams.osVersion"
          placeholder="请输入os_version"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="route_name" prop="routeName">
        <el-input
          v-model="queryParams.routeName"
          placeholder="请输入route_name"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="route_stop" prop="routeStop">
        <el-input
          v-model="queryParams.routeStop"
          placeholder="请输入route_stop"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="routes_version" prop="routesVersion">
        <el-input
          v-model="queryParams.routesVersion"
          placeholder="请输入routes_version"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="signal_car" prop="signalCar">
        <el-input
          v-model="queryParams.signalCar"
          placeholder="请输入signal_car"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="soc" prop="soc">
        <el-input
          v-model="queryParams.soc"
          placeholder="请输入soc"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="speed" prop="speed">
        <el-input
          v-model="queryParams.speed"
          placeholder="请输入speed"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="timestamp" prop="timestamp">
        <el-date-picker clearable
          v-model="queryParams.timestamp"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择timestamp">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="tire_pressure" prop="tirePressure">
        <el-input
          v-model="queryParams.tirePressure"
          placeholder="请输入tire_pressure"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="trip_distance" prop="tripDistance">
        <el-input
          v-model="queryParams.tripDistance"
          placeholder="请输入trip_distance"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="trip_eta" prop="tripEta">
        <el-input
          v-model="queryParams.tripEta"
          placeholder="请输入trip_eta"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="trip_left_mileage" prop="tripLeftMileage">
        <el-input
          v-model="queryParams.tripLeftMileage"
          placeholder="请输入trip_left_mileage"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['other_manage:carStatus:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['other_manage:carStatus:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['other_manage:carStatus:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['other_manage:carStatus:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="carStatusList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="记录编号" align="center" prop="id" />
      <el-table-column label="车辆vin码" align="center" prop="carName" />
      <el-table-column label="door_lock" align="center" prop="doorLock" />
      <el-table-column label="high_beem" align="center" prop="highBeem" />
      <el-table-column label="hazard_ltiO" align="center" prop="hazardLtio" />
      <el-table-column label="low_beem" align="center" prop="lowBeem" />
      <el-table-column label="sys_pow_mode" align="center" prop="sysPowMode" />
      <el-table-column label="windows" align="center" prop="windows" />
      <el-table-column label="windscreen_wiper" align="center" prop="windscreenWiper" />
      <el-table-column label="angle" align="center" prop="angle" />
      <el-table-column label="buttonA" align="center" prop="buttonA" />
      <el-table-column label="control_mode" align="center" prop="controlMode" />
      <el-table-column label="coor_system" align="center" prop="coorSystem" />
      <el-table-column label="current_stop" align="center" prop="currentStop" />
      <el-table-column label="emergency_button" align="center" prop="emergencyButton" />
      <el-table-column label="fault_code" align="center" prop="faultCode" />
      <el-table-column label="fault_desc" align="center" prop="faultDesc" />
      <el-table-column label="gears" align="center" prop="gears" />
      <el-table-column label="location_stop" align="center" prop="locationStop" />
      <el-table-column label="location_veh" align="center" prop="locationVeh" />
      <el-table-column label="max_speed" align="center" prop="maxSpeed" />
      <el-table-column label="os_version" align="center" prop="osVersion" />
      <el-table-column label="route_name" align="center" prop="routeName" />
      <el-table-column label="route_stop" align="center" prop="routeStop" />
      <el-table-column label="routes_version" align="center" prop="routesVersion" />
      <el-table-column label="signal_car" align="center" prop="signalCar" />
      <el-table-column label="soc" align="center" prop="soc" />
      <el-table-column label="speed" align="center" prop="speed" />
      <el-table-column label="timestamp" align="center" prop="timestamp" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.timestamp, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="tire_pressure" align="center" prop="tirePressure" />
      <el-table-column label="trip_distance" align="center" prop="tripDistance" />
      <el-table-column label="trip_eta" align="center" prop="tripEta" />
      <el-table-column label="trip_left_mileage" align="center" prop="tripLeftMileage" />
      <el-table-column label="veh_status" align="center" prop="vehStatus" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['other_manage:carStatus:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['other_manage:carStatus:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改车辆状态对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="车辆vin码" prop="carName">
          <el-input v-model="form.carName" placeholder="请输入车辆vin码" />
        </el-form-item>
        <el-form-item label="door_lock" prop="doorLock">
          <el-input v-model="form.doorLock" placeholder="请输入door_lock" />
        </el-form-item>
        <el-form-item label="high_beem" prop="highBeem">
          <el-input v-model="form.highBeem" placeholder="请输入high_beem" />
        </el-form-item>
        <el-form-item label="hazard_ltiO" prop="hazardLtio">
          <el-input v-model="form.hazardLtio" placeholder="请输入hazard_ltiO" />
        </el-form-item>
        <el-form-item label="low_beem" prop="lowBeem">
          <el-input v-model="form.lowBeem" placeholder="请输入low_beem" />
        </el-form-item>
        <el-form-item label="sys_pow_mode" prop="sysPowMode">
          <el-input v-model="form.sysPowMode" placeholder="请输入sys_pow_mode" />
        </el-form-item>
        <el-form-item label="windows" prop="windows">
          <el-input v-model="form.windows" placeholder="请输入windows" />
        </el-form-item>
        <el-form-item label="windscreen_wiper" prop="windscreenWiper">
          <el-input v-model="form.windscreenWiper" placeholder="请输入windscreen_wiper" />
        </el-form-item>
        <el-form-item label="angle" prop="angle">
          <el-input v-model="form.angle" placeholder="请输入angle" />
        </el-form-item>
        <el-form-item label="buttonA" prop="buttonA">
          <el-input v-model="form.buttonA" placeholder="请输入buttonA" />
        </el-form-item>
        <el-form-item label="control_mode" prop="controlMode">
          <el-input v-model="form.controlMode" placeholder="请输入control_mode" />
        </el-form-item>
        <el-form-item label="coor_system" prop="coorSystem">
          <el-input v-model="form.coorSystem" placeholder="请输入coor_system" />
        </el-form-item>
        <el-form-item label="current_stop" prop="currentStop">
          <el-input v-model="form.currentStop" placeholder="请输入current_stop" />
        </el-form-item>
        <el-form-item label="emergency_button" prop="emergencyButton">
          <el-input v-model="form.emergencyButton" placeholder="请输入emergency_button" />
        </el-form-item>
        <el-form-item label="fault_code" prop="faultCode">
          <el-input v-model="form.faultCode" placeholder="请输入fault_code" />
        </el-form-item>
        <el-form-item label="fault_desc" prop="faultDesc">
          <el-input v-model="form.faultDesc" placeholder="请输入fault_desc" />
        </el-form-item>
        <el-form-item label="gears" prop="gears">
          <el-input v-model="form.gears" placeholder="请输入gears" />
        </el-form-item>
        <el-form-item label="location_stop" prop="locationStop">
          <el-input v-model="form.locationStop" placeholder="请输入location_stop" />
        </el-form-item>
        <el-form-item label="location_veh" prop="locationVeh">
          <el-input v-model="form.locationVeh" placeholder="请输入location_veh" />
        </el-form-item>
        <el-form-item label="max_speed" prop="maxSpeed">
          <el-input v-model="form.maxSpeed" placeholder="请输入max_speed" />
        </el-form-item>
        <el-form-item label="os_version" prop="osVersion">
          <el-input v-model="form.osVersion" placeholder="请输入os_version" />
        </el-form-item>
        <el-form-item label="route_name" prop="routeName">
          <el-input v-model="form.routeName" placeholder="请输入route_name" />
        </el-form-item>
        <el-form-item label="route_stop" prop="routeStop">
          <el-input v-model="form.routeStop" placeholder="请输入route_stop" />
        </el-form-item>
        <el-form-item label="routes_version" prop="routesVersion">
          <el-input v-model="form.routesVersion" placeholder="请输入routes_version" />
        </el-form-item>
        <el-form-item label="signal_car" prop="signalCar">
          <el-input v-model="form.signalCar" placeholder="请输入signal_car" />
        </el-form-item>
        <el-form-item label="soc" prop="soc">
          <el-input v-model="form.soc" placeholder="请输入soc" />
        </el-form-item>
        <el-form-item label="speed" prop="speed">
          <el-input v-model="form.speed" placeholder="请输入speed" />
        </el-form-item>
        <el-form-item label="timestamp" prop="timestamp">
          <el-date-picker clearable
            v-model="form.timestamp"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择timestamp">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="tire_pressure" prop="tirePressure">
          <el-input v-model="form.tirePressure" placeholder="请输入tire_pressure" />
        </el-form-item>
        <el-form-item label="trip_distance" prop="tripDistance">
          <el-input v-model="form.tripDistance" placeholder="请输入trip_distance" />
        </el-form-item>
        <el-form-item label="trip_eta" prop="tripEta">
          <el-input v-model="form.tripEta" placeholder="请输入trip_eta" />
        </el-form-item>
        <el-form-item label="trip_left_mileage" prop="tripLeftMileage">
          <el-input v-model="form.tripLeftMileage" placeholder="请输入trip_left_mileage" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listCarStatus, getCarStatus, delCarStatus, addCarStatus, updateCarStatus } from "@/api/other_manage/carStatus";

export default {
  name: "CarStatus",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 车辆状态表格数据
      carStatusList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        carName: null,
        doorLock: null,
        highBeem: null,
        hazardLtio: null,
        lowBeem: null,
        sysPowMode: null,
        windows: null,
        windscreenWiper: null,
        angle: null,
        buttonA: null,
        controlMode: null,
        coorSystem: null,
        currentStop: null,
        emergencyButton: null,
        faultCode: null,
        faultDesc: null,
        gears: null,
        locationStop: null,
        locationVeh: null,
        maxSpeed: null,
        osVersion: null,
        routeName: null,
        routeStop: null,
        routesVersion: null,
        signalCar: null,
        soc: null,
        speed: null,
        timestamp: null,
        tirePressure: null,
        tripDistance: null,
        tripEta: null,
        tripLeftMileage: null,
        vehStatus: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        carName: [
          { required: true, message: "车辆vin码不能为空", trigger: "blur" }
        ],
        doorLock: [
          { required: true, message: "door_lock不能为空", trigger: "blur" }
        ],
        highBeem: [
          { required: true, message: "high_beem不能为空", trigger: "blur" }
        ],
        hazardLtio: [
          { required: true, message: "hazard_ltiO不能为空", trigger: "blur" }
        ],
        lowBeem: [
          { required: true, message: "low_beem不能为空", trigger: "blur" }
        ],
        sysPowMode: [
          { required: true, message: "sys_pow_mode不能为空", trigger: "blur" }
        ],
        windows: [
          { required: true, message: "windows不能为空", trigger: "blur" }
        ],
        windscreenWiper: [
          { required: true, message: "windscreen_wiper不能为空", trigger: "blur" }
        ],
        angle: [
          { required: true, message: "angle不能为空", trigger: "blur" }
        ],
        buttonA: [
          { required: true, message: "buttonA不能为空", trigger: "blur" }
        ],
        controlMode: [
          { required: true, message: "control_mode不能为空", trigger: "blur" }
        ],
        coorSystem: [
          { required: true, message: "coor_system不能为空", trigger: "blur" }
        ],
        currentStop: [
          { required: true, message: "current_stop不能为空", trigger: "blur" }
        ],
        emergencyButton: [
          { required: true, message: "emergency_button不能为空", trigger: "blur" }
        ],
        faultCode: [
          { required: true, message: "fault_code不能为空", trigger: "blur" }
        ],
        faultDesc: [
          { required: true, message: "fault_desc不能为空", trigger: "blur" }
        ],
        gears: [
          { required: true, message: "gears不能为空", trigger: "blur" }
        ],
        locationStop: [
          { required: true, message: "location_stop不能为空", trigger: "blur" }
        ],
        locationVeh: [
          { required: true, message: "location_veh不能为空", trigger: "blur" }
        ],
        maxSpeed: [
          { required: true, message: "max_speed不能为空", trigger: "blur" }
        ],
        osVersion: [
          { required: true, message: "os_version不能为空", trigger: "blur" }
        ],
        routeName: [
          { required: true, message: "route_name不能为空", trigger: "blur" }
        ],
        routeStop: [
          { required: true, message: "route_stop不能为空", trigger: "blur" }
        ],
        routesVersion: [
          { required: true, message: "routes_version不能为空", trigger: "blur" }
        ],
        signalCar: [
          { required: true, message: "signal_car不能为空", trigger: "blur" }
        ],
        soc: [
          { required: true, message: "soc不能为空", trigger: "blur" }
        ],
        speed: [
          { required: true, message: "speed不能为空", trigger: "blur" }
        ],
        timestamp: [
          { required: true, message: "timestamp不能为空", trigger: "blur" }
        ],
        tirePressure: [
          { required: true, message: "tire_pressure不能为空", trigger: "blur" }
        ],
        tripDistance: [
          { required: true, message: "trip_distance不能为空", trigger: "blur" }
        ],
        tripEta: [
          { required: true, message: "trip_eta不能为空", trigger: "blur" }
        ],
        tripLeftMileage: [
          { required: true, message: "trip_left_mileage不能为空", trigger: "blur" }
        ],
        vehStatus: [
          { required: true, message: "veh_status不能为空", trigger: "change" }
        ]
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询车辆状态列表 */
    getList() {
      this.loading = true;
      listCarStatus(this.queryParams).then(response => {
        this.carStatusList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        carName: null,
        doorLock: null,
        highBeem: null,
        hazardLtio: null,
        lowBeem: null,
        sysPowMode: null,
        windows: null,
        windscreenWiper: null,
        angle: null,
        buttonA: null,
        controlMode: null,
        coorSystem: null,
        currentStop: null,
        emergencyButton: null,
        faultCode: null,
        faultDesc: null,
        gears: null,
        locationStop: null,
        locationVeh: null,
        maxSpeed: null,
        osVersion: null,
        routeName: null,
        routeStop: null,
        routesVersion: null,
        signalCar: null,
        soc: null,
        speed: null,
        timestamp: null,
        tirePressure: null,
        tripDistance: null,
        tripEta: null,
        tripLeftMileage: null,
        vehStatus: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加车辆状态";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getCarStatus(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改车辆状态";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCarStatus(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCarStatus(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除车辆状态编号为"' + ids + '"的数据项？').then(function() {
        return delCarStatus(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('other_manage/carStatus/export', {
        ...this.queryParams
      }, `carStatus_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>

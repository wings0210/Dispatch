-- MySQL dump 10.13  Distrib 5.7.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ry
-- ------------------------------------------------------
-- Server version	5.7.42-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `QRTZ_BLOB_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_BLOB_TRIGGERS`
--

LOCK TABLES `QRTZ_BLOB_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_BLOB_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CALENDARS`
--

DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CALENDARS`
--

LOCK TABLES `QRTZ_CALENDARS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CALENDARS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_CRON_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_CRON_TRIGGERS`
--

LOCK TABLES `QRTZ_CRON_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_CRON_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_FIRED_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_FIRED_TRIGGERS`
--

LOCK TABLES `QRTZ_FIRED_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_FIRED_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_JOB_DETAILS`
--

DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_JOB_DETAILS`
--

LOCK TABLES `QRTZ_JOB_DETAILS` WRITE;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_JOB_DETAILS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_LOCKS`
--

DROP TABLE IF EXISTS `QRTZ_LOCKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_LOCKS`
--

LOCK TABLES `QRTZ_LOCKS` WRITE;
/*!40000 ALTER TABLE `QRTZ_LOCKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_LOCKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_PAUSED_TRIGGER_GRPS`
--

LOCK TABLES `QRTZ_PAUSED_TRIGGER_GRPS` WRITE;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_PAUSED_TRIGGER_GRPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SCHEDULER_STATE`
--

DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SCHEDULER_STATE`
--

LOCK TABLES `QRTZ_SCHEDULER_STATE` WRITE;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SCHEDULER_STATE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPLE_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPLE_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPLE_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPLE_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_SIMPROP_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_SIMPROP_TRIGGERS`
--

LOCK TABLES `QRTZ_SIMPROP_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_SIMPROP_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QRTZ_TRIGGERS`
--

DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QRTZ_TRIGGERS`
--

LOCK TABLES `QRTZ_TRIGGERS` WRITE;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` DISABLE KEYS */;
/*!40000 ALTER TABLE `QRTZ_TRIGGERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆id',
  `car_type` varchar(255) DEFAULT NULL COMMENT '车辆类型',
  `car_detail` varchar(255) DEFAULT NULL COMMENT '车辆描述',
  `car_name` varchar(255) DEFAULT NULL COMMENT '车辆编号名称',
  `car_status` int(11) NOT NULL COMMENT '车辆使用状态',
  `car_route_name` varchar(255) DEFAULT NULL COMMENT '车辆所属线路',
  PRIMARY KEY (`car_id`),
  UNIQUE KEY `car_pk` (`car_name`),
  KEY `car_route_route_name_fk` (`car_route_name`),
  CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='车辆信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'bus','小型化','XXHPT1D2022101833',1,'th_1'),(2,'suv','小型化','XXHPT1D2022101846',1,'th_1');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_status`
--

DROP TABLE IF EXISTS `car_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录编号',
  `car_name` varchar(255) NOT NULL COMMENT '车辆vin码',
  `door_lock` int(11) DEFAULT NULL COMMENT '门锁',
  `high_beem` int(11) DEFAULT NULL COMMENT '远光灯',
  `hazard_ltiO` int(11) DEFAULT NULL COMMENT '预警灯',
  `low_beem` int(11) DEFAULT NULL COMMENT '近光灯',
  `sys_pow_mode` varchar(255) DEFAULT NULL,
  `windows` int(11) DEFAULT NULL COMMENT '窗户',
  `windscreen_wiper` int(11) DEFAULT NULL COMMENT '雨刮',
  `angle` double DEFAULT NULL COMMENT '角度方向',
  `buttonA` int(11) DEFAULT NULL,
  `control_mode` int(11) DEFAULT NULL COMMENT '控制模式',
  `coor_system` int(11) DEFAULT NULL,
  `current_stop` varchar(255) DEFAULT NULL COMMENT '当前站点',
  `emergency_button` int(11) DEFAULT NULL COMMENT '紧急按钮',
  `fault_code` int(11) DEFAULT NULL COMMENT '异常编码',
  `fault_desc` varchar(255) DEFAULT NULL COMMENT '异常描述',
  `gears` varchar(255) DEFAULT NULL COMMENT '档位',
  `location_stop` varchar(255) DEFAULT NULL COMMENT '定位站点',
  `location_veh` varchar(255) DEFAULT NULL COMMENT '车辆定位信息',
  `max_speed` double DEFAULT NULL,
  `os_version` int(11) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL COMMENT '线路名称',
  `route_stop` varchar(255) DEFAULT NULL COMMENT '线路站点',
  `routes_version` int(11) DEFAULT NULL COMMENT '线路版本',
  `signal_car` int(11) DEFAULT NULL,
  `soc` double DEFAULT NULL COMMENT '电量',
  `speed` double DEFAULT NULL COMMENT '当前速度',
  `timestamp` datetime NOT NULL COMMENT '上报时间戳',
  `tire_pressure` double DEFAULT NULL COMMENT '胎压',
  `trip_distance` double DEFAULT NULL COMMENT '行程总距离',
  `trip_eta` int(11) DEFAULT NULL,
  `trip_left_mileage` double DEFAULT NULL COMMENT '剩余里程',
  `veh_status` int(11) DEFAULT NULL COMMENT '车辆状态',
  PRIMARY KEY (`id`),
  KEY `car_status_car_car_name_fk` (`car_name`),
  CONSTRAINT `car_status_car_car_name_fk` FOREIGN KEY (`car_name`) REFERENCES `car` (`car_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7312 DEFAULT CHARSET=utf8 COMMENT='车辆状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_status`
--

LOCK TABLES `car_status` WRITE;
/*!40000 ALTER TABLE `car_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `component_name` varchar(255) NOT NULL COMMENT '物料零件名称',
  `component_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物料零件编号',
  `component_type` int(11) NOT NULL COMMENT '物料零件类型',
  `view` varchar(255) DEFAULT NULL COMMENT '物料零件图片',
  `weight` double DEFAULT NULL COMMENT '零件重量',
  `length` double DEFAULT NULL COMMENT '零件长度',
  `wide` double DEFAULT NULL COMMENT '零件宽度',
  `tall` double DEFAULT NULL COMMENT '零件高度',
  PRIMARY KEY (`component_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='物料表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('A',1,1,'/log/1.jpg',12,12,12,12);
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (10,'car_status','车辆状态表',NULL,NULL,'CarStatus','crud','element-ui','com.ruoyi.other_manage','other_manage','carStatus','车辆状态','CaiYang','0','/','{\"parentMenuId\":\"1065\"}','admin','2024-04-03 14:46:40','','2024-04-03 17:57:52','实时车辆信息表'),(11,'route','线路表',NULL,NULL,'Route','crud','element-ui','com.ruoyi.other_manage','other_manage','route','线路','CaiYang','0','/','{\"parentMenuId\":1065}','admin','2024-04-03 14:46:40','','2024-04-03 14:58:22','线路表'),(12,'route_info','线路信息表',NULL,NULL,'RouteInfo','crud','element-ui','com.ruoyi.other_manage','other_manage','routeInfo','线路信息','CaiYang','0','/','{\"parentMenuId\":1065}','admin','2024-04-03 14:46:40','','2024-04-03 14:59:29','线路详细信息表'),(13,'station_info','站点详细信息表',NULL,NULL,'StationInfo','crud','element-ui','com.ruoyi.other_manage','other_manage','stationInfo','站点详细信息','CaiYang','0','/','{\"parentMenuId\":1065}','admin','2024-04-03 14:46:40','','2024-04-03 15:00:42','站点详细信息表');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (77,10,'id','记录编号','int(11)','Long','id','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(78,10,'car_name','车辆vin码','varchar(255)','String','carName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(79,10,'door_lock','door_lock','int(11)','Long','doorLock','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(80,10,'high_beem','high_beem','int(11)','Long','highBeem','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(81,10,'hazard_ltiO','hazard_ltiO','int(11)','Long','hazardLtio','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(82,10,'low_beem','low_beem','int(11)','Long','lowBeem','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(83,10,'sys_pow_mode','sys_pow_mode','varchar(255)','String','sysPowMode','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(84,10,'windows','windows','int(11)','Long','windows','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(85,10,'windscreen_wiper','windscreen_wiper','int(11)','Long','windscreenWiper','0','0','0','1','1','1','1','EQ','input','',9,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(86,10,'angle','angle','double','Long','angle','0','0','0','1','1','1','1','EQ','input','',10,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(87,10,'buttonA','buttonA','int(11)','Long','buttonA','0','0','0','1','1','1','1','EQ','input','',11,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(88,10,'control_mode','control_mode','int(11)','Long','controlMode','0','0','0','1','1','1','1','EQ','input','',12,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(89,10,'coor_system','coor_system','int(11)','Long','coorSystem','0','0','0','1','1','1','1','EQ','input','',13,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(90,10,'current_stop','current_stop','varchar(255)','String','currentStop','0','0','0','1','1','1','1','EQ','input','',14,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(91,10,'emergency_button','emergency_button','int(11)','Long','emergencyButton','0','0','0','1','1','1','1','EQ','input','',15,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(92,10,'fault_code','fault_code','int(11)','Long','faultCode','0','0','0','1','1','1','1','EQ','input','',16,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(93,10,'fault_desc','fault_desc','varchar(255)','String','faultDesc','0','0','0','1','1','1','1','EQ','input','',17,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(94,10,'gears','gears','varchar(255)','String','gears','0','0','0','1','1','1','1','EQ','input','',18,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(95,10,'location_stop','location_stop','varchar(255)','String','locationStop','0','0','0','1','1','1','1','EQ','input','',19,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(96,10,'location_veh','location_veh','varchar(255)','String','locationVeh','0','0','0','1','1','1','1','EQ','input','',20,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(97,10,'max_speed','max_speed','double','Long','maxSpeed','0','0','0','1','1','1','1','EQ','input','',21,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(98,10,'os_version','os_version','int(11)','Long','osVersion','0','0','0','1','1','1','1','EQ','input','',22,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(99,10,'route_name','route_name','varchar(255)','String','routeName','0','0','0','1','1','1','1','LIKE','input','',23,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(100,10,'route_stop','route_stop','varchar(255)','String','routeStop','0','0','0','1','1','1','1','EQ','input','',24,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(101,10,'routes_version','routes_version','int(11)','Long','routesVersion','0','0','0','1','1','1','1','EQ','input','',25,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(102,10,'signal_car','signal_car','int(11)','Long','signalCar','0','0','0','1','1','1','1','EQ','input','',26,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(103,10,'soc','soc','double','Long','soc','0','0','0','1','1','1','1','EQ','input','',27,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(104,10,'speed','speed','double','Long','speed','0','0','0','1','1','1','1','EQ','input','',28,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(105,10,'timestamp','timestamp','datetime','Date','timestamp','0','0','1','1','1','1','1','EQ','datetime','',29,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(106,10,'tire_pressure','tire_pressure','double','Long','tirePressure','0','0','0','1','1','1','1','EQ','input','',30,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(107,10,'trip_distance','trip_distance','double','Long','tripDistance','0','0','0','1','1','1','1','EQ','input','',31,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(108,10,'trip_eta','trip_eta','int(11)','Long','tripEta','0','0','0','1','1','1','1','EQ','input','',32,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(109,10,'trip_left_mileage','trip_left_mileage','double','Long','tripLeftMileage','0','0','0','1','1','1','1','EQ','input','',33,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(110,10,'veh_status','veh_status','int(11)','Long','vehStatus','0','0','0','1','1','1','1','EQ','radio','',34,'admin','2024-04-03 14:46:40','','2024-04-03 17:57:52'),(111,11,'route_id','线路id','int(11)','Long','routeId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-03 14:46:40','','2024-04-03 14:58:22'),(112,11,'route_name','线路名称','varchar(255)','String','routeName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-04-03 14:46:40','','2024-04-03 14:58:22'),(113,11,'center_long','中心点经度','double','Long','centerLong','0','0','0','1','1','1','1','EQ','input','',3,'admin','2024-04-03 14:46:40','','2024-04-03 14:58:22'),(114,11,'center_lat','中心点纬度','double','Long','centerLat','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-04-03 14:46:40','','2024-04-03 14:58:22'),(115,12,'point_id','点集id','int(11)','Long','pointId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-03 14:46:40','','2024-04-03 14:59:29'),(116,12,'route_id','外键id','int(11)','Long','routeId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-04-03 14:46:40','','2024-04-03 14:59:29'),(117,12,'lon','点经度','double','Long','lon','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-04-03 14:46:40','','2024-04-03 14:59:29'),(118,12,'lat','点纬度','double','Long','lat','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-04-03 14:46:40','','2024-04-03 14:59:29'),(119,13,'info_id','id','int(11)','Long','infoId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42'),(120,13,'station_name','关联主表的外键','varchar(255)','String','stationName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42'),(121,13,'lon','站点经度','double','Long','lon','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42'),(122,13,'lat','站点纬度','double','Long','lat','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42'),(123,13,'azi','站点方向角度','double','Long','azi','0','0','1','1','1','1','1','EQ','input','',5,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42'),(124,13,'belong_route_name','关联线路外键','varchar(255)','String','belongRouteName','0','0','1','1','1','1','1','LIKE','input','',6,'admin','2024-04-03 14:46:40','','2024-04-03 15:00:42');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `component_id` int(11) NOT NULL COMMENT '物料编号',
  `station_id` int(11) NOT NULL COMMENT '订单所属站点编号',
  `order_status` int(11) NOT NULL COMMENT '订单状态',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `number` int(11) NOT NULL COMMENT '物料数量',
  `car_id` int(11) DEFAULT NULL COMMENT '分配车辆编号',
  PRIMARY KEY (`order_id`),
  KEY `station_id` (`station_id`),
  KEY `component_id` (`component_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`station_id`) REFERENCES `station` (`station_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`component_id`) REFERENCES `component` (`component_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`car_id`) REFERENCES `car` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,3,2,'2024-04-16 14:52:35',12,1),(40,1,3,2,'2024-04-16 14:52:43',1,1),(41,1,2,2,'2024-04-16 14:53:05',1,1),(42,1,3,2,'2024-04-16 14:53:17',1,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '线路id',
  `route_name` varchar(255) NOT NULL COMMENT '线路名称',
  `center_long` double DEFAULT NULL COMMENT '中心点经度',
  `center_lat` double DEFAULT NULL COMMENT '中心点纬度',
  PRIMARY KEY (`route_id`),
  UNIQUE KEY `route_pk` (`route_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='线路表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,'th_1',97.23,34.6);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route_info`
--

DROP TABLE IF EXISTS `route_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route_info` (
  `point_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点集id',
  `route_id` int(11) NOT NULL COMMENT '外键id',
  `lon` double NOT NULL COMMENT '点经度',
  `lat` double NOT NULL COMMENT '点纬度',
  PRIMARY KEY (`point_id`),
  KEY `route_info_route_route_id_fk` (`route_id`),
  CONSTRAINT `route_info_route_route_id_fk` FOREIGN KEY (`route_id`) REFERENCES `route` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线路信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route_info`
--

LOCK TABLES `route_info` WRITE;
/*!40000 ALTER TABLE `route_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `route_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `station_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '站点id',
  `station_name` varchar(255) NOT NULL COMMENT '站点名称',
  PRIMARY KEY (`station_id`),
  UNIQUE KEY `station_pk` (`station_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES (1,'A下料站'),(2,'B下料站'),(3,'C上料站'),(4,'D下料站'),(5,'E上料站'),(6,'F上料点'),(7,'G下料站'),(9,'H下料站'),(10,'I下料站'),(11,'J下料站'),(12,'K下料站'),(100,'仓库站'),(101,'充电站');
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_info`
--

DROP TABLE IF EXISTS `station_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `station_name` varchar(255) NOT NULL COMMENT '关联主表的外键',
  `lon` double NOT NULL COMMENT '站点经度',
  `lat` double NOT NULL COMMENT '站点纬度',
  `azi` double NOT NULL COMMENT '站点方向角度',
  `belong_route_name` varchar(255) NOT NULL COMMENT '关联线路外键',
  PRIMARY KEY (`info_id`),
  KEY `station_info_route_route_name_fk` (`belong_route_name`),
  KEY `station_info_station_station_name_fk` (`station_name`),
  CONSTRAINT `station_info_route_route_name_fk` FOREIGN KEY (`belong_route_name`) REFERENCES `route` (`route_name`),
  CONSTRAINT `station_info_station_station_name_fk` FOREIGN KEY (`station_name`) REFERENCES `station` (`station_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='站点详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_info`
--

LOCK TABLES `station_info` WRITE;
/*!40000 ALTER TABLE `station_info` DISABLE KEYS */;
INSERT INTO `station_info` VALUES (2,'仓库站',120.784532,25.89765784,34.8,'th_1'),(3,'充电站',123.567804,35.12356754,45.2,'th_1');
/*!40000 ALTER TABLE `station_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-01-04 17:02:02','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-01-04 17:02:02','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-01-04 17:02:02','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2024-01-04 17:02:02','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-01-04 17:02:02','admin','2024-03-07 17:40:42','是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-01-04 17:02:02','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-04 17:02:02','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-01-04 17:02:02','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-01-04 17:02:02','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-01-04 17:02:02','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-01-04 17:02:02','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-01-04 17:02:02','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-01-04 17:02:02','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-01-04 17:02:02','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-01-04 17:02:02','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-01-04 17:02:02','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-01-04 17:02:02','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-01-04 17:02:02','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-01-04 17:02:02','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-01-04 17:02:02','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-01-04 17:02:02','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-01-04 17:02:02','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-01-04 17:02:02','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-01-04 17:02:02','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-01-04 17:02:02','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-01-04 17:02:02','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-01-04 17:02:02','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-01-04 17:02:02','',NULL,'停用状态'),(30,0,'硬质材料','1','component_type',NULL,'success','N','0','admin','2024-02-21 15:16:12','',NULL,NULL),(31,1,'软质材料','2','component_type',NULL,'success','N','0','admin','2024-02-21 15:16:39','',NULL,NULL),(32,0,'等待装货','1','order_status',NULL,'warning','N','0','admin','2024-03-01 18:15:05','admin','2024-03-07 10:46:41',NULL),(33,1,'正在运输','2','order_status',NULL,'primary','N','0','admin','2024-03-01 18:15:36','admin','2024-03-01 18:15:49',NULL),(34,2,'订单异常','3','order_status',NULL,'danger','N','0','admin','2024-03-01 18:16:45','',NULL,NULL),(35,3,'订单完成','4','order_status',NULL,'success','N','0','admin','2024-03-01 18:17:20','',NULL,NULL),(36,0,'car1','1','car_select',NULL,'info','N','0','admin','2024-03-01 18:19:44','',NULL,NULL),(37,1,'car2','2','car_select',NULL,'info','N','0','admin','2024-03-01 18:20:04','',NULL,NULL),(38,0,'站点A','1','station_select',NULL,'success','N','0','admin','2024-03-01 18:23:05','',NULL,NULL),(39,1,'站点B','2','station_select',NULL,'success','N','0','admin','2024-03-01 18:23:24','',NULL,NULL),(40,2,'站点C','3','station_select',NULL,'success','N','0','admin','2024-03-01 18:23:41','',NULL,NULL),(41,3,'站点D','4','station_select',NULL,'success','N','0','admin','2024-03-01 18:23:56','',NULL,NULL),(42,4,'站点E','5','station_select',NULL,'success','N','0','admin','2024-03-01 18:24:07','',NULL,NULL),(43,5,'站点F','6','station_select',NULL,'success','N','0','admin','2024-03-01 18:24:25','',NULL,NULL),(44,6,'站点G','7','station_select',NULL,'success','N','0','admin','2024-03-01 18:24:43','',NULL,NULL),(45,0,'零件1','1','component_select',NULL,'success','N','0','admin','2024-03-01 18:27:31','',NULL,NULL),(46,1,'零件2','2','component_select',NULL,'success','N','0','admin','2024-03-01 18:27:44','',NULL,NULL),(47,2,'零件3','3','component_select',NULL,'success','N','0','admin','2024-03-01 18:27:55','',NULL,NULL),(48,3,'零件4','4','component_select',NULL,'success','N','0','admin','2024-03-01 18:28:07','',NULL,NULL),(49,4,'零件5','5','component_select',NULL,'success','N','0','admin','2024-03-01 18:28:24','',NULL,NULL),(50,5,'零件6','6','component_select',NULL,'success','N','0','admin','2024-03-01 18:28:39','',NULL,NULL),(51,0,'完成订单','4','line_edit',NULL,'success','N','0','admin','2024-03-07 10:28:06','admin','2024-03-07 10:57:59','流水线'),(52,0,'正在运输','2','storage_edit',NULL,'primary','N','0','admin','2024-03-07 10:32:18','admin','2024-03-07 10:59:07','仓库'),(53,0,'等待装货','1','line_add',NULL,'warning','N','0','admin','2024-03-07 10:34:36','admin','2024-03-07 10:59:19','新增');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-01-04 17:02:02','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-01-04 17:02:02','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-01-04 17:02:02','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-01-04 17:02:02','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-01-04 17:02:02','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-01-04 17:02:02','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-01-04 17:02:02','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-01-04 17:02:02','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-01-04 17:02:02','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-01-04 17:02:02','',NULL,'登录状态列表'),(11,'物料类型','component_type','0','admin','2024-02-21 15:15:13','admin','2024-03-01 18:20:55','物料类型映射'),(12,'订单状态','order_status','0','admin','2024-03-01 18:14:06','',NULL,'订单状态码'),(13,'车辆选择','car_select','0','admin','2024-03-01 18:18:21','',NULL,'车辆选择映射'),(14,'站点选择','station_select','0','admin','2024-03-01 18:21:50','',NULL,'站点选择映射'),(15,'物料选择','component_select','0','admin','2024-03-01 18:26:33','admin','2024-03-01 18:26:56','物料零件选择映射'),(17,'流水线订单状态修改','line_edit','0','admin','2024-03-07 10:26:02','admin','2024-03-07 11:03:35','流水线订单映射'),(18,'仓库订单状态修改','storage_edit','0','admin','2024-03-07 10:27:31','admin','2024-03-07 11:03:41','仓库订单映射'),(19,'流水线新增订单','line_add','0','admin','2024-03-07 10:33:49','admin','2024-03-07 11:03:53','新增订单映射');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-01-04 17:02:02','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-01-04 17:02:02','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-01-04 17:02:02','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (1,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 10:57:11'),(2,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 10:58:19'),(3,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 10:58:33'),(4,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 11:38:50'),(5,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 11:41:35'),(6,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 11:41:44'),(7,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 13:39:52'),(8,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 13:40:02'),(9,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 13:40:48'),(10,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 13:40:53'),(11,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 13:41:12'),(12,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 13:41:19'),(13,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 13:46:28'),(14,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 13:46:34'),(15,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 13:53:11'),(16,'admin','192.168.201.61','内网IP','Chrome Mobile','Android 1.x','0','登录成功','2024-03-08 14:05:41'),(17,'admin','192.168.201.61','内网IP','Chrome Mobile','Android 1.x','0','退出成功','2024-03-08 14:07:36'),(18,'admin','192.168.201.61','内网IP','Chrome Mobile','Android 1.x','0','登录成功','2024-03-08 14:07:45'),(19,'admin','192.168.201.61','内网IP','Chrome Mobile','Android 1.x','0','退出成功','2024-03-08 14:27:02'),(20,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 17:05:13'),(21,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 17:09:43'),(22,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 17:09:48'),(23,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-08 17:09:52'),(24,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-08 17:32:12'),(25,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码错误','2024-03-11 10:42:20'),(26,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-11 10:42:26'),(27,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-11 10:44:58'),(28,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-11 10:45:13'),(29,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-14 11:37:16'),(30,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码已失效','2024-03-14 15:05:02'),(31,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-14 15:05:07'),(32,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-14 15:08:46'),(33,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-14 15:08:51'),(34,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码错误','2024-03-15 09:47:13'),(35,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 09:47:18'),(36,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 09:47:27'),(37,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 09:47:40'),(38,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 09:47:57'),(39,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 09:48:17'),(40,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 09:48:42'),(41,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 09:48:56'),(42,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 10:12:24'),(43,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 10:12:33'),(44,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 10:19:36'),(45,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 10:19:45'),(46,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 10:19:55'),(47,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 10:22:27'),(48,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 10:22:40'),(49,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 10:23:52'),(50,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 10:23:58'),(51,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 11:07:50'),(52,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:42:29'),(53,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:42:59'),(54,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:43:04'),(55,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:44:47'),(56,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:44:53'),(57,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:45:19'),(58,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:45:24'),(59,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:45:36'),(60,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:45:40'),(61,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:45:57'),(62,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:46:03'),(63,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:47:10'),(64,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:47:18'),(65,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-15 13:55:21'),(66,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-15 13:55:30'),(67,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-19 13:57:44'),(68,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-19 13:58:11'),(69,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-19 13:58:27'),(70,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 13:55:03'),(71,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 13:56:06'),(72,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 13:56:12'),(73,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:02:11'),(74,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:02:17'),(75,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:02:44'),(76,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:02:56'),(77,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:03:18'),(78,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:03:27'),(79,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:04:03'),(80,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:04:09'),(81,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:43:46'),(82,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:45:02'),(83,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:46:00'),(84,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:46:04'),(85,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:46:28'),(86,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:46:31'),(87,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:46:46'),(88,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:46:50'),(89,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:48:33'),(90,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:48:38'),(91,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 14:54:42'),(92,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 14:54:56'),(93,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 15:54:57'),(94,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码已失效','2024-03-20 16:06:09'),(95,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 16:06:13'),(96,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 16:14:19'),(97,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 16:14:41'),(98,'pad2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 16:16:06'),(99,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 16:16:11'),(100,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 16:17:17'),(101,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 16:17:26'),(102,'screen','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-20 17:31:27'),(103,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-20 17:31:47'),(104,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-21 13:26:18'),(105,'pad1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-21 13:26:22'),(106,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-21 13:26:46'),(107,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-21 14:04:33'),(108,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-21 14:04:45'),(109,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-21 14:05:02'),(110,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-21 14:06:26'),(111,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-21 14:06:33'),(112,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-22 11:00:49'),(113,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-22 15:14:13'),(114,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-22 15:14:25'),(115,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-22 15:25:35'),(116,'storge','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','用户不存在/密码错误','2024-03-22 15:25:48'),(117,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-22 15:26:03'),(118,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-22 15:27:52'),(119,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-22 15:27:58'),(120,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-22 17:15:03'),(121,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-22 17:15:19'),(122,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 10:05:31'),(123,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 11:24:44'),(124,'station_3','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','用户不存在/密码错误','2024-03-23 11:25:01'),(125,'station_3','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','用户不存在/密码错误','2024-03-23 11:25:13'),(126,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 11:25:30'),(127,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 11:25:49'),(128,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 11:26:05'),(129,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 11:27:05'),(130,'station_3','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 11:27:21'),(131,'station_3','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 11:36:02'),(132,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 11:40:57'),(133,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 13:24:14'),(134,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码已失效','2024-03-23 13:28:18'),(135,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 13:28:23'),(136,'station_2','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-03-23 13:56:25'),(137,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-03-23 13:56:38'),(138,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-01 11:29:18'),(139,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-01 13:40:51'),(140,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-03 14:31:32'),(141,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-03 17:56:30'),(142,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-07 17:47:51'),(143,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 10:14:37'),(144,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 14:50:44'),(145,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 14:51:33'),(146,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 14:51:45'),(147,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 15:13:30'),(148,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 15:13:39'),(149,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 15:17:15'),(150,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 15:17:26'),(151,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 15:43:48'),(152,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 15:44:10'),(153,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 15:44:37'),(154,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','1','验证码已失效','2024-04-08 16:14:33'),(155,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 16:14:39'),(156,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 16:20:39'),(157,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 16:20:50'),(158,'storge_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-08 16:22:54'),(159,'station_1','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-08 16:23:04'),(160,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-11 10:34:19'),(161,'station_1','192.168.152.89','内网IP','Chrome Mobile','Android 1.x','1','用户不存在/密码错误','2024-04-11 10:40:35'),(162,'station_1','192.168.152.89','内网IP','Chrome Mobile','Android 1.x','1','验证码错误','2024-04-11 10:41:35'),(163,'station_1','192.168.152.89','内网IP','Chrome Mobile','Android 1.x','0','登录成功','2024-04-11 10:41:40'),(164,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-12 11:32:47'),(165,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','退出成功','2024-04-12 13:12:16'),(166,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-12 13:12:28'),(167,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-15 10:02:22'),(168,'admin','127.0.0.1','内网IP','Firefox 11','Ubuntu','0','登录成功','2024-04-16 13:44:18');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1195 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-01-04 17:02:02','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-01-04 17:02:02','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-01-04 17:02:02','',NULL,'系统工具目录'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-01-04 17:02:02','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-01-04 17:02:02','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-01-04 17:02:02','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-01-04 17:02:02','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-01-04 17:02:02','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-01-04 17:02:02','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-01-04 17:02:02','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-01-04 17:02:02','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-01-04 17:02:02','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-01-04 17:02:02','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-01-04 17:02:02','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-01-04 17:02:02','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-01-04 17:02:02','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-01-04 17:02:02','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-01-04 17:02:02','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-01-04 17:02:02','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-01-04 17:02:02','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-01-04 17:02:02','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-01-04 17:02:02','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-01-04 17:02:02','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-01-04 17:02:02','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-01-04 17:02:02','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-01-04 17:02:02','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-01-04 17:02:02','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-01-04 17:02:02','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-01-04 17:02:02','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-01-04 17:02:02','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-01-04 17:02:02','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-01-04 17:02:02','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-01-04 17:02:02','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-01-04 17:02:02','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-01-04 17:02:02','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-01-04 17:02:02','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-01-04 17:02:02','',NULL,''),(1061,'云端调度',0,0,'cloud_dispatch',NULL,NULL,1,0,'M','0','0','','server','admin','2024-01-16 14:44:17','admin','2024-01-16 14:46:23',''),(1062,'运营数据',0,4,'data_sta',NULL,NULL,1,0,'M','0','0','','chart','admin','2024-01-16 14:46:01','admin','2024-02-21 16:12:18',''),(1063,'订单管理',0,5,'MainManage',NULL,NULL,1,0,'M','0','0','','monitor','admin','2024-02-20 14:09:52','admin','2024-03-01 13:38:16',''),(1064,'大屏数据显示',0,6,'screen',NULL,NULL,1,0,'M','0','0',NULL,'phone','admin','2024-02-20 14:11:24','',NULL,''),(1065,'其他数据管理',0,7,'other_manage',NULL,NULL,1,0,'M','0','0','','list','admin','2024-02-21 15:21:24','admin','2024-02-21 16:10:36',''),(1096,'站点管理',1065,1,'station','other_manage/station/index',NULL,1,0,'C','0','0','other_manage:station:list','#','admin','2024-02-21 17:53:09','',NULL,'站点管理菜单'),(1097,'站点管理查询',1096,1,'#','',NULL,1,0,'F','0','0','other_manage:station:query','#','admin','2024-02-21 17:53:09','',NULL,''),(1098,'站点管理新增',1096,2,'#','',NULL,1,0,'F','0','0','other_manage:station:add','#','admin','2024-02-21 17:53:09','',NULL,''),(1099,'站点管理修改',1096,3,'#','',NULL,1,0,'F','0','0','other_manage:station:edit','#','admin','2024-02-21 17:53:09','',NULL,''),(1100,'站点管理删除',1096,4,'#','',NULL,1,0,'F','0','0','other_manage:station:remove','#','admin','2024-02-21 17:53:09','',NULL,''),(1101,'站点管理导出',1096,5,'#','',NULL,1,0,'F','0','0','other_manage:station:export','#','admin','2024-02-21 17:53:09','',NULL,''),(1102,'订单信息',1064,0,'screen','screen/index',NULL,1,0,'C','0','0','screen:list','#','admin','2024-02-22 17:48:35','admin','2024-03-04 13:47:25',''),(1133,'流水线订单',1063,1,'ordersAssemblyLine','MainManage/orders/index',NULL,1,0,'C','0','0','MainManage:ordersAssemblyLine:list','#','admin','2024-03-01 16:44:54','admin','2024-03-04 14:21:46','订单处理菜单'),(1134,'订单处理查询',1133,1,'#','',NULL,1,0,'F','0','0','MainManage:orders:query','#','admin','2024-03-01 16:44:54','',NULL,''),(1135,'订单处理新增',1133,2,'#','',NULL,1,0,'F','0','0','MainManage:orders:add','#','admin','2024-03-01 16:44:54','',NULL,''),(1136,'订单处理修改',1133,3,'#','',NULL,1,0,'F','0','0','MainManage:orders:edit','#','admin','2024-03-01 16:44:54','',NULL,''),(1137,'订单处理删除',1133,4,'#','',NULL,1,0,'F','0','0','MainManage:orders:remove','#','admin','2024-03-01 16:44:54','',NULL,''),(1138,'订单处理导出',1133,5,'#','',NULL,1,0,'F','0','0','MainManage:orders:export','#','admin','2024-03-01 16:44:54','',NULL,''),(1151,'物料管理',1065,1,'component','other_manage/component/index',NULL,1,0,'C','0','0','other_manage:component:list','#','admin','2024-03-02 14:47:09','',NULL,'物料管理菜单'),(1152,'物料管理查询',1151,1,'#','',NULL,1,0,'F','0','0','other_manage:component:query','#','admin','2024-03-02 14:47:09','',NULL,''),(1153,'物料管理新增',1151,2,'#','',NULL,1,0,'F','0','0','other_manage:component:add','#','admin','2024-03-02 14:47:09','',NULL,''),(1154,'物料管理修改',1151,3,'#','',NULL,1,0,'F','0','0','other_manage:component:edit','#','admin','2024-03-02 14:47:09','',NULL,''),(1155,'物料管理删除',1151,4,'#','',NULL,1,0,'F','0','0','other_manage:component:remove','#','admin','2024-03-02 14:47:09','',NULL,''),(1156,'物料管理导出',1151,5,'#','',NULL,1,0,'F','0','0','other_manage:component:export','#','admin','2024-03-02 14:47:09','',NULL,''),(1157,'仓库订单',1063,2,'ordersStorage','MainManage/orders/index_c1',NULL,1,0,'C','0','0','MainManage:ordersStorage:list','#','admin','2024-03-04 13:37:47','admin','2024-04-01 11:39:44',''),(1158,'车辆管理',1065,1,'car','other_manage/car/index',NULL,1,0,'C','0','0','other_manage:car:list','#','admin','2024-03-22 17:27:59','admin','2024-03-22 17:36:37','车辆信息菜单'),(1159,'车辆信息查询',1158,1,'#','',NULL,1,0,'F','0','0','other_manage:car:query','#','admin','2024-03-22 17:27:59','',NULL,''),(1160,'车辆信息新增',1158,2,'#','',NULL,1,0,'F','0','0','other_manage:car:add','#','admin','2024-03-22 17:27:59','',NULL,''),(1161,'车辆信息修改',1158,3,'#','',NULL,1,0,'F','0','0','other_manage:car:edit','#','admin','2024-03-22 17:27:59','',NULL,''),(1162,'车辆信息删除',1158,4,'#','',NULL,1,0,'F','0','0','other_manage:car:remove','#','admin','2024-03-22 17:27:59','',NULL,''),(1163,'车辆信息导出',1158,5,'#','',NULL,1,0,'F','0','0','other_manage:car:export','#','admin','2024-03-22 17:27:59','',NULL,''),(1164,'临时调度',1061,1,'OrderTransport','OrderTransport/dispatch',NULL,1,0,'C','0','0','cloud_dispatch:OrderTransport:list','button','admin','2024-04-01 11:30:50','admin','2024-04-01 11:53:26',''),(1171,'线路详细信息',1065,1,'routeInfo','other_manage/routeInfo/index',NULL,1,0,'C','0','0','other_manage:routeInfo:list','#','admin','2024-04-03 15:05:22','admin','2024-04-03 15:16:17','线路信息菜单'),(1172,'线路信息查询',1171,1,'#','',NULL,1,0,'F','0','0','other_manage:routeInfo:query','#','admin','2024-04-03 15:05:22','',NULL,''),(1173,'线路信息新增',1171,2,'#','',NULL,1,0,'F','0','0','other_manage:routeInfo:add','#','admin','2024-04-03 15:05:22','',NULL,''),(1174,'线路信息修改',1171,3,'#','',NULL,1,0,'F','0','0','other_manage:routeInfo:edit','#','admin','2024-04-03 15:05:22','',NULL,''),(1175,'线路信息删除',1171,4,'#','',NULL,1,0,'F','0','0','other_manage:routeInfo:remove','#','admin','2024-04-03 15:05:22','',NULL,''),(1176,'线路信息导出',1171,5,'#','',NULL,1,0,'F','0','0','other_manage:routeInfo:export','#','admin','2024-04-03 15:05:22','',NULL,''),(1177,'线路管理',1065,1,'route','other_manage/route/index',NULL,1,0,'C','0','0','other_manage:route:list','#','admin','2024-04-03 15:05:30','admin','2024-04-03 15:16:07','线路菜单'),(1178,'线路查询',1177,1,'#','',NULL,1,0,'F','0','0','other_manage:route:query','#','admin','2024-04-03 15:05:30','',NULL,''),(1179,'线路新增',1177,2,'#','',NULL,1,0,'F','0','0','other_manage:route:add','#','admin','2024-04-03 15:05:30','',NULL,''),(1180,'线路修改',1177,3,'#','',NULL,1,0,'F','0','0','other_manage:route:edit','#','admin','2024-04-03 15:05:30','',NULL,''),(1181,'线路删除',1177,4,'#','',NULL,1,0,'F','0','0','other_manage:route:remove','#','admin','2024-04-03 15:05:30','',NULL,''),(1182,'线路导出',1177,5,'#','',NULL,1,0,'F','0','0','other_manage:route:export','#','admin','2024-04-03 15:05:30','',NULL,''),(1183,'站点详细信息',1065,1,'stationInfo','other_manage/stationInfo/index',NULL,1,0,'C','0','0','other_manage:stationInfo:list','#','admin','2024-04-03 15:05:37','',NULL,'站点详细信息菜单'),(1184,'站点详细信息查询',1183,1,'#','',NULL,1,0,'F','0','0','other_manage:stationInfo:query','#','admin','2024-04-03 15:05:37','',NULL,''),(1185,'站点详细信息新增',1183,2,'#','',NULL,1,0,'F','0','0','other_manage:stationInfo:add','#','admin','2024-04-03 15:05:37','',NULL,''),(1186,'站点详细信息修改',1183,3,'#','',NULL,1,0,'F','0','0','other_manage:stationInfo:edit','#','admin','2024-04-03 15:05:37','',NULL,''),(1187,'站点详细信息删除',1183,4,'#','',NULL,1,0,'F','0','0','other_manage:stationInfo:remove','#','admin','2024-04-03 15:05:37','',NULL,''),(1188,'站点详细信息导出',1183,5,'#','',NULL,1,0,'F','0','0','other_manage:stationInfo:export','#','admin','2024-04-03 15:05:37','',NULL,''),(1189,'车辆状态',1065,1,'carStatus','other_manage/carStatus/index',NULL,1,0,'C','0','0','other_manage:carStatus:list','#','admin','2024-04-03 15:22:28','',NULL,'车辆状态菜单'),(1190,'车辆状态查询',1189,1,'#','',NULL,1,0,'F','0','0','other_manage:carStatus:query','#','admin','2024-04-03 15:22:28','',NULL,''),(1191,'车辆状态新增',1189,2,'#','',NULL,1,0,'F','0','0','other_manage:carStatus:add','#','admin','2024-04-03 15:22:28','',NULL,''),(1192,'车辆状态修改',1189,3,'#','',NULL,1,0,'F','0','0','other_manage:carStatus:edit','#','admin','2024-04-03 15:22:28','',NULL,''),(1193,'车辆状态删除',1189,4,'#','',NULL,1,0,'F','0','0','other_manage:carStatus:remove','#','admin','2024-04-03 15:22:28','',NULL,''),(1194,'车辆状态导出',1189,5,'#','',NULL,1,0,'F','0','0','other_manage:carStatus:export','#','admin','2024-04-03 15:22:28','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.ruoyi.web.controller.monitor.SysOperlogController.clean()','DELETE',1,'admin','研发部门','/monitor/operlog/clean','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:40:54',14),(2,'登录日志',9,'com.ruoyi.web.controller.monitor.SysLogininforController.clean()','DELETE',1,'admin','研发部门','/monitor/logininfor/clean','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-07 17:41:01',11),(3,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'pad1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-15 13:42:44\",\"number\":12,\"orderId\":21,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-15 13:42:44',13),(4,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'pad2',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-15 13:42:45\",\"number\":12,\"orderId\":21,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-15 13:45:33',8),(5,'站点管理',2,'com.ruoyi.other_manage.controller.StationController.edit()','PUT',1,'admin','研发部门','/other_manage/station','127.0.0.1','内网IP','{\"params\":{},\"stationId\":7,\"stationName\":\"I下料点\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-19 14:18:44',11),(6,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士0\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士0\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士0\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士0\' \n        where car_id = 1\' at line 4','2024-03-19 14:26:14',41),(7,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"fg\",\"carName\":\"rt\",\"carType\":\"d\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:31:13',2),(8,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"fg\",\"carName\":\"rt\",\"carType\":\"d\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:33:10',1),(9,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'admin','研发部门','/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-19 14:38:37\",\"number\":45,\"orderId\":23,\"orderStatus\":1,\"params\":{},\"stationId\":6}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-19 14:38:37',22),(10,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4','2024-03-19 14:39:05',29),(11,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4','2024-03-19 14:39:10',2),(12,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"43\",\"carName\":\"556\",\"carType\":\"12\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:41:28',2),(13,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"43\",\"carName\":\"556\",\"carType\":\"12\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:41:32',1),(14,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"443\",\"carName\":\"5545\",\"carType\":\"3\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:42:47',10),(15,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"443\",\"carName\":\"5545\",\"carType\":\"3\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:42:52',1),(16,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"443\",\"carName\":\"5545\",\"carType\":\"3\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:42:57',2),(17,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"443\",\"carName\":\"5545\",\"carType\":\"3\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:43:00',1),(18,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士9\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士9\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士9\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士9\' \n        where car_id = 1\' at line 4','2024-03-19 14:47:01',30),(19,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"990\",\"carName\":\"898\",\"carType\":\"78\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 14:47:11',1),(20,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"3\",\"carName\":\"24\",\"carType\":\"45\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 15:18:08',10),(21,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"3\",\"carName\":\"24\",\"carType\":\"45\",\"params\":{}}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'car_name\' in \'class com.ruoyi.other_manage.domain.Car\'','2024-03-19 15:18:12',3),(22,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4','2024-03-19 15:20:05',19074),(23,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,              car_name = ?             car_detail = ?          where car_id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'car_detail = \'巴士\' \n        where car_id = 1\' at line 4','2024-03-19 15:22:51',88963),(24,'车辆信息管理',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carType\":\"bus\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-19 15:29:02',12),(25,'车辆信息管理',1,'com.ruoyi.other_manage.controller.CarController.add()','POST',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"23\",\"carId\":2,\"carName\":\"45\",\"carType\":\"2\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-19 15:29:11',20),(26,'车辆信息管理',3,'com.ruoyi.other_manage.controller.CarController.remove()','DELETE',1,'admin','研发部门','/other_manage/car/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-19 15:29:13',12),(27,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'pad1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 14:02:35\",\"number\":13,\"orderId\":24,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 14:02:35',10),(28,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'pad2',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 14:02:35\",\"number\":13,\"orderId\":24,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 14:03:59',9),(29,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'pad1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 14:02:35\",\"number\":13,\"orderId\":24,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 14:04:17',6),(30,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'pad1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-20 16:14:11\",\"number\":12,\"orderId\":25,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 16:14:11',16),(31,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'pad2',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 16:14:12\",\"number\":12,\"orderId\":25,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 16:15:57',10),(32,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'pad1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 16:14:12\",\"number\":12,\"orderId\":25,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-20 16:16:23',9),(33,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:27:33',29),(34,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/8','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:27:36',10),(35,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"station_1\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":9,\"userName\":\"s1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:28:14',76),(36,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"station_2\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":10,\"userName\":\"s2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:28:35',76),(37,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/9','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:29:06',12),(38,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/10','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:29:11',11),(39,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s1\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":11,\"userName\":\"station_1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:29:27',79),(40,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s2\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":12,\"userName\":\"station_2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:29:45',78),(41,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s3\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":13,\"userName\":\"staion_3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:30:08',81),(42,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s4\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":14,\"userName\":\"station_4\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:30:24',78),(43,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s5\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":15,\"userName\":\"station_5\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:30:44',77),(44,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s6\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":16,\"userName\":\"station_6\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:30:59',78),(45,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"t1\",\"params\":{},\"postIds\":[],\"roleIds\":[4],\"status\":\"0\",\"userId\":17,\"userName\":\"storge_1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 13:31:48',81),(46,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-21 14:05:19\",\"number\":12,\"orderId\":26,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 14:05:19',10),(47,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-21 14:06:42\",\"number\":78,\"orderId\":27,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 14:06:42',9),(48,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-21 14:33:56',9),(49,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 11:01:41\",\"number\":35,\"orderId\":30,\"orderStatus\":4,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 11:04:07',7),(50,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 11:42:28\",\"number\":56,\"orderId\":32,\"orderStatus\":2,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 12:00:29',8),(51,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 11:42:28\",\"number\":56,\"orderId\":32,\"orderStatus\":4,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 12:00:34',9),(52,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 13:35:57\",\"number\":1,\"orderId\":33,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 13:35:57',9),(53,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 14:05:42\",\"number\":5,\"orderId\":34,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 14:05:42',7),(54,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 15:08:15\",\"number\":1,\"orderId\":35,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 15:08:15',21),(55,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 15:08:37\",\"number\":6,\"orderId\":36,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 15:08:37',8),(56,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 15:09:19\",\"number\":11,\"orderId\":37,\"orderStatus\":1,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 15:09:19',8),(57,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_2',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-22 15:13:12\",\"number\":77,\"orderId\":38,\"orderStatus\":4,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 15:13:28',8),(58,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'storge_1',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":3,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 15:37:24',8),(59,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'storge_1',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 16:00:22',40),(60,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/1,3,2,4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:15:31',27),(61,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"car\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:15:41',28),(62,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/5','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:18:29',9),(63,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"car,station_info,route,car_status\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:20:22',97),(64,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"car\",\"className\":\"Car\",\"columns\":[{\"capJavaField\":\"CarId\",\"columnComment\":\"车辆id\",\"columnId\":27,\"columnName\":\"car_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-22 17:20:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"carId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarType\",\"columnComment\":\"车辆类型\",\"columnId\":28,\"columnName\":\"car_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-22 17:20:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"carType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarDetail\",\"columnComment\":\"车辆描述\",\"columnId\":29,\"columnName\":\"car_detail\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-22 17:20:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"carDetail\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆编号名称\",\"columnId\":30,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-22 17:20:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:23:19',38),(65,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"car\"}',NULL,0,NULL,'2024-03-22 17:23:24',137),(66,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"other_manage/car/index\",\"createTime\":\"2024-03-22 17:27:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1158,\"menuName\":\"车辆管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1065,\"path\":\"car\",\"perms\":\"other_manage:car:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:36:37',11),(67,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:38:59',8),(68,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carRouteName\":\"th_4\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,             car_detail = ?,             car_name = ?,             car_status = ?,             car_route_name = ?          where car_id = ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))','2024-03-22 17:44:13',37),(69,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carRouteName\":\"th_1\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:44:17',9),(70,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carRouteName\":\"th_4\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,             car_detail = ?,             car_name = ?,             car_status = ?,             car_route_name = ?          where car_id = ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))','2024-03-22 17:44:24',3),(71,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carRouteName\":\"th_2\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarMapper.updateCar-Inline\n### The error occurred while setting parameters\n### SQL: update car          SET car_type = ?,             car_detail = ?,             car_name = ?,             car_status = ?,             car_route_name = ?          where car_id = ?\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))\n; Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`)); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car`, CONSTRAINT `car_route_route_name_fk` FOREIGN KEY (`car_route_name`) REFERENCES `route` (`route_name`))','2024-03-22 17:44:32',5),(72,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"巴士\",\"carId\":1,\"carName\":\"XXHD001\",\"carRouteName\":\"th_1\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-22 17:44:34',4),(73,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 10:59:33',7),(74,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 14:02:35\",\"number\":13,\"orderId\":24,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 10:59:38',8),(75,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-21 14:05:19\",\"number\":12,\"orderId\":26,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 10:59:44',8),(76,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-20 16:14:12\",\"number\":12,\"orderId\":25,\"orderStatus\":3,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 10:59:49',9),(77,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:00:07',9),(78,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":10,\"orderId\":2,\"orderStatus\":2,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:00:14',9),(79,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-01 00:00:00\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:00:30',8),(80,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-23 11:21:35\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:21:35',15),(81,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-03-23 11:21:57\",\"number\":10,\"orderId\":2,\"orderStatus\":2,\"params\":{},\"stationId\":2}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:21:57',8),(82,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-23 11:22:20\",\"number\":13,\"orderId\":24,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:22:20',4),(83,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-23 11:21:35\",\"number\":12,\"orderId\":1,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:25:40',8),(84,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-03-23 11:22:20\",\"number\":13,\"orderId\":24,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:25:45',9),(85,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'admin','研发部门','/system/user/13','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:26:27',25),(86,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"s3\",\"params\":{},\"postIds\":[],\"roleIds\":[2],\"status\":\"0\",\"userId\":18,\"userName\":\"station_3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-03-23 11:26:44',86),(87,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1061,\"path\":\"/OrderTransport\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:30:50',13),(88,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:32:51',13),(89,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:38:56',19),(90,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:39:09',14),(91,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:39:41',10),(92,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"MainManage/orders/index_c1\",\"createTime\":\"2024-03-04 13:37:47\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1157,\"menuName\":\"仓库订单\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"ordersStorage\",\"perms\":\"MainManage:ordersStorage:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:39:44',13),(93,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"cloud_dispatch:OrderTransport:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:40:32',7),(94,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"/OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"cloud_dispatch:OrderTransport:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:43:21',11),(95,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"OrderTransport/dispatch\",\"createTime\":\"2024-04-01 11:30:50\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1164,\"menuName\":\"临时调度\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"OrderTransport\",\"perms\":\"cloud_dispatch:OrderTransport:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-01 11:53:26',5),(96,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/9','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:42:14',22),(97,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/8','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:42:17',10),(98,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:42:18',11),(99,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin','研发部门','/tool/gen/6','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:42:20',11),(100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"station_info,route_info,car_status,route\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:46:40',75),(101,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"status\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"门锁\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"远光灯\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"hig','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:51:46',39),(102,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"status\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:51:46\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:51:46\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"门锁\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:51:46\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"远光灯\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:56:47',32),(103,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"route\",\"className\":\"Route\",\"columns\":[{\"capJavaField\":\"RouteId\",\"columnComment\":\"线路id\",\"columnId\":111,\"columnName\":\"route_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"routeId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RouteName\",\"columnComment\":\"线路名称\",\"columnId\":112,\"columnName\":\"route_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"routeName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CenterLong\",\"columnComment\":\"中心点经度\",\"columnId\":113,\"columnName\":\"center_long\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"centerLong\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CenterLat\",\"columnComment\":\"中心点纬度\",\"columnId\":114,\"columnName\":\"center_lat\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"i','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:58:22',20),(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"routeInfo\",\"className\":\"RouteInfo\",\"columns\":[{\"capJavaField\":\"PointId\",\"columnComment\":\"点集id\",\"columnId\":115,\"columnName\":\"point_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"pointId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RouteId\",\"columnComment\":\"外键id\",\"columnId\":116,\"columnName\":\"route_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"routeId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Lon\",\"columnComment\":\"点经度\",\"columnId\":117,\"columnName\":\"lon\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"lon\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Lat\",\"columnComment\":\"点纬度\",\"columnId\":118,\"columnName\":\"lat\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"lat\",\"javaType\":\"Lo','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:59:29',14),(105,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carStatus\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:56:47\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:56:47\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"门锁\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:56:47\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"远光灯\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 14:59:44',36),(106,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"stationInfo\",\"className\":\"StationInfo\",\"columns\":[{\"capJavaField\":\"InfoId\",\"columnComment\":\"id\",\"columnId\":119,\"columnName\":\"info_id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"infoId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StationName\",\"columnComment\":\"关联主表的外键\",\"columnId\":120,\"columnName\":\"station_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"stationName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Lon\",\"columnComment\":\"站点经度\",\"columnId\":121,\"columnName\":\"lon\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"lon\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":13,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Lat\",\"columnComment\":\"站点纬度\",\"columnId\":122,\"columnName\":\"lat\",\"columnType\":\"double\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 15:00:42',13),(107,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"station_info,route_info,route,car_status\"}',NULL,0,NULL,'2024-04-03 15:00:50',83),(108,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carStatus\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:59:44\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:59:44\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"门锁\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 14:59:44\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"远光灯\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 15:14:49',82),(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"other_manage/route/index\",\"createTime\":\"2024-04-03 15:05:30\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1177,\"menuName\":\"线路管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1065,\"path\":\"route\",\"perms\":\"other_manage:route:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 15:16:07',14),(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"other_manage/routeInfo/index\",\"createTime\":\"2024-04-03 15:05:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1171,\"menuName\":\"线路详细信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1065,\"path\":\"routeInfo\",\"perms\":\"other_manage:routeInfo:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 15:16:17',10),(111,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carStatus\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:14:49\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:14:49\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"door_lock\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:14:49\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"high_beem\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":t','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 15:19:45',39),(112,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"car_status\"}',NULL,0,NULL,'2024-04-03 15:19:50',103),(113,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"carStatus\",\"className\":\"CarStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"记录编号\",\"columnId\":77,\"columnName\":\"id\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:19:45\",\"usableColumn\":false},{\"capJavaField\":\"CarName\",\"columnComment\":\"车辆vin码\",\"columnId\":78,\"columnName\":\"car_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"carName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:19:45\",\"usableColumn\":false},{\"capJavaField\":\"DoorLock\",\"columnComment\":\"door_lock\",\"columnId\":79,\"columnName\":\"door_lock\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"doorLock\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2024-04-03 15:19:45\",\"usableColumn\":false},{\"capJavaField\":\"HighBeem\",\"columnComment\":\"high_beem\",\"columnId\":80,\"columnName\":\"high_beem\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2024-04-03 14:46:40\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-03 17:57:52',67),(114,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"car_status\"}',NULL,0,NULL,'2024-04-03 17:57:55',107),(115,'车辆状态',1,'com.ruoyi.other_manage.controller.CarStatusController.add()','POST',1,'admin','研发部门','/other_manage/carStatus','127.0.0.1','内网IP','{\"angle\":8,\"buttonA\":9,\"carName\":\"1345\",\"controlMode\":10,\"coorSystem\":11,\"currentStop\":\"12\",\"doorLock\":1,\"emergencyButton\":11,\"faultCode\":11,\"faultDesc\":\"11\",\"gears\":\"11\",\"hazardLtio\":3,\"highBeem\":2,\"locationStop\":\"11\",\"locationVeh\":\"11\",\"lowBeem\":4,\"maxSpeed\":11,\"osVersion\":11,\"params\":{},\"routeName\":\"11\",\"routeStop\":\"11\",\"routesVersion\":11,\"signalCar\":11,\"soc\":11,\"speed\":11,\"sysPowMode\":\"5\",\"timestamp\":\"2024-04-07\",\"tirePressure\":11,\"tripDistance\":11,\"tripEta\":11,\"tripLeftMileage\":11,\"windows\":6,\"windscreenWiper\":7}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'default_value\' for column \'veh_status\' at row 1\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarStatusMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarStatusMapper.insertCarStatus-Inline\n### The error occurred while setting parameters\n### SQL: insert into car_status         (             car_name, door_lock, high_beem, hazard_ltio, low_beem, sys_pow_mode, windows, windscreen_wiper, angle, buttonA, control_mode, coor_system, current_stop, emergency_button, fault_desc, gears, location_stop, location_veh, max_speed, os_version, route_name, route_stop, routes_version, signal_car, soc, speed, timestamp, tire_pressure, trip_distance, trip_eta, trip_left_mileage, veh_status         )         values             (                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, 0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, \'default_value\'),                 COALESCE(?, \'default_value\'),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0.0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, \'default_value\'),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0),                 COALESCE(?, \'default_value\'),                 COALESCE(?, 0.0),                 COALESCE(?, 0.0),                 COALESCE(?, CURRENT_TIMESTAMP),                 COALESCE(?, 0.0),                ','2024-04-07 17:49:03',9),(116,'车辆状态',1,'com.ruoyi.other_manage.controller.CarStatusController.add()','POST',1,'admin','研发部门','/other_manage/carStatus','127.0.0.1','内网IP','{\"angle\":11,\"buttonA\":11,\"carName\":\"1234\",\"controlMode\":11,\"coorSystem\":11,\"currentStop\":\"11\",\"doorLock\":11,\"emergencyButton\":11,\"faultCode\":11,\"faultDesc\":\"11\",\"gears\":\"11\",\"hazardLtio\":11,\"highBeem\":11,\"locationStop\":\"11\",\"locationVeh\":\"11\",\"lowBeem\":11,\"maxSpeed\":11,\"osVersion\":11,\"params\":{},\"routeName\":\"11\",\"routeStop\":\"11\",\"routesVersion\":11,\"signalCar\":11,\"soc\":11,\"speed\":11,\"sysPowMode\":\"11\",\"timestamp\":\"2024-04-07\",\"tirePressure\":11,\"tripDistance\":11,\"tripEta\":11,\"tripLeftMileage\":11,\"windows\":11,\"windscreenWiper\":11}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car_status`, CONSTRAINT `car_status_car_car_name_fk` FOREIGN KEY (`car_name`) REFERENCES `car` (`car_name`))\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarStatusMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarStatusMapper.insertCarStatus-Inline\n### The error occurred while setting parameters\n### SQL: insert into car_status          ( car_name,             door_lock,             high_beem,             hazard_ltiO,             low_beem,             sys_pow_mode,             windows,             windscreen_wiper,             angle,             buttonA,             control_mode,             coor_system,             current_stop,             emergency_button,             fault_code,             fault_desc,             gears,             location_stop,             location_veh,             max_speed,             os_version,             route_name,             route_stop,             routes_version,             signal_car,             soc,             speed,             timestamp,             tire_pressure,             trip_distance,             trip_eta,             trip_left_mileage )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car_status`, CONSTRAIN','2024-04-07 17:50:12',9),(117,'车辆状态',1,'com.ruoyi.other_manage.controller.CarStatusController.add()','POST',1,'admin','研发部门','/other_manage/carStatus','127.0.0.1','内网IP','{\"angle\":11,\"buttonA\":11,\"carName\":\"1234\",\"controlMode\":11,\"coorSystem\":11,\"currentStop\":\"11\",\"doorLock\":11,\"emergencyButton\":11,\"faultCode\":11,\"faultDesc\":\"11\",\"gears\":\"11\",\"hazardLtio\":11,\"highBeem\":11,\"locationStop\":\"11\",\"locationVeh\":\"11\",\"lowBeem\":11,\"maxSpeed\":11,\"osVersion\":11,\"params\":{},\"routeName\":\"11\",\"routeStop\":\"11\",\"routesVersion\":11,\"signalCar\":11,\"soc\":11,\"speed\":11,\"sysPowMode\":\"11\",\"timestamp\":\"2024-04-07\",\"tirePressure\":11,\"tripDistance\":11,\"tripEta\":11,\"tripLeftMileage\":11,\"windows\":11,\"windscreenWiper\":11}',NULL,1,'\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car_status`, CONSTRAINT `car_status_car_car_name_fk` FOREIGN KEY (`car_name`) REFERENCES `car` (`car_name`))\n### The error may exist in file [/home/autolabor/work/RuoYi-Vue-master/ruoyi-admin/target/classes/mapper/other_manage/CarStatusMapper.xml]\n### The error may involve com.ruoyi.other_manage.mapper.CarStatusMapper.insertCarStatus-Inline\n### The error occurred while setting parameters\n### SQL: insert into car_status          ( car_name,             door_lock,             high_beem,             hazard_ltiO,             low_beem,             sys_pow_mode,             windows,             windscreen_wiper,             angle,             buttonA,             control_mode,             coor_system,             current_stop,             emergency_button,             fault_code,             fault_desc,             gears,             location_stop,             location_veh,             max_speed,             os_version,             route_name,             route_stop,             routes_version,             signal_car,             soc,             speed,             timestamp,             tire_pressure,             trip_distance,             trip_eta,             trip_left_mileage )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot add or update a child row: a foreign key constraint fails (`ry`.`car_status`, CONSTRAIN','2024-04-07 17:50:16',9),(118,'车辆状态',1,'com.ruoyi.other_manage.controller.CarStatusController.add()','POST',1,'admin','研发部门','/other_manage/carStatus','127.0.0.1','内网IP','{\"angle\":11,\"buttonA\":11,\"carName\":\"XXHPT1D2022101833\",\"controlMode\":11,\"coorSystem\":11,\"currentStop\":\"11\",\"doorLock\":11,\"emergencyButton\":11,\"faultCode\":11,\"faultDesc\":\"11\",\"gears\":\"11\",\"hazardLtio\":11,\"highBeem\":11,\"id\":21,\"locationStop\":\"11\",\"locationVeh\":\"11\",\"lowBeem\":11,\"maxSpeed\":11,\"osVersion\":11,\"params\":{},\"routeName\":\"11\",\"routeStop\":\"11\",\"routesVersion\":11,\"signalCar\":11,\"soc\":11,\"speed\":11,\"sysPowMode\":\"11\",\"timestamp\":\"2024-04-07\",\"tirePressure\":11,\"tripDistance\":11,\"tripEta\":11,\"tripLeftMileage\":11,\"windows\":11,\"windscreenWiper\":11}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-07 17:51:48',10),(119,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carId\":2,\"carName\":\"XXHPT1D2022101846\",\"carRouteName\":\"th_1\",\"carStatus\":1,\"carType\":\"suv\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 10:15:09',8),(120,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-08 15:17:10\",\"number\":1,\"orderId\":40,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 15:17:10',16),(121,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-08 16:20:31\",\"number\":1,\"orderId\":41,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:20:31',8),(122,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'storge_1',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:21:01\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:21:01',8),(123,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'storge_1',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:22:26\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:22:26',7),(124,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'storge_1',NULL,'/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:22:34\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:22:34',9),(125,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:22:27\",\"number\":12,\"orderId\":1,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:23:11',8),(126,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:22:34\",\"number\":1,\"orderId\":40,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:23:16',8),(127,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersController.edit()','PUT',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-08 16:21:02\",\"number\":1,\"orderId\":41,\"orderStatus\":4,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-08 16:23:22',8),(128,'订单处理',1,'com.ruoyi.MainManage.controller.OrdersController.add()','POST',1,'station_1',NULL,'/MainManage/ordersAssemblyLine','192.168.152.89','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-11 10:42:02\",\"number\":1,\"orderId\":42,\"orderStatus\":1,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 10:42:02',9),(129,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-11 10:48:52\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 10:48:52',4),(130,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-11 10:49:28\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 10:49:28',8),(131,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-11 11:03:30\",\"number\":1,\"orderId\":40,\"orderStatus\":3,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:03:30',8),(132,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-11 11:03:34\",\"number\":1,\"orderId\":41,\"orderStatus\":3,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-11 11:03:34',3),(133,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:33:20\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:33:20',7),(134,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:34:29\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:34:29',15),(135,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:35:33\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:35:33',9),(136,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:37:25\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:37:25',11),(137,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:39:39\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:39:39',8),(138,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:41:43\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:41:43',7),(139,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:42:43\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:42:43',4),(140,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:43:51\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:43:51',8),(141,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:46:45\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:46:45',3),(142,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:47:34\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:47:34',8),(143,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:51:03\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:51:03',8),(144,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 11:53:27\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 11:53:27',9),(145,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:07:29\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:07:29',101),(146,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:12:16\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:12:16',34),(147,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:14:02\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:14:02',11),(148,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:15:16\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:15:16',11),(149,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:25:23\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:25:23',59),(150,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:27:06\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:27:06',13),(151,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:57:20\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:57:20',20),(152,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:57:52\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:57:52',10),(153,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:58:36\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:58:36',4),(154,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 13:59:25\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 13:59:25',19),(155,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 14:17:04\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 14:17:04',54),(156,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 14:18:11\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 14:18:11',22),(157,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 14:18:18\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 14:18:18',11),(158,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 14:38:30\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 14:38:31',14),(159,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 14:44:21\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 14:44:21',9),(160,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-12 15:06:00\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-12 15:06:00',10),(161,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:02:34\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:02:34',6),(162,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:03:00\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:03:00',8),(163,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:04:47\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:04:47',58),(164,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:17:40\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:17:40',47),(165,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:22:09\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:22:12',2805),(166,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:25:19\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:25:20',1065),(167,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-15 10:46:36\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":1}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-15 10:46:36',16),(168,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"小型化\",\"carId\":1,\"carName\":\"XXHPT1D2022101833\",\"carRouteName\":\"th_1\",\"carStatus\":1,\"carType\":\"bus\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 13:45:31',6),(169,'车辆信息',2,'com.ruoyi.other_manage.controller.CarController.edit()','PUT',1,'admin','研发部门','/other_manage/car','127.0.0.1','内网IP','{\"carDetail\":\"小型化\",\"carId\":2,\"carName\":\"XXHPT1D2022101846\",\"carRouteName\":\"th_1\",\"carStatus\":1,\"carType\":\"suv\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 13:45:38',10),(170,'车辆状态',3,'com.ruoyi.other_manage.controller.CarStatusController.remove()','DELETE',1,'admin','研发部门','/other_manage/carStatus/7309,7310,7311','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 13:46:18',6),(171,'站点管理',3,'com.ruoyi.other_manage.controller.StationController.remove()','DELETE',1,'admin','研发部门','/other_manage/station/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:02:42',10),(172,'站点管理',1,'com.ruoyi.other_manage.controller.StationController.add()','POST',1,'admin','研发部门','/other_manage/station','127.0.0.1','内网IP','{\"params\":{},\"stationName\":\"G下料站\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:03:04',14),(173,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-16 14:52:34\",\"number\":12,\"orderId\":1,\"orderStatus\":2,\"params\":{},\"stationId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:52:34',10),(174,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"carId\":1,\"componentId\":1,\"createTime\":\"2024-04-16 14:52:42\",\"number\":1,\"orderId\":40,\"orderStatus\":2,\"params\":{},\"stationId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:52:42',2),(175,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-16 14:53:04\",\"number\":1,\"orderId\":41,\"orderStatus\":2,\"params\":{},\"stationId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:53:04',8),(176,'订单处理',2,'com.ruoyi.MainManage.controller.OrdersStorageController.edit()','PUT',1,'admin','研发部门','/MainManage/ordersStorage','127.0.0.1','内网IP','{\"componentId\":1,\"createTime\":\"2024-04-16 14:53:16\",\"number\":1,\"orderId\":42,\"orderStatus\":2,\"params\":{},\"stationId\":3}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-04-16 14:53:16',9);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-01-04 17:02:02','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-01-04 17:02:02','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-01-04 17:02:02','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-01-04 17:02:02','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-01-04 17:02:02','',NULL,'超级管理员'),(2,'pad终端用户-流水线','common_line',2,'2',1,1,'0','0','admin','2024-01-04 17:02:02','admin','2024-03-07 16:22:04','普通角色'),(3,'仓库大屏终端用户','common_sp',4,'1',1,1,'0','0','admin','2024-02-20 14:17:17','admin','2024-03-07 16:22:51','仓库大屏'),(4,'pad终端用户-仓库','common_storage',3,'1',1,1,'0','0','admin','2024-03-07 16:18:50','admin','2024-03-07 16:22:26',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1063),(2,1133),(2,1134),(2,1135),(2,1136),(2,1137),(2,1138),(3,1064),(3,1102),(4,1063),(4,1157);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'admin','dc','00','2402157991@qq.com','13253513067','0','/profile/avatar/2024/01/09/head_20240109180240A001.jpg','$2a$10$3dbRbFKwuJRhu1Rqba1wEeIEGQpV7m88Q5n.hkLCoU8rzjtDHctOq','0','0','127.0.0.1','2024-04-16 13:44:18','admin','2024-01-04 17:02:02','','2024-04-16 13:44:18','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','2','127.0.0.1','2024-01-04 17:02:02','admin','2024-01-04 17:02:02','',NULL,'测试员'),(3,NULL,'dc_c1','pad1','00','','','0','','$2a$10$HJXkI01GtFgXsM491WB1pez2vs/KqjgXHvKVXWAQX.BsQndwxwpii','0','2','',NULL,'admin','2024-02-20 14:21:20','',NULL,NULL),(4,NULL,'dc_c2','pad2','00','','','0','','$2a$10$xlbw7YCXNwzfJNIhIwcVS.Ixm1u476E3n5ndUs/62dxJZa4FxJTrS','0','2','',NULL,'admin','2024-02-20 14:21:42','',NULL,NULL),(5,NULL,'dc_c1','pad1','00','','','0','','$2a$10$kwFjLAR1G/JNclEtJNusHODCm0H5h2lo0Xjq5OWwRfiKy8753Zl2O','0','2','',NULL,'admin','2024-02-20 14:23:47','',NULL,NULL),(6,NULL,'screen','dc_s','00','','','0','','$2a$10$WZzYZSkgi8WGEPoy/z8UhuIM8k0k0fTX6eMEMSaz5oFbGjspJlRHm','0','0','127.0.0.1','2024-03-20 16:17:26','admin','2024-02-20 14:24:41','admin','2024-03-20 16:17:26',NULL),(7,NULL,'pad1','dc_c1','00','','','0','','$2a$10$C7mAVYikiV.ge8magkW9NuQqLm6a5.jUfHkdPexSUCpz/EooqNDcW','0','2','127.0.0.1','2024-03-21 13:26:18','admin','2024-02-20 14:25:01','admin','2024-03-21 13:26:18',NULL),(8,NULL,'pad2','dc_02','00','','','0','','$2a$10$2pAX8v0tyKkRXSpx67B/LOUoQ6F8HqBEEifSDu3kQSYjHf.evJfuO','0','2','127.0.0.1','2024-03-20 16:14:42','admin','2024-03-07 16:16:21','admin','2024-03-20 16:14:41',NULL),(9,NULL,'s1','station_1','00','','','0','','$2a$10$h1wN1gUj1eFRNXZe09qgzOHgTMPHx3yeDAJZEfhFqpCr0MMuyUrtq','0','2','',NULL,'admin','2024-03-21 13:28:14','',NULL,NULL),(10,NULL,'s2','station_2','00','','','0','','$2a$10$ml.PVoJlfk51mctEmxNk6.X5fPIzH8ZxNLRhlxDnDRWvpGkgh1KIa','0','2','',NULL,'admin','2024-03-21 13:28:35','',NULL,NULL),(11,NULL,'station_1','s1','00','','','0','','$2a$10$QaLsdbj.nNHqXAhjCnOXM.F5sKsYAovd9SuBeO5FKeQKKrsKG8AIu','0','0','192.168.152.89','2024-04-11 10:41:41','admin','2024-03-21 13:29:27','','2024-04-11 10:41:40',NULL),(12,NULL,'station_2','s2','00','','','0','','$2a$10$mJP/FuPKtDPVMBu8T9ijMuehGDliyYOOQtjSfynzR8MB4J68bps46','0','0','127.0.0.1','2024-03-23 13:28:23','admin','2024-03-21 13:29:45','','2024-03-23 13:28:23',NULL),(13,NULL,'staion_3','s3','00','','','0','','$2a$10$D915YdWf0D62rIglyeg2Qe4vbF6i489x9zwOGQmn4V7NY41Q1i4YS','0','2','',NULL,'admin','2024-03-21 13:30:08','',NULL,NULL),(14,NULL,'station_4','s4','00','','','0','','$2a$10$9Jo2JZsXdaH21XIsB1/5vup5AlQpw/xIOxQ.6l.xUZRiI6IjnejB6','0','0','',NULL,'admin','2024-03-21 13:30:23','',NULL,NULL),(15,NULL,'station_5','s5','00','','','0','','$2a$10$f2g1S7N4aE2XenuqTlhNsOTZVAGHDJP1i0gdd3hNHtsEdLRF0NJN.','0','0','',NULL,'admin','2024-03-21 13:30:44','',NULL,NULL),(16,NULL,'station_6','s6','00','','','0','','$2a$10$b01MyX7.hGJZtnLvLHoHJ.NaTE6x1hQMX8iADSGWhjyDDy0vFZDQC','0','0','',NULL,'admin','2024-03-21 13:30:59','',NULL,NULL),(17,NULL,'storge_1','t1','00','','','0','','$2a$10$gL9wbDFoaV9UW1w8z1V8F.9z6MJScX9sTwsGfm8liuHOq6xCsDmU6','0','0','127.0.0.1','2024-04-08 16:20:50','admin','2024-03-21 13:31:48','','2024-04-08 16:20:50',NULL),(18,NULL,'station_3','s3','00','','','0','','$2a$10$tlk0zrt1d2Fs7c4wa8fiMeg/TxGOxTWWvU8sAipXKjbjE5hype4Vu','0','0','127.0.0.1','2024-03-23 11:27:22','admin','2024-03-23 11:26:44','','2024-03-23 11:27:21',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(6,3),(11,2),(12,2),(14,2),(15,2),(16,2),(17,4),(18,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-16 15:08:13

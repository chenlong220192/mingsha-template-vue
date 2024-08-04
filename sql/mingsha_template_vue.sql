CREATE DATABASE  IF NOT EXISTS `mingsha_template_vue` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mingsha_template_vue`;
-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: mingsha_template_vue
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (9,'transaction_trend','交易趋势表',NULL,NULL,'TransactionTrend','crud','element-ui','site.mingsha.transaction','transaction','trend','交易趋势','mingsha','0','/','{\"parentMenuId\":\"2036\"}','admin','2024-08-03 00:48:43','','2024-08-03 02:08:06',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (60,9,'id','id','bigint','Long','id','1','1','0','1',NULL,'0',NULL,'EQ','input','',1,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(61,9,'coin','币种','varchar(255)','String','coin','0','0','1','1','1','1','1','EQ','select','transaction_coin',2,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(62,9,'gear','档位','varchar(255)','String','gear','0','0','1','1','1','1','1','EQ','select','transaction_gear',3,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(63,9,'date','日期','datetime','Date','date','0','0','1','1','1','1','1','BETWEEN','datetime','',4,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(64,9,'price_start','开盘价','varchar(255)','String','priceStart','0','0','1','1','1','1','0','EQ','input','',5,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(65,9,'price_end','收盘价','varchar(255)','String','priceEnd','0','0','1','1','1','1','0','EQ','input','',6,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(66,9,'price_highest','最高价','varchar(255)','String','priceHighest','0','0','1','1','1','1','0','EQ','input','',7,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(67,9,'price_lowest','最低价','varchar(255)','String','priceLowest','0','0','1','1','1','1','0','EQ','input','',8,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(68,9,'price_points','关键点','varchar(255)','String','pricePoints','0','0','1','1','1','1','0','EQ','input','',9,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(69,9,'direction','涨跌方向','varchar(255)','String','direction','0','0','1','1','1','1','1','EQ','radio','transaction_direction',10,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(70,9,'create_time','创建时间','datetime','Date','createTime','0','0','1','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06'),(71,9,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','0',NULL,'EQ','textarea','',12,'admin','2024-08-03 00:48:43','','2024-08-03 02:08:06');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-04-13 22:07:43','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-04-13 22:07:44','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-04-13 22:07:44','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2024-04-13 22:07:44','admin','2024-04-18 19:38:50','是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-04-13 22:07:44','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-04-13 22:07:44','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (1,0,'0','研发部',0,'鸣沙','18388888888','mingsha@site.com','0','0','admin','2024-07-08 19:23:46','admin','2024-07-08 19:23:46');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-04-13 22:07:43','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-04-13 22:07:43','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-04-13 22:07:43','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-04-13 22:07:43','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-04-13 22:07:43','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-04-13 22:07:43','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-04-13 22:07:43','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-04-13 22:07:43','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-04-13 22:07:43','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-04-13 22:07:43','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-04-13 22:07:43','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-04-13 22:07:43','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-04-13 22:07:43','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-04-13 22:07:43','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-04-13 22:07:43','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-04-13 22:07:43','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-04-13 22:07:43','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-04-13 22:07:43','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-04-13 22:07:43','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-04-13 22:07:43','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-04-13 22:07:43','',NULL,'停用状态'),(101,2,'以太坊（U本位）','ETHUSDT','transaction_coin',NULL,'info','N','0','admin','2024-08-03 01:00:21','admin','2024-08-03 03:40:23',NULL),(102,1,'12小时','12H','transaction_gear',NULL,'info','N','0','admin','2024-08-03 01:00:49','admin','2024-08-03 01:24:25',NULL),(103,1,'多','DUO','transaction_direction',NULL,'danger','N','0','admin','2024-08-03 01:01:09','',NULL,NULL),(104,2,'空','KONG','transaction_direction',NULL,'success','N','0','admin','2024-08-03 01:01:21','',NULL,NULL);
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-04-13 22:07:43','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-04-13 22:07:43','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-04-13 22:07:43','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-04-13 22:07:43','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-04-13 22:07:43','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-04-13 22:07:43','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-04-13 22:07:43','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-04-13 22:07:43','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-04-13 22:07:43','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-04-13 22:07:43','',NULL,'登录状态列表'),(100,'交易币种','transaction_coin','0','admin','2024-08-03 00:57:26','admin','2024-08-03 00:58:26','交易币种列表'),(101,'交易档位','transaction_gear','0','admin','2024-08-03 00:58:21','',NULL,'交易档位列表'),(102,'交易方向','transaction_direction','0','admin','2024-08-03 00:59:29','',NULL,'交易方向列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-04-13 22:07:44','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-04-13 22:07:44','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-04-13 22:07:44','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
INSERT INTO `sys_job_log` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','系统默认（无参） 总共耗时：1毫秒','0','','2024-08-03 03:47:02');
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_login_log`
--

DROP TABLE IF EXISTS `sys_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_login_log` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_login_log`
--

LOCK TABLES `sys_login_log` WRITE;
/*!40000 ALTER TABLE `sys_login_log` DISABLE KEYS */;
INSERT INTO `sys_login_log` VALUES (1,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 00:33:00'),(2,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-08-03 00:43:52'),(3,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 00:46:25'),(4,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-08-03 01:22:59'),(5,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 01:23:01'),(6,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','1','用户不存在/密码错误','2024-08-03 03:31:15'),(7,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 03:31:21'),(8,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-08-03 03:36:30'),(9,'testme1','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 03:36:38'),(10,'testme1','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','退出成功','2024-08-03 03:37:22'),(11,'testme2','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 03:37:26'),(12,'admin','10.1.1.243','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 10:34:18'),(13,'admin','10.1.2.31','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-03 23:49:26'),(14,'admin','10.1.2.31','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-04 00:24:48'),(15,'admin','10.1.0.34','内网IP','Chrome 12','Mac OS X','1','用户不存在/密码错误','2024-08-05 01:55:18'),(16,'admin','10.1.0.34','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-05 01:55:24'),(17,'admin','10.1.0.50','内网IP','Chrome 12','Mac OS X','1','用户不存在/密码错误','2024-08-05 02:55:43'),(18,'admin','10.1.0.50','内网IP','Chrome 12','Mac OS X','0','登录成功','2024-08-05 02:55:49');
/*!40000 ALTER TABLE `sys_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,2,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-04-13 22:07:39','admin','2024-08-03 00:07:11','系统管理目录'),(2,'配置管理',0,3,'config',NULL,NULL,1,0,'M','0','0','','dict','admin','2024-07-08 19:13:04','admin','2024-08-03 00:06:52',''),(3,'系统监控',0,4,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-04-13 22:07:39','admin','2024-08-03 00:07:18','系统监控目录'),(4,'开发工具',0,6,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-04-13 22:07:39','admin','2024-08-03 00:07:29','系统工具目录'),(100,'用户管理',2034,4,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-04-13 22:07:39','admin','2024-07-08 20:15:43','用户管理菜单'),(101,'角色管理',2034,3,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-04-13 22:07:39','admin','2024-07-08 20:15:37','角色管理菜单'),(102,'菜单管理',1,1,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-04-13 22:07:39','admin','2024-08-03 00:06:27','菜单管理菜单'),(103,'部门管理',2034,1,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-04-13 22:07:39','admin','2024-07-08 20:15:24','部门管理菜单'),(104,'岗位管理',2034,2,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-04-13 22:07:39','admin','2024-07-08 20:15:31','岗位管理菜单'),(105,'字典管理',2,2,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-04-13 22:07:39','admin','2024-07-08 20:17:12','字典管理菜单'),(106,'参数管理',2,1,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-04-13 22:07:39','admin','2024-07-08 20:17:07','参数设置菜单'),(107,'通知公告',1,2,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-04-13 22:07:39','admin','2024-08-03 00:08:09','通知公告菜单'),(108,'日志管理',0,5,'log','','',1,0,'M','0','0','','log','admin','2024-04-13 22:07:39','admin','2024-08-03 00:07:25','日志管理菜单'),(109,'在线用户',3,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-04-13 22:07:39','',NULL,'在线用户菜单'),(110,'定时任务',1,3,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-04-13 22:07:39','admin','2024-08-03 00:08:15','定时任务菜单'),(111,'数据监控',3,2,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-04-13 22:07:39','admin','2024-08-03 00:47:11','数据监控菜单'),(112,'服务监控',3,3,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-04-13 22:07:39','admin','2024-08-03 00:47:15','服务监控菜单'),(113,'缓存监控',3,4,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-04-13 22:07:39','admin','2024-08-03 00:47:19','缓存监控菜单'),(114,'缓存列表',3,5,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-04-13 22:07:39','admin','2024-08-03 00:47:23','缓存列表菜单'),(115,'表单构建',4,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-04-13 22:07:39','',NULL,'表单构建菜单'),(116,'代码生成',4,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-04-13 22:07:39','',NULL,'代码生成菜单'),(117,'系统接口',4,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-04-13 22:07:39','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-04-13 22:07:39','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-04-13 22:07:39','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-04-13 22:07:39','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-04-13 22:07:39','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-04-13 22:07:39','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-04-13 22:07:39','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-04-13 22:07:39','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-04-13 22:07:39','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-04-13 22:07:39','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-04-13 22:07:39','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-04-13 22:07:40','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-04-13 22:07:40','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-04-13 22:07:40','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-04-13 22:07:40','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-04-13 22:07:40','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-04-13 22:07:40','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-04-13 22:07:40','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-04-13 22:07:40','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-04-13 22:07:40','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-04-13 22:07:41','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-04-13 22:07:41','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-04-13 22:07:41','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-04-13 22:07:41','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-04-13 22:07:41','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-04-13 22:07:41','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-04-13 22:07:41','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-04-13 22:07:41','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-04-13 22:07:41','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-04-13 22:07:41','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-04-13 22:07:41','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-04-13 22:07:41','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-04-13 22:07:41','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-04-13 22:07:41','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-04-13 22:07:41','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-04-13 22:07:41','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-04-13 22:07:41','',NULL,''),(2034,'权限管理',0,1,'user',NULL,NULL,1,0,'M','0','0','','user','admin','2024-07-08 20:14:59','admin','2024-08-03 00:07:06',''),(2036,'交易管理',0,7,'transaction',NULL,NULL,1,0,'M','0','0',NULL,'nested','admin','2024-08-03 00:48:30','',NULL,''),(2037,'交易趋势',2036,1,'trend','transaction/trend/index',NULL,1,0,'C','0','0','transaction:trend:list','chart','admin','2024-08-03 00:50:05','admin','2024-08-03 01:23:19','交易趋势菜单'),(2038,'交易趋势查询',2037,1,'#','',NULL,1,0,'F','0','0','transaction:trend:query','#','admin','2024-08-03 00:50:05','',NULL,''),(2039,'交易趋势新增',2037,2,'#','',NULL,1,0,'F','0','0','transaction:trend:add','#','admin','2024-08-03 00:50:05','',NULL,''),(2040,'交易趋势修改',2037,3,'#','',NULL,1,0,'F','0','0','transaction:trend:edit','#','admin','2024-08-03 00:50:05','',NULL,''),(2041,'交易趋势删除',2037,4,'#','',NULL,1,0,'F','0','0','transaction:trend:remove','#','admin','2024-08-03 00:50:05','',NULL,''),(2042,'交易趋势导出',2037,5,'#','',NULL,1,0,'F','0','0','transaction:trend:export','#','admin','2024-08-03 00:50:05','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'维护通知：2024-08-03 系统凌晨维护','1',_binary '维护内容','0','admin','2024-04-13 22:07:44','admin','2024-08-03 03:31:45','管理员');
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (44,'操作日志',3,'site.mingsha.web.controller.monitor.SysOperlogController.remove()','DELETE',1,'admin','研发部','/monitor/operlog/43,2','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:36:44',6),(45,'菜单管理',2,'site.mingsha.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2024-04-13 14:07:39\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":3,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:47:11',27),(46,'菜单管理',2,'site.mingsha.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"component\":\"monitor/server/index\",\"createTime\":\"2024-04-13 14:07:39\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"服务监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"server\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:47:15',11),(47,'菜单管理',2,'site.mingsha.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2024-04-13 14:07:39\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":3,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:47:19',8),(48,'菜单管理',2,'site.mingsha.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"component\":\"monitor/cache/list\",\"createTime\":\"2024-04-13 14:07:39\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"缓存列表\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":3,\"path\":\"cacheList\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:47:23',9),(49,'菜单管理',1,'site.mingsha.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"nested\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"交易管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"transaction\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:48:30',9),(50,'代码生成',6,'site.mingsha.web.controller.generator.GenController.importTableSave()','POST',1,'admin','研发部','/tool/gen/importTable','10.1.1.243','内网IP','{\"tables\":\"transaction_trend\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:48:43',69),(51,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"date\",\"javaType\":\"Date\",\"list\":','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:49:16',69),(52,'代码生成',8,'site.mingsha.web.controller.generator.GenController.batchGenCode()','GET',1,'admin','研发部','/tool/gen/batchGenCode','10.1.1.243','内网IP','{\"tables\":\"transaction_trend\"}',NULL,0,NULL,'2024-08-03 00:49:19',92),(53,'字典类型',1,'site.mingsha.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部','/system/dict/type','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"dictName\":\"交易-币种\",\"dictType\":\"transaction_coin\",\"params\":{},\"remark\":\"币种列表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:57:26',13),(54,'字典类型',2,'site.mingsha.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','研发部','/system/dict/type','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:57:26\",\"dictId\":100,\"dictName\":\"交易币种\",\"dictType\":\"transaction_coin\",\"params\":{},\"remark\":\"币种列表\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:57:34',15),(55,'字典类型',1,'site.mingsha.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部','/system/dict/type','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"dictName\":\"交易档位\",\"dictType\":\"transaction_gear\",\"params\":{},\"remark\":\"交易档位列表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:58:21',8),(56,'字典类型',2,'site.mingsha.web.controller.system.SysDictTypeController.edit()','PUT',1,'admin','研发部','/system/dict/type','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:57:26\",\"dictId\":100,\"dictName\":\"交易币种\",\"dictType\":\"transaction_coin\",\"params\":{},\"remark\":\"交易币种列表\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:58:26',13),(57,'字典类型',1,'site.mingsha.web.controller.system.SysDictTypeController.add()','POST',1,'admin','研发部','/system/dict/type','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"dictName\":\"交易方向\",\"dictType\":\"transaction_direction\",\"params\":{},\"remark\":\"交易方向列表\",\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 00:59:29',9),(58,'字典数据',1,'site.mingsha.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"比特币\",\"dictSort\":0,\"dictType\":\"transaction_coin\",\"dictValue\":\"BTC\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:00:06',14),(59,'字典数据',1,'site.mingsha.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"以太坊\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETH\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:00:21',8),(60,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:06\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"比特币\",\"dictSort\":1,\"dictType\":\"transaction_coin\",\"dictValue\":\"BTC\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:00:29',12),(61,'字典数据',1,'site.mingsha.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"12小时\",\"dictSort\":1,\"dictType\":\"transaction_gear\",\"dictValue\":\"12H\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:00:49',8),(62,'字典数据',1,'site.mingsha.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"多\",\"dictSort\":1,\"dictType\":\"transaction_direction\",\"dictValue\":\"DUO\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:01:09',8),(63,'字典数据',1,'site.mingsha.web.controller.system.SysDictDataController.add()','POST',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空\",\"dictSort\":2,\"dictType\":\"transaction_direction\",\"dictValue\":\"KONG\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:01:21',9),(64,'代码生成',2,'site.mingsha.web.controller.generator.GenController.synchDb()','GET',1,'admin','研发部','/tool/gen/synchDb/transaction_trend','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:01:27',27),(65,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:01:27\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:01:27\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:01:27\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:02:05',26),(66,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:04\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:02:16',26),(67,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:16\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:16\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:02:16\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:03:24',22),(68,'代码生成',2,'site.mingsha.web.controller.generator.GenController.synchDb()','GET',1,'admin','研发部','/tool/gen/synchDb/transaction_trend','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:03:37',26),(69,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:37\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:37\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:37\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdi','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:03:53',21),(70,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:53\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:53\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:03:53\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:04:39',23),(71,'代码生成',8,'site.mingsha.web.controller.generator.GenController.batchGenCode()','GET',1,'admin','研发部','/tool/gen/batchGenCode','10.1.1.243','内网IP','{\"tables\":\"transaction_trend\"}',NULL,0,NULL,'2024-08-03 01:04:42',52),(72,'菜单管理',2,'site.mingsha.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部','/system/menu','10.1.1.243','内网IP','{\"children\":[],\"component\":\"transaction/trend/index\",\"createTime\":\"2024-08-02 16:50:05\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2037,\"menuName\":\"交易趋势\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2036,\"path\":\"trend\",\"perms\":\"transaction:trend:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:23:19',29),(73,'交易趋势',5,'site.mingsha.web.controller.transaction.TransactionTrendController.export()','POST',1,'admin','研发部','/transaction/trend/export','10.1.1.243','内网IP','{\"pageSize\":\"10\",\"isAsc\":\"ascending\",\"orderByColumn\":\"direction\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-08-03 01:23:36',858),(74,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:49\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"12小时\",\"dictSort\":1,\"dictType\":\"transaction_gear\",\"dictValue\":\"12H\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:24:25',12),(75,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETH\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:24:44',9),(76,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETH\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:25:07',8),(77,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:06\",\"default\":false,\"dictCode\":100,\"dictLabel\":\"比特币\",\"dictSort\":1,\"dictType\":\"transaction_coin\",\"dictValue\":\"BTC\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:25:12',12),(78,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETH\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:38:46',8),(79,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETH\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:39:02',9),(80,'字典类型',3,'site.mingsha.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin','研发部','/system/dict/data/100','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:40:17',10),(81,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:40:37',8),(82,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 01:53:27',9),(83,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:55:25\",\"date\":\"2024-07-27\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":1,\"params\":{},\"priceEnd\":\"3277\",\"priceHighest\":\"3281.91\",\"priceLowest\":\"3241.52\",\"pricePoints\":\"3282\",\"priceStart\":\"3272.81\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:02:43',28),(84,'代码生成',2,'site.mingsha.web.controller.generator.GenController.editSave()','PUT',1,'admin','研发部','/tool/gen','10.1.1.243','内网IP','{\"businessName\":\"trend\",\"className\":\"TransactionTrend\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"id\",\"columnId\":60,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isList\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:04:39\",\"usableColumn\":false},{\"capJavaField\":\"Coin\",\"columnComment\":\"币种\",\"columnId\":61,\"columnName\":\"coin\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_coin\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"coin\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:04:39\",\"usableColumn\":false},{\"capJavaField\":\"Gear\",\"columnComment\":\"档位\",\"columnId\":62,\"columnName\":\"gear\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"transaction_gear\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"gear\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2024-08-02 17:04:39\",\"usableColumn\":false},{\"capJavaField\":\"Date\",\"columnComment\":\"日期\",\"columnId\":63,\"columnName\":\"date\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 16:48:43\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:08:06',50),(85,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 18:51:59\",\"date\":\"2024-08-01 08:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":11,\"params\":{},\"priceEnd\":\"1\",\"priceHighest\":\"1\",\"priceLowest\":\"1\",\"pricePoints\":\"1\",\"priceStart\":\"1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:51:59',132),(86,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 18:51:59\",\"date\":\"2024-08-01 08:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":11,\"params\":{},\"priceEnd\":\"3187.13\",\"priceHighest\":\"3241.83\",\"priceLowest\":\"3134.03\",\"pricePoints\":\"3134\",\"priceStart\":\"3231.49\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:53:08',8),(87,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:55:25\",\"date\":\"2024-07-27 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":1,\"params\":{},\"priceEnd\":\"3277\",\"priceHighest\":\"3281.91\",\"priceLowest\":\"3241.52\",\"pricePoints\":\"3282\",\"priceStart\":\"3272.81\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:53:53',5),(88,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:56:15\",\"date\":\"2024-07-27 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":2,\"params\":{},\"priceEnd\":\"3248.17\",\"priceHighest\":\"3326.9\",\"priceLowest\":\"3188.89\",\"pricePoints\":\"3188\",\"priceStart\":\"3277\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 02:54:05',6),(89,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:56:58\",\"date\":\"2024-07-28 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":3,\"params\":{},\"priceEnd\":\"3255\",\"priceHighest\":\"3264\",\"priceLowest\":\"3195.84\",\"pricePoints\":\"3264\",\"priceStart\":\"3248.16\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:05:34',26),(90,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:57:37\",\"date\":\"2024-07-28 20:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":4,\"params\":{},\"priceEnd\":\"3268.03\",\"priceHighest\":\"3284.57\",\"priceLowest\":\"3250\",\"pricePoints\":\"3285\",\"priceStart\":\"3255\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:05:46',7),(91,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:58:17\",\"date\":\"2024-07-29 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":5,\"params\":{},\"priceEnd\":\"3374.03\",\"priceHighest\":\"3396.07\",\"priceLowest\":\"3265.18\",\"pricePoints\":\"3396\",\"priceStart\":\"3268.03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:05:56',8),(92,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:58:57\",\"date\":\"2024-07-29 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":6,\"params\":{},\"priceEnd\":\"3316.87\",\"priceHighest\":\"3385.82\",\"priceLowest\":\"3256.56\",\"pricePoints\":\"3256\",\"priceStart\":\"3374.03\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:06:08',6),(93,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 03:59:34\",\"date\":\"2024-07-30 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":7,\"params\":{},\"priceEnd\":\"3333.35\",\"priceHighest\":\"3354.81\",\"priceLowest\":\"3280.17\",\"pricePoints\":\"3355\",\"priceStart\":\"3316.86\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:06:21',7),(94,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 04:00:10\",\"date\":\"2024-07-30 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":8,\"params\":{},\"priceEnd\":\"3278.17\",\"priceHighest\":\"3365\",\"priceLowest\":\"3230.1\",\"pricePoints\":\"3230\",\"priceStart\":\"3333.34\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:06:34',7),(95,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 04:00:55\",\"date\":\"2024-07-31 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":9,\"params\":{},\"priceEnd\":\"3321.85\",\"priceHighest\":\"3331.42\",\"priceLowest\":\"3260.22\",\"pricePoints\":\"3331\",\"priceStart\":\"3278.17\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:06:51',6),(96,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 04:01:26\",\"date\":\"2024-07-31 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":10,\"params\":{},\"priceEnd\":\"3231.48\",\"priceHighest\":\"3348.74\",\"priceLowest\":\"3212.32\",\"pricePoints\":\"3212\",\"priceStart\":\"3321.85\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:07:01',6),(97,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 19:09:37\",\"date\":\"2024-08-01 20:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":12,\"params\":{},\"priceEnd\":\"3201.67\",\"priceHighest\":\"3219.20\",\"priceLowest\":\"3201.67\",\"pricePoints\":\"3220\",\"priceStart\":\"3187.14\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:09:37',15),(98,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-02 19:10:44\",\"date\":\"2024-08-02 08:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":13,\"params\":{},\"priceEnd\":\"3152.1\",\"priceHighest\":\"3217.06\",\"priceLowest\":\"3125\",\"pricePoints\":\"3125\",\"priceStart\":\"3201.66\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:10:44',12),(99,'通知公告',2,'site.mingsha.web.controller.system.SysNoticeController.edit()','PUT',1,'admin','研发部','/system/notice','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-04-13 14:07:44\",\"noticeContent\":\"维护内容\",\"noticeId\":1,\"noticeTitle\":\"维护通知：2024-08-03 系统凌晨维护\",\"noticeType\":\"1\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:31:45',8),(100,'通知公告',1,'site.mingsha.web.controller.system.SysNoticeController.add()','POST',1,'admin','研发部','/system/notice','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p>测试</p>\",\"noticeTitle\":\"测试\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:32:17',11),(101,'用户管理',1,'site.mingsha.web.controller.system.SysUserController.add()','POST',1,'admin','研发部','/system/user','10.1.1.243','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":1,\"email\":\"testme@mingsha.site\",\"nickName\":\"testme1\",\"params\":{},\"phonenumber\":\"18300000000\",\"postIds\":[1],\"roleIds\":[2],\"sex\":\"2\",\"status\":\"0\",\"userId\":103,\"userName\":\"testme1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:34:15',95),(102,'用户管理',1,'site.mingsha.web.controller.system.SysUserController.add()','POST',1,'admin','研发部','/system/user','10.1.1.243','内网IP','{\"admin\":false,\"deptId\":1,\"email\":\"testme2@mingsha.site\",\"nickName\":\"testme2\",\"params\":{},\"phonenumber\":\"18300000000\",\"postIds\":[1],\"roleIds\":[3],\"sex\":\"2\",\"status\":\"0\",\"userName\":\"testme2\"}','{\"msg\":\"新增用户\'testme2\'失败，手机号码已存在\",\"code\":500}',0,NULL,'2024-08-03 03:34:44',5),(103,'用户管理',1,'site.mingsha.web.controller.system.SysUserController.add()','POST',1,'admin','研发部','/system/user','10.1.1.243','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":1,\"email\":\"testme2@mingsha.site\",\"nickName\":\"testme2\",\"params\":{},\"phonenumber\":\"18300000002\",\"postIds\":[1],\"roleIds\":[3],\"sex\":\"2\",\"status\":\"0\",\"userId\":104,\"userName\":\"testme2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:34:49',88),(104,'用户管理',2,'site.mingsha.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部','/system/user','10.1.1.243','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-08-02 19:34:15\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":1,\"deptName\":\"研发部\",\"leader\":\"鸣沙\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":1,\"email\":\"testme@mingsha.site\",\"loginIp\":\"\",\"nickName\":\"testme1\",\"params\":{},\"phonenumber\":\"18300000001\",\"postIds\":[1],\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":103,\"userName\":\"testme1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:34:54',21),(105,'角色管理',2,'site.mingsha.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部','/system/role','10.1.1.243','内网IP','{\"admin\":false,\"createTime\":\"2024-07-08 11:23:46\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2034,100,1000,1001,1002,1003,1004,1005,1006,1,102,1012,1013,1014,1015,107,1035,1036,1037,1038,110,1049,1050,1051,1052,1053,1054,3,109,1046,1047,1048,111,112,113,114,108,500,1039,1040,1041,501,1042,1043,1044,1045,2036,2037,2038,2039,2040,2041,2042],\"params\":{},\"roleId\":2,\"roleKey\":\"user\",\"roleName\":\"管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:36:02',22),(106,'角色管理',2,'site.mingsha.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部','/system/role','10.1.1.243','内网IP','{\"admin\":false,\"createTime\":\"2024-07-08 11:24:04\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2036,2037,2038,2039,2040,2041,2042],\"params\":{},\"roleId\":3,\"roleKey\":\"common\",\"roleName\":\"普通用户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:36:24',15),(107,'通知公告',3,'site.mingsha.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin','研发部','/system/notice/10','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:37:37',6),(108,'通知公告',1,'site.mingsha.web.controller.system.SysNoticeController.add()','POST',1,'admin','研发部','/system/notice','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p>asdfasdf</p>\",\"noticeTitle\":\"asdfasdfasf\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:37:46',7),(109,'通知公告',1,'site.mingsha.web.controller.system.SysNoticeController.add()','POST',1,'admin','研发部','/system/notice','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"noticeContent\":\"<p>qwerqwer</p>\",\"noticeTitle\":\"swerqwer\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:38:03',5),(110,'通知公告',3,'site.mingsha.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin','研发部','/system/notice/12','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:38:14',5),(111,'通知公告',3,'site.mingsha.web.controller.system.SysNoticeController.remove()','DELETE',1,'admin','研发部','/system/notice/11','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:38:18',5),(112,'交易趋势',5,'site.mingsha.web.controller.transaction.TransactionTrendController.export()','POST',1,'testme2','研发部','/transaction/trend/export','10.1.1.243','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2024-08-03 03:38:42',686),(113,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:39:24',22),(114,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:39:45',9),(115,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:40:00',11),(116,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:40:15',8),(117,'字典数据',2,'site.mingsha.web.controller.system.SysDictDataController.edit()','PUT',1,'admin','研发部','/system/dict/data','10.1.1.243','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-08-02 17:00:21\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"以太坊（U本位）\",\"dictSort\":2,\"dictType\":\"transaction_coin\",\"dictValue\":\"ETHUSDT\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:40:23',23),(118,'在线用户',7,'site.mingsha.web.controller.monitor.SysUserOnlineController.forceLogout()','DELETE',1,'admin','研发部','/monitor/online/f65b3324-1eee-4d3e-8e23-022b2ffa1499','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:41:29',8),(119,'参数管理',9,'site.mingsha.web.controller.system.SysConfigController.refreshCache()','DELETE',1,'admin','研发部','/system/config/refreshCache','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:45:21',7),(120,'字典类型',9,'site.mingsha.web.controller.system.SysDictTypeController.refreshCache()','DELETE',1,'admin','研发部','/system/dict/type/refreshCache','10.1.1.243','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:45:25',15),(121,'定时任务',2,'site.mingsha.web.controller.quartz.SysJobController.run()','PUT',1,'admin','研发部','/monitor/job/run','10.1.1.243','内网IP','{\"jobGroup\":\"DEFAULT\",\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{}}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 03:47:02',19),(122,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.1.243','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-03 02:36:27\",\"date\":\"2024-08-02 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":14,\"params\":{},\"priceEnd\":\"2988.11\",\"priceHighest\":\"3181.99\",\"priceLowest\":\"2965.27\",\"pricePoints\":\"2965\",\"priceStart\":\"3152.10\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-03 10:36:27',6),(123,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.0.50','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-04 18:56:36\",\"date\":\"2024-08-03 08:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":15,\"params\":{},\"priceEnd\":\"2995.44\",\"priceHighest\":\"3004.46\",\"priceLowest\":\"2912.50\",\"pricePoints\":\"3005\",\"priceStart\":\"2988.10\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-05 02:56:36',22),(124,'交易趋势',2,'site.mingsha.web.controller.transaction.TransactionTrendController.edit()','PUT',1,'admin','研发部','/transaction/trend','10.1.0.50','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-04 18:56:36\",\"date\":\"2024-08-03 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":15,\"params\":{},\"priceEnd\":\"2995.44\",\"priceHighest\":\"3004.46\",\"priceLowest\":\"2912.50\",\"pricePoints\":\"3005\",\"priceStart\":\"2988.10\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-05 02:56:44',5),(125,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.0.50','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-04 18:57:42\",\"date\":\"2024-08-03 20:00:00\",\"direction\":\"KONG\",\"gear\":\"12H\",\"id\":16,\"params\":{},\"priceEnd\":\"2901.94\",\"priceHighest\":\"3016.61\",\"priceLowest\":\"2855\",\"pricePoints\":\"2855\",\"priceStart\":\"2995.43\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-05 02:57:42',7),(126,'交易趋势',1,'site.mingsha.web.controller.transaction.TransactionTrendController.add()','POST',1,'admin','研发部','/transaction/trend','10.1.0.50','内网IP','{\"coin\":\"ETHUSDT\",\"createTime\":\"2024-08-04 18:58:25\",\"date\":\"2024-08-04 08:00:00\",\"direction\":\"DUO\",\"gear\":\"12H\",\"id\":17,\"params\":{},\"priceEnd\":\"2912.80\",\"priceHighest\":\"2934.66\",\"priceLowest\":\"2874.12\",\"pricePoints\":\"2935\",\"priceStart\":\"2901.95\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-08-05 02:58:25',6);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'it','IT',1,'0','admin','2024-04-13 22:07:39','admin','2024-04-18 19:41:25','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-07-08 19:23:46','',NULL,'超级管理员'),(2,'管理员','user',2,'1',1,1,'0','0','admin','2024-07-08 19:23:46','admin','2024-08-03 03:36:02',NULL),(3,'普通用户','common',3,'1',1,1,'0','0','admin','2024-07-08 19:24:04','admin','2024-08-03 03:36:24',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,3),(2,100),(2,102),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1012),(2,1013),(2,1014),(2,1015),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,2034),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2042),(3,2036),(3,2037),(3,2038),(3,2039),(3,2040),(3,2041),(3,2042);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,1,'admin','鸣沙','00','admin@site.com','18388888888','0','','$2a$10$1QuRovwH9v7nNDu9ScjlKuRpQf6HbnZaOa16qjZuIHYSe/45Byep2','0','0','10.1.0.50','2024-08-05 02:55:49','admin','2024-04-13 22:07:39','','2024-08-05 02:55:49','管理员'),(2,1,'testme1','testme1','00','testme1@mingsha.site','18300000001','0','','$2a$10$7PubdyJrkMNWlHTvr2LexuffFihEwF7mTUciPsHDqrHI.TEkZ0KIe','0','2','10.1.3.57','2024-07-08 19:32:36','admin','2024-07-08 19:27:52','','2024-07-08 19:32:35',NULL),(3,1,'testme2','testme2','00','testme2@mingsha.site','18300000002','1','','$2a$10$cpv7653xNqNerH/1ayUkM.BQ9N5m45IUFNnpbdDaR1TSluXIrKDme','0','2','10.1.3.57','2024-07-08 19:33:21','admin','2024-07-08 19:28:18','','2024-07-08 19:33:20',NULL),(103,1,'testme1','testme1','00','testme@mingsha.site','18300000001','2','','$2a$10$nCYvgFWSw2iVKBABR1yXGuiAosFQbEzpYaUEdPk4Fe/Rgv5F0JqJG','0','0','10.1.1.243','2024-08-03 03:36:39','admin','2024-08-03 03:34:15','admin','2024-08-03 03:36:38',NULL),(104,1,'testme2','testme2','00','testme2@mingsha.site','18300000002','2','','$2a$10$4H.gErPl6UWD/vCqTS87Eu2ts1Ks8.3ii70mL1RSAZ.Z2lxUGOq9e','0','0','10.1.1.243','2024-08-03 03:37:27','admin','2024-08-03 03:34:49','','2024-08-03 03:37:26',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(103,1),(104,1);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(103,2),(104,3);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_trend`
--

DROP TABLE IF EXISTS `transaction_trend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_trend` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `coin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '币种',
  `gear` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '档位',
  `date` datetime NOT NULL COMMENT '日期',
  `price_start` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '开盘价',
  `price_end` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收盘价',
  `price_highest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最高价',
  `price_lowest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最低价',
  `price_points` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键点',
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '涨跌方向',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='交易趋势表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_trend`
--

LOCK TABLES `transaction_trend` WRITE;
/*!40000 ALTER TABLE `transaction_trend` DISABLE KEYS */;
INSERT INTO `transaction_trend` VALUES (1,'ETHUSDT','12H','2024-07-27 16:00:00','3272.81','3277','3281.91','3241.52','3282','DUO','2024-08-02 11:55:25',NULL),(2,'ETHUSDT','12H','2024-07-28 04:00:00','3277','3248.17','3326.9','3188.89','3188','KONG','2024-08-02 11:56:15',NULL),(3,'ETHUSDT','12H','2024-07-28 16:00:00','3248.16','3255','3264','3195.84','3264','DUO','2024-08-02 11:56:58',NULL),(4,'ETHUSDT','12H','2024-07-29 04:00:00','3255','3268.03','3284.57','3250','3285','DUO','2024-08-02 11:57:37',NULL),(5,'ETHUSDT','12H','2024-07-29 16:00:00','3268.03','3374.03','3396.07','3265.18','3396','DUO','2024-08-02 11:58:17',NULL),(6,'ETHUSDT','12H','2024-07-30 04:00:00','3374.03','3316.87','3385.82','3256.56','3256','KONG','2024-08-02 11:58:57',NULL),(7,'ETHUSDT','12H','2024-07-30 16:00:00','3316.86','3333.35','3354.81','3280.17','3355','DUO','2024-08-02 11:59:34',NULL),(8,'ETHUSDT','12H','2024-07-31 04:00:00','3333.34','3278.17','3365','3230.1','3230','KONG','2024-08-02 12:00:10',NULL),(9,'ETHUSDT','12H','2024-07-31 16:00:00','3278.17','3321.85','3331.42','3260.22','3331','DUO','2024-08-02 12:00:55',NULL),(10,'ETHUSDT','12H','2024-08-01 04:00:00','3321.85','3231.48','3348.74','3212.32','3212','KONG','2024-08-02 12:01:26',NULL),(11,'ETHUSDT','12H','2024-08-01 16:00:00','3231.49','3187.13','3241.83','3134.03','3134','KONG','2024-08-03 02:51:59',NULL),(12,'ETHUSDT','12H','2024-08-02 04:00:00','3187.14','3201.67','3219.20','3201.67','3220','DUO','2024-08-03 03:09:37',NULL),(13,'ETHUSDT','12H','2024-08-02 16:00:00','3201.66','3152.1','3217.06','3125','3125','KONG','2024-08-03 03:10:44',NULL),(14,'ETHUSDT','12H','2024-08-03 04:00:00','3152.10','2988.11','3181.99','2965.27','2965','KONG','2024-08-03 10:36:27',NULL),(15,'ETHUSDT','12H','2024-08-03 16:00:00','2988.10','2995.44','3004.46','2912.50','3005','DUO','2024-08-05 02:56:36',NULL),(16,'ETHUSDT','12H','2024-08-04 04:00:00','2995.43','2901.94','3016.61','2855','2855','KONG','2024-08-05 02:57:43',NULL),(17,'ETHUSDT','12H','2024-08-04 16:00:00','2901.95','2912.80','2934.66','2874.12','2935','DUO','2024-08-05 02:58:25',NULL);
/*!40000 ALTER TABLE `transaction_trend` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-05  3:35:24

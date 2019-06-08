DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  `name_attr` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_permission` VALUES (1, '权限', 'permission', '', 'order:edit', 0, '0/', '0', '1');
INSERT INTO `sys_permission` VALUES (10, '订单管理', 'menu', '', NULL, 1, '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES (11, '订单新增', 'permission', 'order/add_judge', 'contract:add', 11, '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES (12, '订单修改', 'permission', 'order/edit_judge', 'contract:edit', 11, '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES (13, '订单删除', 'permission', 'order/delete_judge', 'contract:delete', 11, '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES (30, '产品管理', 'menu', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (31, '产品新增', 'permission', NULL, 'product:add', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (32, '产品修改', 'permission', NULL, 'product:edit', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (33, '产品删除', 'permission', NULL, 'product:delete', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (34, '半产品管理', 'menu', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (35, '半产品新增', 'permission', NULL, 'semiproduct:add', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (36, '半产品修改', 'permission', NULL, 'semiproduct:edit', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (37, '半产品删除', 'permission', NULL, 'semiproduct:delete', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (40, '部门管理', 'menu', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (41, '部门新增', 'permission', NULL, 'department:add', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (42, '部门修改', 'permission', NULL, 'department:edit', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (43, '部门删除', 'permission', NULL, 'department:delete', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (44, '原材料管理', 'menu', NULL, NULL, NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (45, '原材料新增', 'permission', NULL, 'rawmaterial:add', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (46, '原材料修改', 'permission', NULL, 'rawmaterial:edit', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (47, '原材料删除', 'permission', NULL, 'rawmaterial:delete', NULL, NULL, NULL, '1');
INSERT INTO `sys_permission` VALUES (50, '员工管理', 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (51, '员工新增', 'permission', NULL, 'employee:add', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (52, '员工修改', 'permission', NULL, 'employee:edit', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (53, '员工删除', 'permission', NULL, 'employee:delete', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (60, '作业管理', 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (61, '作业新增', 'permission', NULL, 'work:add', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (62, '作业修改', 'permission', NULL, 'work:edit', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (63, '作业删除', 'permission', NULL, 'work:delete', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (200, '用户管理', 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (201, '用户新增', 'permission', NULL, 'user:add', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (202, '用户修改', 'permission', NULL, 'user:edit', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (203, '用户删除', 'permission', NULL, 'user:delete', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (210, '角色管理', 'menu', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (211, '角色新增', 'permission', NULL, 'role:add', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (212, '角色修改', 'permission', NULL, 'role:edit', NULL, NULL, NULL, NULL);
INSERT INTO `sys_permission` VALUES (213, '角色删除', 'permission', NULL, 'role:delete', NULL, NULL, NULL, NULL);

DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_role` VALUES ('001', '超级管理员', '1');
INSERT INTO `sys_role` VALUES ('002', '订单管理员', '1');
INSERT INTO `sys_role` VALUES ('004', '物料管理员', '1');
INSERT INTO `sys_role` VALUES ('005', '普通用户', '1');
INSERT INTO `sys_role` VALUES ('007', '设备管理员', '1');
INSERT INTO `sys_role` VALUES ('008', '业务员', '1');

DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(300) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_role_permission` VALUES ('1456115611515', '002', '11,12,13,201,202,203,');
INSERT INTO `sys_role_permission` VALUES ('147729449886163', '15615615151', '11,12,13,231,232,233,271,273,');
INSERT INTO `sys_role_permission` VALUES ('147737863632731', '005', '11,33,81,83,91,93,101,102,103,121,192,131,133,151,153,173,273,252,51,53,');
INSERT INTO `sys_role_permission` VALUES ('148007157091762', '004', '181,182,183,191,192,193,221,222,223,');
INSERT INTO `sys_role_permission` VALUES ('148255367614063', '007', NULL);
INSERT INTO `sys_role_permission` VALUES ('149122370655248', '31931', NULL);
INSERT INTO `sys_role_permission` VALUES ('149122382565714', '424', NULL);
INSERT INTO `sys_role_permission` VALUES ('149122469890916', '3213', NULL);
INSERT INTO `sys_role_permission` VALUES ('149122510431476', '3214321', NULL);
INSERT INTO `sys_role_permission` VALUES ('149122513769244', '213213213', '11,12,13,');
INSERT INTO `sys_role_permission` VALUES ('45454545', '008', '11,12,13');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f21', '001', '11,12,13,21,22,23,31,32,33,34,35,36,37,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,231,232,233,271,272,273,241,242,243,251,252,253,261,262,263,41,42,43,44,45,46,47,51,52,53,201,202,203,211,212,213,');

DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(50) NOT NULL COMMENT '用户ID',
  `USER_NAME` varchar(50) DEFAULT NULL COMMENT '用户名',
  `USER_NUMBER` varchar(50) DEFAULT NULL COMMENT '用户工号',
  `PASSWORD` varchar(50) DEFAULT NULL COMMENT '密码',
  `NAME` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `LAST_LOGIN` datetime DEFAULT NULL COMMENT '最近登录时间',
  `IP` varchar(100) DEFAULT NULL COMMENT 'IP',
  `STATUS` char(1) DEFAULT NULL COMMENT '状态',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `EMAIL` varchar(32) DEFAULT NULL COMMENT '邮箱',
  `NUMBER` varchar(100) DEFAULT NULL COMMENT '编码',
  `PHONE` varchar(32) DEFAULT NULL COMMENT '电话',
  `DEL_FLAG` int(2) DEFAULT '0' COMMENT '是否删除',
  `CREATE_TIME` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `LOSE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_user` VALUES ('001', 'admin', NULL, '123', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, '2019-05-17 17:09:19', NULL, NULL);
INSERT INTO `sys_user` VALUES ('002', '22', NULL, '22', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, '2019-05-17 11:37:01', NULL, NULL);
INSERT INTO `sys_user` VALUES ('003', '张三', NULL, 'aaa', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, 0, '2019-05-17 11:37:01', NULL, NULL);

DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sys_user_role` VALUES ('001', '001', '001');
INSERT INTO `sys_user_role` VALUES ('147705484492576', '003', '002');
INSERT INTO `sys_user_role` VALUES ('148228593447685', '004', '005');
INSERT INTO `sys_user_role` VALUES ('148232608456017', '002', '001');
INSERT INTO `sys_user_role` VALUES ('148232650257115', '005', '002');
INSERT INTO `sys_user_role` VALUES ('148237251058254', '321321', '004');
INSERT INTO `sys_user_role` VALUES ('148237503507696', '3213', '005');
INSERT INTO `sys_user_role` VALUES ('148249856407793', '006', '002');
INSERT INTO `sys_user_role` VALUES ('148255363744945', '007', '004');
INSERT INTO `sys_user_role` VALUES ('45451', '001', '008');

DROP TABLE IF EXISTS `cont_out_in_ralation`;
CREATE TABLE `cont_out_in_ralation` (
  `ralation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `con_detaill_id` bigint(20) DEFAULT NULL,
  `out_in_id` bigint(20) NOT NULL,
  `ralation_status` varchar(255) NOT NULL COMMENT '关系状态：0-有效；1无效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ralation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同ID',
  `code` varchar(64) NOT NULL COMMENT '合同编号',
  `name` varchar(64) NOT NULL COMMENT '合同名称',
  `manager` varchar(64) NOT NULL COMMENT '合同经办人',
  `create_time` datetime NOT NULL COMMENT '合同签订时间',
  `status` char(1) DEFAULT '0' COMMENT '合同状态',
  `delevey_date` varchar(10) NOT NULL COMMENT '交货日期',
  `attachment` varchar(128) DEFAULT NULL COMMENT '附件信息',
  `update_time` datetime DEFAULT NULL COMMENT '合同更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `contract_detail`;
CREATE TABLE `contract_detail` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同明细ID',
  `cont_id` bigint(10) DEFAULT NULL COMMENT '合同ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '产品ID',
  `prod_type` char(1) DEFAULT NULL COMMENT '产品类型（产品/半成品）',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `pro_unit` varchar(10) DEFAULT NULL COMMENT '产品单位',
  `un_quantity` int(11) DEFAULT NULL COMMENT '未完成数量',
  `specification` varchar(128) DEFAULT '0' COMMENT '产品规格',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `prod_code` varchar(20) DEFAULT NULL COMMENT '产品编号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '合同明细更新时间',
  `prod_manager` varchar(64) DEFAULT NULL COMMENT '生产责任人',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_conid` (`cont_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `contract_detail_trace`;
CREATE TABLE `contract_detail_trace` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同明细ID',
  `cont_id` bigint(10) DEFAULT NULL COMMENT '合同ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '产品ID',
  `prod_type` char(1) DEFAULT NULL COMMENT '产品类型（产品/半成品）',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `delivery_list`;
CREATE TABLE `delivery_list`  (
  `id` bigint(10) NOT NULL COMMENT '出库单ID',
  `delivery_code` varchar(32) NOT NULL COMMENT '出库单号',
  `delevey_date` datetime(0) NOT NULL COMMENT '发货日期',
  `delevey_address` varchar(128) DEFAULT NULL COMMENT '发货地址',
  `create_user` varchar(32) DEFAULT NULL COMMENT '创建人员',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `contracts` varchar(64) NOT NULL COMMENT '合同ID',
  `status` char(1) DEFAULT '0' COMMENT '合同ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `delivery_list_detail`;
CREATE TABLE `delivery_list_detail` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '出库单明细ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '产品ID',
  `cont_id` bigint(10) DEFAULT NULL COMMENT '合同ID',
  `quantity` int(11) NOT NULL COMMENT '出库数量',
  `pro_unit` varchar(10) DEFAULT NULL COMMENT '产品单位',
  `delivery_list_id` bigint(10) DEFAULT NULL COMMENT '出库单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `prod_code` varchar(20) DEFAULT NULL COMMENT '产品编号',
  `quantity` int(11) DEFAULT '0' COMMENT '库存数',
  `prod_name` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `usable_quantity` int(11) DEFAULT '0' COMMENT '可用库存数',
  `threshold` varchar(11) DEFAULT '-1' COMMENT '阀值',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `create_time` datetime NOT NULL COMMENT '库存创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '库存更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_code` (`prod_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `prod_record`;
CREATE TABLE `prod_record` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '生产信息ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '半产品ID',
  `prod_type` char(1) DEFAULT NULL COMMENT '产品类型（产品/半成品）',
  `cont_id` bigint(10) DEFAULT NULL COMMENT '合同ID',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `producer` varchar(64) DEFAULT NULL COMMENT '生产人',
  `oqc` char(1) DEFAULT NULL COMMENT '质检',
  `oqc_user` varchar(10) DEFAULT NULL COMMENT '质检人',
  `create_time` datetime NOT NULL COMMENT '生产时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `name` varchar(64) NOT NULL COMMENT '产品名称',
  `code` varchar(64) NOT NULL COMMENT '产品编号',
  `type` char(1) DEFAULT NULL COMMENT '产品类型（产品有不同的类型）',
  `specification` varchar(64) NOT NULL COMMENT '产品规格',
  `attachment` varchar(128) DEFAULT NULL COMMENT '附件信息',
  `semi_prod_cons` varchar(512) NOT NULL COMMENT '半产品组成信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `category` char(1) DEFAULT '0' NOT NULL COMMENT '产品分类',
  PRIMARY KEY (`id`) USING BTREE
  UNIQUE KEY `idx_product` (`name`,`code`,`specification`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `product_plan_info`;
CREATE TABLE `product_plan_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cont_id` bigint(20) DEFAULT NULL COMMENT '合同ID',
  `pro_id` bigint(20) DEFAULT NULL,
  `pro_type` char(1) NOT NULL COMMENT '0-产品；1-半产品',
  `pro_code` varchar(20) DEFAULT NULL COMMENT '产品编号',
  `pro_name` varchar(20) DEFAULT NULL COMMENT '产品名字',
  `pro_num` int(11) DEFAULT NULL COMMENT '产品数量',
  `pro_unit` varchar(10) DEFAULT NULL COMMENT '产品单位',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_contId` (`cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `project_info`;
CREATE TABLE `project_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_code` varchar(20) DEFAULT NULL COMMENT '生产计划编号',
  `project_name` varchar(20) DEFAULT NULL COMMENT '工程名称',
  `cont_id` bigint(20) DEFAULT NULL,
  `delevey_date` varchar(10) NOT NULL COMMENT '交货日期',
  `create_time` datetime NOT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_contId` (`cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `raw_material`;
CREATE TABLE `raw_material` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '原材料ID',
  `name` varchar(64) NOT NULL COMMENT '原材料名称',
  `code` varchar(64) NOT NULL COMMENT '原材料编号',
  `supplier` varchar(64) NOT NULL COMMENT '供应商',
  `attachment` varchar(128) DEFAULT NULL COMMENT '附件信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `idx_raw_material` (`name`,`code`,`supplier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `semi_product`;
CREATE TABLE `semi_product` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '半产品ID',
  `name` varchar(64) NOT NULL COMMENT '半产品名称',
  `code` varchar(64) NOT NULL COMMENT '半产品编号',
  `specification` varchar(64) NOT NULL COMMENT '半产品规格',
  `tickness` varchar(16) NOT NULL COMMENT '半产品厚度',
  `inner_resin` varchar(64) NOT NULL COMMENT '内衬树脂',
  `structural_resin` varchar(64) NOT NULL COMMENT '结构树脂',
  `outer_resin` varchar(64) NOT NULL COMMENT '外层树脂',
  `attachment` varchar(128) DEFAULT NULL COMMENT '附件信息',
  `raw_material_cons` varchar(256) NOT NULL COMMENT '原材料消耗',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
  UNIQUE KEY `idx_semi_product` (`name`,`code`,`specification`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `warehourse_defective`;
CREATE TABLE `warehourse_defective` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '残次品ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '半产品ID',
  `prod_type` char(1) DEFAULT NULL COMMENT '产品类型（产品/半成品）',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `warehourse_entry`;
CREATE TABLE `warehourse_entry` (
  `id` bigint(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '入库单ID',
  `prod_id` bigint(10) DEFAULT NULL COMMENT '产品ID',
  `prod_type` char(1) DEFAULT NULL COMMENT '半产品/原材料/产品',
  `supplier` varchar(64) DEFAULT NULL COMMENT '供应商(针对原材料)',
  `oqa_status` char(1) DEFAULT NULL COMMENT '质检状态：0-合格；1-不合格可利用；2不合格废弃',
  `oqa_user` varchar(64) DEFAULT NULL COMMENT '质检人',
  `prod_manager` varchar(64) DEFAULT NULL COMMENT '生产责任人',
  `quantity` int(11) NOT NULL COMMENT '入库数量',
  `create_user` varchar(64) NOT NULL COMMENT '入库人',
  `create_time` datetime NOT NULL COMMENT '入库时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `rawmt_out_detail_info`;
CREATE TABLE `rawmt_out_detail_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rawmt_out_code` varchar(30) DEFAULT NULL COMMENT '出库编号',
  `raw_code` varchar(30) NOT NULL COMMENT '原材料编号',
  `out_num` int(11) DEFAULT NULL COMMENT '出库数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`rawmt_out_code`),
  KEY `idx_raw_code` (`raw_code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rawmt_out_info
-- ----------------------------
DROP TABLE IF EXISTS `rawmt_out_info`;
CREATE TABLE `rawmt_out_info` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `rawmt_out_code` varchar(30) DEFAULT NULL COMMENT '原材料领料编号',
  `applicant` varchar(10) DEFAULT NULL COMMENT '申请人',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
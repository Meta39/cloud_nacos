/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 16/05/2022 11:08:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (14, 'gateway', 'DEFAULT_GROUP', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nnot-filter-paths: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '9ce631ee0b1159420adbeecee10acd9a', '2022-05-13 23:40:54', '2022-05-16 09:09:47', 'nacos', '0:0:0:0:0:0:0:1', '', '', '', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (15, 'redis_config', 'DEFAULT_GROUP', 'spring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000', '8bdc41fa7d045d7399e939d563fbfc00', '2022-05-13 23:40:54', '2022-05-16 09:09:59', 'nacos', '0:0:0:0:0:0:0:1', '', '', 'redis配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (16, 'base', 'DEFAULT_GROUP', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n\nserver:\n  port: 81\n\nspring:\n  jackson:\n    date-format: yyyy-MM-dd hh:mm:ss\n    time-zone: GMT+8\n    # null字段不返回前端\n    default-property-inclusion: non_null\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.dao: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '57bb6e09f90d2c8c03a2084a833efaab', '2022-05-13 23:40:54', '2022-05-16 09:47:53', 'nacos', '0:0:0:0:0:0:0:1', '', '', '基础系统', '', '', 'yaml', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: ums\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://ums\n          predicates:\n            #路径配置\n            - Path=/ums/**\n        - id: log\n          uri: lb://log\n          predicates:\n            - Path=/log/**', 'dc750d585252a96bf4f3e95b04d30f4e', '2022-05-13 19:36:36', '2022-05-13 19:36:36', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 2, 'ums', 'DEFAULT_GROUP', '', 'server:\n  port: 83\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ums-sentinel\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/ums?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.ums.entity\n\nlogging:\n  level:\n    com.jw.ums.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n#sentinel openFeign调用\nfeign:\n  sentinel:\n    enabled: true', '9b1bb036875b74ee8ac7d61dfcc541e2', '2022-05-13 19:36:36', '2022-05-13 19:36:36', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 3, 'log', 'DEFAULT_GROUP', '', 'server:\n  port: 85\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      transport:\n        dashboard: localhost:84\n        port: 8719\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/log?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.log.entity\n\nlogging:\n  level:\n    com.jw.log.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '2786ecaf311499d0437c4d51a95ded89', '2022-05-13 19:36:36', '2022-05-13 19:36:36', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 4, 'ums-sentinel', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"/user/select\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'cb20fdfb9cd4720959d2ac6cb0674376', '2022-05-13 19:36:36', '2022-05-13 19:36:36', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (4, 5, 'ums-sentinel', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"/user/select\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'cb20fdfb9cd4720959d2ac6cb0674376', '2022-05-13 19:36:44', '2022-05-13 19:36:44', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (2, 6, 'ums', 'DEFAULT_GROUP', '', 'server:\n  port: 83\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ums-sentinel\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/ums?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.ums.entity\n\nlogging:\n  level:\n    com.jw.ums.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n#sentinel openFeign调用\nfeign:\n  sentinel:\n    enabled: true', '9b1bb036875b74ee8ac7d61dfcc541e2', '2022-05-13 19:36:54', '2022-05-13 19:36:54', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (3, 7, 'log', 'DEFAULT_GROUP', '', 'server:\n  port: 85\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      transport:\n        dashboard: localhost:84\n        port: 8719\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/log?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.log.entity\n\nlogging:\n  level:\n    com.jw.log.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '2786ecaf311499d0437c4d51a95ded89', '2022-05-13 19:36:54', '2022-05-13 19:36:54', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (1, 8, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: ums\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://ums\n          predicates:\n            #路径配置\n            - Path=/ums/**\n        - id: log\n          uri: lb://log\n          predicates:\n            - Path=/log/**', 'dc750d585252a96bf4f3e95b04d30f4e', '2022-05-13 19:37:13', '2022-05-13 19:37:13', 'nacos', '0:0:0:0:0:0:0:1', 'U', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 9, 'redis_config', 'DEFAULT_GROUP', '', 'spring:\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000', 'c3316b797932ecbc72619231acbd4082', '2022-05-13 19:37:33', '2022-05-13 19:37:34', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (1, 10, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: ums\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://ums\n          predicates:\n            #路径配置\n            - Path=/ums/**\n        - id: log\n          uri: lb://log\n          predicates:\n            - Path=/log/**', 'dc750d585252a96bf4f3e95b04d30f4e', '2022-05-13 19:38:27', '2022-05-13 19:38:28', 'nacos', '0:0:0:0:0:0:0:1', 'U', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 11, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: ums\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://ums\n          predicates:\n            #路径配置\n            - Path=/ums/**\n        - id: log\n          uri: lb://log\n          predicates:\n            - Path=/log/**', 'dc750d585252a96bf4f3e95b04d30f4e', '2022-05-13 20:06:34', '2022-05-13 20:06:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 12, 'ums', 'DEFAULT_GROUP', '', 'server:\n  port: 83\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ums-sentinel\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/ums?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.ums.entity\n\nlogging:\n  level:\n    com.jw.ums.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n#sentinel openFeign调用\nfeign:\n  sentinel:\n    enabled: true', '9b1bb036875b74ee8ac7d61dfcc541e2', '2022-05-13 20:06:34', '2022-05-13 20:06:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 13, 'log', 'DEFAULT_GROUP', '', 'server:\n  port: 85\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      transport:\n        dashboard: localhost:84\n        port: 8719\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/log?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.log.entity\n\nlogging:\n  level:\n    com.jw.log.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '2786ecaf311499d0437c4d51a95ded89', '2022-05-13 20:06:34', '2022-05-13 20:06:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 14, 'ums-sentinel', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"/user/select\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'cb20fdfb9cd4720959d2ac6cb0674376', '2022-05-13 20:06:34', '2022-05-13 20:06:34', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 15, 'base', 'DEFAULT_GROUP', '', 'server:\r\n  port: 81\r\n\r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8848\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    #url中database为对应的数据库名称\r\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\nmybatis:\r\n  mapper-locations: classpath:mapping/*.xml\r\n  type-aliases-package: com.fu.base.entity\r\n\r\nlogging:\r\n  level:\r\n    com.fu.base.mapper: debug\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'', '2bedef8cc2f7a13c200bdd80e1d2423c', '2022-05-13 20:07:47', '2022-05-13 20:07:48', NULL, '0:0:0:0:0:0:0:1', 'I', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (8, 16, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: ums\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://ums\n          predicates:\n            #路径配置\n            - Path=/ums/**\n        - id: log\n          uri: lb://log\n          predicates:\n            - Path=/log/**', 'dc750d585252a96bf4f3e95b04d30f4e', '2022-05-13 20:08:05', '2022-05-13 20:08:05', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (9, 17, 'ums', 'DEFAULT_GROUP', '', 'server:\n  port: 83\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      eager: true\n      transport:\n        dashboard: localhost:84\n        port: 8719\n      datasource:\n        ds1:\n          nacos:\n            server-addr: localhost:8848\n            dataId: ums-sentinel\n            groupId: DEFAULT_GROUP\n            data-type: json\n            rule-type: flow\n  redis:\n    host: localhost\n    port: 6379\n    password:\n    connect-timeout: 30000\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/ums?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.ums.entity\n\nlogging:\n  level:\n    com.jw.ums.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'\n\n#sentinel openFeign调用\nfeign:\n  sentinel:\n    enabled: true', '9b1bb036875b74ee8ac7d61dfcc541e2', '2022-05-13 20:08:05', '2022-05-13 20:08:05', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (10, 18, 'log', 'DEFAULT_GROUP', '', 'server:\n  port: 85\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    sentinel:\n      transport:\n        dashboard: localhost:84\n        port: 8719\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/log?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.jw.log.entity\n\nlogging:\n  level:\n    com.jw.log.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '2786ecaf311499d0437c4d51a95ded89', '2022-05-13 20:08:05', '2022-05-13 20:08:05', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (11, 19, 'ums-sentinel', 'DEFAULT_GROUP', '', '[\n    {\n        \"resource\": \"/user/select\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'cb20fdfb9cd4720959d2ac6cb0674376', '2022-05-13 20:08:05', '2022-05-13 20:08:05', NULL, '0:0:0:0:0:0:0:1', 'D', '');
INSERT INTO `his_config_info` VALUES (1, 20, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: bs\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://bs\n          predicates:\n            #路径配置\n            - Path=/bs/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '16a069aaf8923ba5299b5580a93a962a', '2022-05-13 20:09:52', '2022-05-13 20:09:52', 'nacos', '0:0:0:0:0:0:0:1', 'U', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (0, 21, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '0b540dc2189200fe1ba39833adc88fd3', '2022-05-13 23:40:54', '2022-05-13 23:40:54', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 22, 'redis_config', 'DEFAULT_GROUP', '', 'spring:\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000', 'c3316b797932ecbc72619231acbd4082', '2022-05-13 23:40:54', '2022-05-13 23:40:54', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (0, 23, 'base', 'DEFAULT_GROUP', '', 'server:\r\n  port: 81\r\n\r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8848\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    #url中database为对应的数据库名称\r\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\nmybatis:\r\n  mapper-locations: classpath:mapping/*.xml\r\n  type-aliases-package: com.fu.base.entity\r\n\r\nlogging:\r\n  level:\r\n    com.fu.base.mapper: debug\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'', '2bedef8cc2f7a13c200bdd80e1d2423c', '2022-05-13 23:40:54', '2022-05-13 23:40:54', NULL, '0:0:0:0:0:0:0:1', 'I', '');
INSERT INTO `his_config_info` VALUES (1, 24, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '0b540dc2189200fe1ba39833adc88fd3', '2022-05-13 23:40:59', '2022-05-13 23:40:59', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (6, 25, 'redis_config', 'DEFAULT_GROUP', '', 'spring:\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000', 'c3316b797932ecbc72619231acbd4082', '2022-05-13 23:40:59', '2022-05-13 23:40:59', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (12, 26, 'base', 'DEFAULT_GROUP', '', 'server:\r\n  port: 81\r\n\r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8848\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    #url中database为对应的数据库名称\r\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\nmybatis:\r\n  mapper-locations: classpath:mapping/*.xml\r\n  type-aliases-package: com.fu.base.entity\r\n\r\nlogging:\r\n  level:\r\n    com.fu.base.mapper: debug\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'', '2bedef8cc2f7a13c200bdd80e1d2423c', '2022-05-13 23:40:59', '2022-05-13 23:40:59', NULL, '0:0:0:0:0:0:0:1', 'D', '8c5b18b2-929a-40a0-ba2e-a7714c61d249');
INSERT INTO `his_config_info` VALUES (14, 27, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '0b540dc2189200fe1ba39833adc88fd3', '2022-05-13 23:47:07', '2022-05-13 23:47:08', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (15, 28, 'redis_config', 'DEFAULT_GROUP', '', 'spring:\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000', 'c3316b797932ecbc72619231acbd4082', '2022-05-13 23:47:18', '2022-05-13 23:47:19', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 29, 'base', 'DEFAULT_GROUP', '', 'server:\r\n  port: 81\r\n\r\nspring:\r\n  cloud:\r\n    nacos:\r\n      discovery:\r\n        server-addr: localhost:8848\r\n  redis:\r\n    host: localhost\r\n    port: 6379\r\n    password:\r\n    connect-timeout: 30000\r\n  datasource:\r\n    username: root\r\n    password: 123456\r\n    #url中database为对应的数据库名称\r\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\r\n    driver-class-name: com.mysql.cj.jdbc.Driver\r\n\r\nmybatis:\r\n  mapper-locations: classpath:mapping/*.xml\r\n  type-aliases-package: com.fu.base.entity\r\n\r\nlogging:\r\n  level:\r\n    com.fu.base.mapper: debug\r\n\r\nmanagement:\r\n  endpoints:\r\n    web:\r\n      exposure:\r\n        include: \'*\'', '2bedef8cc2f7a13c200bdd80e1d2423c', '2022-05-13 23:47:35', '2022-05-13 23:47:35', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 30, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nfilter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', 'a7646c630d423cf72a028d18364d5808', '2022-05-14 10:20:00', '2022-05-14 10:20:00', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 31, 'base', 'DEFAULT_GROUP', '', 'server:\n  port: 81\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n    connect-timeout: 30000\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://127.0.0.1:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', 'b04bf5843dbcad226f514ffdeb3ab629', '2022-05-14 10:24:25', '2022-05-14 10:24:25', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 32, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nnot-filter-path: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '387be9780fa44d7085d9de1356e04750', '2022-05-14 10:26:14', '2022-05-14 10:26:15', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 33, 'base', 'DEFAULT_GROUP', '', 'server:\n  port: 81\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://127.0.0.1:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapping/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.mapper: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', 'be6446636a81107743095cfc6c9e0eae', '2022-05-14 13:53:18', '2022-05-14 13:53:19', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 34, 'base', 'DEFAULT_GROUP', '', 'server:\n  port: 81\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://127.0.0.1:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.dao: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', 'f3ea69a343ff5d37726c6c24b9bc700e', '2022-05-15 16:11:44', '2022-05-15 16:11:44', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (14, 35, 'gateway', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n#filter 过滤地址\nnot-filter-paths: \"/login,/logout\"\n\nserver:\n  port: 80\n  max-http-header-size: 102400\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n    gateway:\n      discovery:\n        locator:\n          enabled: true\n          lower-case-service-id: true\n      routes:\n        - id: base\n          #nacos 配置管理——》配置列表的Data Id\n          uri: lb://base\n          predicates:\n            #路径配置\n            - Path=/base/**\n        - id: demo\n          uri: lb://demo\n          predicates:\n            - Path=/demo/**', '98409a29f8d4e6e6f26f39e5e0feaa07', '2022-05-16 09:09:46', '2022-05-16 09:09:47', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (15, 36, 'redis_config', 'DEFAULT_GROUP', '', 'spring:\n  redis:\n    host: 127.0.0.1\n    port: 6379\n    password:\n    connect-timeout: 30000', 'b00944dc98dca198b60bf6daa3303af2', '2022-05-16 09:09:59', '2022-05-16 09:09:59', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 37, 'base', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n\nserver:\n  port: 81\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: 127.0.0.1:8848\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://127.0.0.1:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.dao: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '9f039d675c755ef9b7ae77edb8a6de5a', '2022-05-16 09:10:31', '2022-05-16 09:10:32', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');
INSERT INTO `his_config_info` VALUES (16, 38, 'base', 'DEFAULT_GROUP', '', '#token超时时间设置，单位为秒\ntoken-overtime: 3600\n\nserver:\n  port: 81\n\nspring:\n  cloud:\n    nacos:\n      discovery:\n        server-addr: localhost:8848\n  datasource:\n    username: root\n    password: 123456\n    #url中database为对应的数据库名称\n    url: jdbc:mysql://localhost:3306/base?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone=Asia/Shanghai\n    driver-class-name: com.mysql.cj.jdbc.Driver\n\nmybatis:\n  mapper-locations: classpath:mapper/*.xml\n  type-aliases-package: com.fu.base.entity\n\nlogging:\n  level:\n    com.fu.base.dao: debug\n\nmanagement:\n  endpoints:\n    web:\n      exposure:\n        include: \'*\'', '32c25410b628921eac747c0c132fa4e8', '2022-05-16 09:47:53', '2022-05-16 09:47:53', 'nacos', '0:0:0:0:0:0:0:1', 'U', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;

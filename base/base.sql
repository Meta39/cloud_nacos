/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : base

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 16/05/2022 11:09:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门ID',
  `parent_dept_id` bigint NULL DEFAULT NULL COMMENT '父部门ID',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES (1, 0, '全部部门', '2022-05-15 11:53:13');
INSERT INTO `dept` VALUES (2, 1, '研发部门', '2022-05-15 15:22:46');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志UUID',
  `log_type` int NOT NULL COMMENT '日志类型：1登录日志；2操作日志；3系统日志',
  `client_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端IP地址',
  `system_ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统IP地址',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `res` tinyint NULL DEFAULT NULL COMMENT '结果：0失败，1成功',
  `fail_code` int NULL DEFAULT NULL COMMENT '失败的状态码',
  `content` varchar(8888) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('0378f646-3499-4d7c-80d9-7526494b1119', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 16:57:09');
INSERT INTO `log` VALUES ('051b4e51-b4f4-4dc6-9da2-ebbe1656bc74', 1, '192.168.137.1', '192.168.137.1', 1, 'x', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"x\",\"fokHgbco2fQU2XJDxozgDSEtAi9RdHXC WPMPtCgJ5QBI1WXyb0 TK97xL8PRenNb6P w76xQCn2aoqrMZJLFw==\"]', '2022-05-15 16:32:42');
INSERT INTO `log` VALUES ('089f08a4-96fd-446b-bd0e-cb58cba013a0', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:51:20');
INSERT INTO `log` VALUES ('0a8bf50d-e67e-40a7-ae6a-92bbe98782a2', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 20:48:58');
INSERT INTO `log` VALUES ('0baf6cb3-1d60-4914-acba-86d33827518e', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:10:54');
INSERT INTO `log` VALUES ('0ddd9b0d-259f-4994-95fb-3f89295cef92', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:41:24');
INSERT INTO `log` VALUES ('154d4170-8cbb-47d3-8966-e58e0fa4d179', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:36:39');
INSERT INTO `log` VALUES ('19825cce-e18d-4194-8a24-b5d125afb0d8', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:11:19');
INSERT INTO `log` VALUES ('1b20e527-8db4-41bd-a904-5f169ea791dc', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:41:53');
INSERT INTO `log` VALUES ('1c22b474-3f93-4da4-8a10-b3ce9f282560', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:29:18');
INSERT INTO `log` VALUES ('1e4d654b-66dd-48b4-a952-a366d8dd4636', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:02:40');
INSERT INTO `log` VALUES ('1ea9e689-b62d-499f-845c-567812740707', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:09:09');
INSERT INTO `log` VALUES ('2196b3b3-d7c4-45a7-b7de-517e357a10a8', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:36:38');
INSERT INTO `log` VALUES ('2521557a-7e8a-4d83-b76d-4e8b3607c390', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:35:01');
INSERT INTO `log` VALUES ('32e3cfb7-cafe-40d4-be21-1eac8919a577', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:32:07');
INSERT INTO `log` VALUES ('37e03599-f47d-4723-a609-b6b779d387be', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 20:26:58');
INSERT INTO `log` VALUES ('38516b24-ec5e-4d92-b298-33d5bdb8ced9', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:06:46');
INSERT INTO `log` VALUES ('3fb920a7-6074-4031-a233-1dfd71873fac', 1, '192.168.137.1', '192.168.137.1', 1, NULL, 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"x\",\"fokHgbco2fQU2XJDxozgDSEtAi9RdHXC WPMPtCgJ5QBI1WXyb0 TK97xL8PRenNb6P w76xQCn2aoqrMZJLFw==\"]', '2022-05-15 16:29:57');
INSERT INTO `log` VALUES ('44330dde-a424-4e70-bd5e-4d82d3731222', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 16:59:20');
INSERT INTO `log` VALUES ('53857d7f-297f-44f1-bc7f-c31548384bf0', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:18:18');
INSERT INTO `log` VALUES ('57917e8a-376a-4867-b4a9-fec363736fb7', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:01:59');
INSERT INTO `log` VALUES ('57951f98-ac43-4e57-a854-823329840d83', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:40:23');
INSERT INTO `log` VALUES ('5fd0b37d-48f5-4188-944b-9213a26032f8', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:54:47');
INSERT INTO `log` VALUES ('750d95d5-296f-4e67-91c2-d9b6fbf07f14', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:08:04');
INSERT INTO `log` VALUES ('781885fc-87b3-46b1-9724-d5d8537ed15b', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"OZKdREPrCX53h8iP3kN9iqy4m4hIazOnoppJQIs7r1VQ5Nj0bu0v8xCL5DfwUVEM4tZ4JTN3oWNjdR6zjlPhtQ==\"]', '2022-05-15 16:55:28');
INSERT INTO `log` VALUES ('7924769e-b949-4790-89a0-6159cc40cb21', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:45:49');
INSERT INTO `log` VALUES ('7e0c72ed-b13f-4ed5-9ac0-6a242ccfeeb3', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:36:12');
INSERT INTO `log` VALUES ('865f740e-2a57-474b-b8ae-68e018383612', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:49:09');
INSERT INTO `log` VALUES ('8a119ceb-feb5-4c94-9c50-ba154765b59d', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"pmUit7aflcGcD3nEM9SCK0FlJCv 3uOonFpfdm9AbvsLsNy7a/78xeCmt13E9b01iNx17 giFMbkTkleLB9pMw==\"]', '2022-05-15 16:52:42');
INSERT INTO `log` VALUES ('8a370dad-266c-4899-8e74-93557ad20154', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:56:10');
INSERT INTO `log` VALUES ('8bee2c68-30d0-4c57-8f11-7de693f04c8d', 2, '127.0.0.1', '192.168.137.1', 1, 'x', 1, NULL, 'URL：http://127.0.0.1:81/user/select，Request Args：[1]，Response Args：{\"userId\":1,\"userName\":\"x\",\"deleted\":false,\"disabled\":false,\"createTime\":1652507064000,\"lastLoginTime\":null}', '2022-05-14 15:28:34');
INSERT INTO `log` VALUES ('8c3517e6-8725-4145-97d8-ebba0da2a252', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:48:42');
INSERT INTO `log` VALUES ('8c792e5f-d5c6-4802-bcf2-812c8d84eb58', 1, '192.168.137.1', '192.168.137.1', 1, NULL, 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"x\",\"fokHgbco2fQU2XJDxozgDSEtAi9RdHXC WPMPtCgJ5QBI1WXyb0 TK97xL8PRenNb6P w76xQCn2aoqrMZJLFw==\"]', '2022-05-15 16:30:55');
INSERT INTO `log` VALUES ('8d78b814-c072-48f4-a3ea-20d6d292eb8a', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:18:34');
INSERT INTO `log` VALUES ('8e4e23b9-9ac7-4378-b92a-e28a202e5638', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:27:47');
INSERT INTO `log` VALUES ('929f32f9-4ca3-46bc-a640-4072e7e4eb96', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:04:23');
INSERT INTO `log` VALUES ('96505973-67a9-497e-aceb-da298b142647', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:39:23');
INSERT INTO `log` VALUES ('96e2427a-1e56-44b8-9f48-c2ea248b4c10', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 20:13:36');
INSERT INTO `log` VALUES ('9d0e739c-b390-4631-ab95-6238e63b7dd2', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:01:25');
INSERT INTO `log` VALUES ('a4986789-de0c-4d6d-80e5-b119490105de', 2, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'x', 1, NULL, 'URL：http://localhost:81/user/select，Request Args：[1]，Response Args：{\"userId\":1,\"userName\":\"x\",\"deleted\":false,\"disabled\":false,\"createTime\":1652507064000,\"lastLoginTime\":null}', '2022-05-14 15:09:29');
INSERT INTO `log` VALUES ('b3e5c6f6-85ff-4c41-8027-4a6d4d30ea6e', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:50:12');
INSERT INTO `log` VALUES ('b74ad448-1ff4-4543-84c8-76cb54bdc6a5', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:40:12');
INSERT INTO `log` VALUES ('bba8e0b1-0e12-43be-b363-c595c21dfac0', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:03:17');
INSERT INTO `log` VALUES ('c212f2a9-8121-402b-b77f-83b192fa3f0a', 1, '192.168.137.1', '192.168.137.1', 1, 'x', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"x\",\"fokHgbco2fQU2XJDxozgDSEtAi9RdHXC WPMPtCgJ5QBI1WXyb0 TK97xL8PRenNb6P w76xQCn2aoqrMZJLFw==\"]', '2022-05-15 16:38:11');
INSERT INTO `log` VALUES ('c4507dd5-3bc8-4605-9498-04f5a78382e0', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:40:13');
INSERT INTO `log` VALUES ('cbbb8105-802a-4d57-961e-2f330757a970', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"fokHgbco2fQU2XJDxozgDSEtAi9RdHXC WPMPtCgJ5QBI1WXyb0 TK97xL8PRenNb6P w76xQCn2aoqrMZJLFw==\"]', '2022-05-15 16:40:03');
INSERT INTO `log` VALUES ('ccec31f4-5d2b-487c-8433-c0f652a02f12', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 21:40:18');
INSERT INTO `log` VALUES ('cf518bf2-85aa-4ad0-a954-02e909421ae3', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:52:49');
INSERT INTO `log` VALUES ('d635e0c0-4cfa-4b00-a2af-c24752193c87', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:08:27');
INSERT INTO `log` VALUES ('d7247355-43c7-473b-837a-becce223fd4c', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 20:56:49');
INSERT INTO `log` VALUES ('e278033e-73bc-4d7d-9849-cb531508d080', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:39:15');
INSERT INTO `log` VALUES ('e601c3e8-a123-4b7b-b53b-c201de58722d', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:33:37');
INSERT INTO `log` VALUES ('ed392b3b-e5ae-4579-a864-44339d4fd813', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 20:06:28');
INSERT INTO `log` VALUES ('f0625b47-f29b-4340-a706-ead2ae514c1d', 2, '127.0.0.1', '192.168.137.1', 1, 'x', 1, NULL, 'URL：http://127.0.0.1:81/user/select，Request Args：[1]，Response Args：{\"userId\":1,\"userName\":\"x\",\"deleted\":false,\"disabled\":false,\"createTime\":1652507064000,\"lastLoginTime\":null}', '2022-05-14 15:12:41');
INSERT INTO `log` VALUES ('f6c17f28-98dd-4141-815f-8002d74a5077', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 09:56:56');
INSERT INTO `log` VALUES ('f6c8a814-1930-435e-9887-3c902d816517', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 16:58:24');
INSERT INTO `log` VALUES ('f82ec65a-daaa-4f2e-bc37-fa8fa41710de', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:02:26');
INSERT INTO `log` VALUES ('fbfe8eef-f2a9-4a1c-8e90-cf08e9f02993', 1, '0:0:0:0:0:0:0:1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE+QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:14:11');
INSERT INTO `log` VALUES ('ff8a6de7-6f44-4c8a-aa1d-f47bc507ce00', 1, '192.168.137.1', '192.168.137.1', 1, 'admin', 0, NULL, 'URL：http://192.168.137.1:81/login，Request Args：[1,\"admin\",\"VojvIn35dQbonswG8knHdE/7r2kZqnKeyO2lNfpi8iEDhQUcuPYd/z7ZFbnQshl/sZE QIKi3Emn25/ZDXLveA==\"]', '2022-05-15 17:02:30');
INSERT INTO `log` VALUES ('ffc6d320-2cd5-45d5-942c-113d60406242', 1, '0:0:0:0:0:0:0:1', '192.168.18.11', 1, 'admin', 0, NULL, 'URL：http://localhost:81/login，Request Args：[1,\"admin\",\"P/gDLQtSgXnpqrYhKZx5pV/asjr3F3ZrI4Bx96 iuRlr5si1UylcqA9BLlCF/4LxizvM1jnyTS1UU30RNhLF g==\"]', '2022-05-16 10:44:55');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_menu_id` bigint NULL DEFAULT NULL COMMENT '父菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `menu_power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单权限',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '全部菜单', 'insert;delete;update;select', '2022-05-15 11:56:05');
INSERT INTO `menu` VALUES (2, 1, '用户中心', NULL, '2022-05-15 15:23:06');

-- ----------------------------
-- Table structure for portal
-- ----------------------------
DROP TABLE IF EXISTS `portal`;
CREATE TABLE `portal`  (
  `portal_id` bigint NOT NULL AUTO_INCREMENT COMMENT '门户ID',
  `portal_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门户名称',
  `portal_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '门户url',
  `portal_icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门户icon_url',
  `portal_sort` bigint NOT NULL COMMENT '门户排序',
  `disabled` tinyint NULL DEFAULT 0 COMMENT '是否禁用门户',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`portal_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of portal
-- ----------------------------
INSERT INTO `portal` VALUES (1, '基础门户', 'localhost:90', NULL, 1, 0, NULL, '2022-05-15 11:57:44');
INSERT INTO `portal` VALUES (2, '用户中心', 'localhost:91', NULL, 2, 0, NULL, '2022-05-15 12:00:22');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `disabled` tinyint NULL DEFAULT 0 COMMENT '禁用角色：0否1是',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', 0, '2022-05-15 11:53:49');
INSERT INTO `role` VALUES (2, 'java开发工程师', 0, '2022-05-15 15:23:40');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色菜单ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_menu_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE,
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色菜单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (1, 1, 1);
INSERT INTO `role_menu` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'MD5密码',
  `public_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码RSA公钥',
  `private_key` varchar(460) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码RSA私钥',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '删除',
  `disabled` tinyint NULL DEFAULT 0 COMMENT '禁用',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'ndTkYSaMgDT1yFZOFVxnpg==', 'MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAIaeBWppyf9ykdnHcr92u9NAHmLVk3NGzPnwGdDoQBt7jq5ha6F269iL0D9XS3AtiEbdpQtRESyrro15VY6dALcCAwEAAQ==', 'MIIBVAIBADANBgkqhkiG9w0BAQEFAASCAT4wggE6AgEAAkEAhp4FamnJ/3KR2cdyv3a700AeYtWTc0bM+fAZ0OhAG3uOrmFroXbr2IvQP1dLcC2IRt2lC1ERLKuujXlVjp0AtwIDAQABAkAqcwYOKlHSRZSMcgJTMePEl8F9NRAMF9VnMzlQ0Qv2HihVptRPUhd2Nh1NsOqa/r/g1aNgYYBKJ/K3sM5cUFSBAiEA0RZk3aALn8BFaKFVGAVtwKjHkrh8hrVp66vnFwAYrpcCIQCk0jF/1Rd5R9knLgw0zjQ2HoBBLD6k1KfZIjC6txCi4QIhAJFQqxGM5gdFLfgmCGoFe93mb639Ii7NbqwocRd/LahJAiAuQIoBfHP85curcgGc4+zE7yRApcDikoaTqUORcgPqIQIgMINZizQtbEYBmvG8xOSQ5URximMeUMfVUVyrmDYYCQ0=', 0, 0, '2022-05-14 13:44:24', NULL);

-- ----------------------------
-- Table structure for user_dept
-- ----------------------------
DROP TABLE IF EXISTS `user_dept`;
CREATE TABLE `user_dept`  (
  `user_dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户部门ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`user_dept_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `user_dept_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_dept_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_dept
-- ----------------------------
INSERT INTO `user_dept` VALUES (1, 1, 1);
INSERT INTO `user_dept` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_role_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);

SET FOREIGN_KEY_CHECKS = 1;

create database if not exists lms2;

-- 图书表
create table if not exists lms2.`book`
(
    `book_id` bigint not null comment '书号' primary key,
    `is_deleted` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)',
    `author` varchar(256) default '未知' null comment '作者',
    `number` varchar(256) default '0' not null comment '库存数量',
    `reading_number` bigint default 0 null comment '正在阅读数',
    `press` varchar(256) default '未知' null comment '出版社',
    `book_name` varchar(256) not null comment '书名',
    `press_time` datetime default '2022-10-17 12:35:16' null comment '印刷时间',
    `stars` bigint default 0 null comment '收藏',
    `likes` bigint default 0 null comment '点赞数',
    `price` decimal default 0 not null comment '价格',
    `summary` varchar(256) default '无' null comment '摘要',
    `cover_pic` varchar(256) default '无封面' null comment '图片的url地址'
) comment '图书表';

insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (1223346223184, '孟聪健', '74', 0, 'L@H出版社', '《b<?fO》', '2022-10-17 12:35:16', 0, 0, 811);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (9122671928351, '高胤祥', '13', 0, '3h6出版社', '《Xl9》', '2022-10-17 12:35:16', 0, 0, 177);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (9551457593558, '孟思远', '71', 0, 'ko出版社', '《UIP》', '2022-10-17 12:35:16', 0, 0, 593);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (7399465868142, '段明辉', '93', 0, 'B0出版社', '《8Uq》', '2022-10-17 12:35:16', 0, 0, 145);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (6453489639729, '彭远航', '99', 0, '6[出版社', '《=abMZ》', '2022-10-17 12:35:16', 0, 0, 763);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (6568484619296, '王嘉熙', '49', 0, 'Uhn出版社', '《2h]》', '2022-10-17 12:35:16', 0, 0, 43);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (4646761946215, '邱鹏', '522', 0, 'Ag出版社', '《DjsR》', '2022-10-17 12:35:16', 0, 0, 989);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (1385310779056, '袁炎彬', '986', 0, 'rs出版社', '《JofMD》', '2022-10-17 12:35:16', 0, 0, 14);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (3418539290300, '严绍齐', '736', 0, '\p出版社', '《MMIjY》', '2022-10-17 12:35:16', 0, 0, 62);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (5538703856933, '许炫明', '60', 0, ';r出版社', '《hO[Q》', '2022-10-17 12:35:16', 0, 0, 14);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (6800591041525, '龚晟睿', '430', 0, 'Cq出版社', '《p2>》', '2022-10-17 12:35:16', 0, 0, 543);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (3841465747783, '朱伟泽', '633', 0, '\g出版社', '《goa》', '2022-10-17 12:35:16', 0, 0, 22);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (4851882721455, '孔志泽', '890', 0, 't;o出版社', '《tj1k》', '2022-10-17 12:35:16', 0, 0, 388);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (6814731827308, '蔡俊驰', '85', 0, '\kl出版社', '《aEh8》', '2022-10-17 12:35:16', 0, 0, 298);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (2233230472186, '陈晓博', '40', 0, 'uE出版社', '《9ia》', '2022-10-17 12:35:16', 0, 0, 28);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (9153605901176, '雷思源', '383', 0, 'D]出版社', '《dqf》', '2022-10-17 12:35:16', 0, 0, 52);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (6732078072241, '梁子涵', '43', 0, 'nX出版社', '《mrhq》', '2022-10-17 12:35:16', 0, 0, 581);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (2465770552656, '金思', '97', 0, 'HE出版社', '《4_V7i》', '2022-10-17 12:35:16', 0, 0, 94);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (0876420648924, '蔡鹏', '664', 0, 'HN出版社', '《[Zo》', '2022-10-17 12:35:16', 0, 0, 207);
insert into lms2.`book` (`book_id`, `author`, `number`, `reading_number`, `press`, `book_name`, `press_time`, `stars`, `likes`, `price`) values (1038187923071, '潘炎彬', '177', 0, 'jA@出版社', '《tn;=》', '2022-10-17 12:35:16', 0, 0, 780);
-- 用户
create table if not exists lms2.`user`
(
    `user_name`     varchar(256)                     not null comment '用户名',
    `user_id`       bigint                           not null comment '用户id' primary key,
    `password`      varchar(256) default '123456789' not null comment '密码',
    `gender`        varchar(256) default '未知'      null comment '用户性别',
    `phone_number`  varchar(256)                     not null comment '手机号',
    `borrow_number` int          default 0           null comment '借阅数',
    `email`         varchar(256) default '未填写'    null comment '邮箱',
    `avatar_pic`    varchar(256)                     null comment '头像',
    `balance`       decimal      default 0           null comment '余额'
) comment '用户';

insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('孟致远', 1152393901749, '123456789', '男', '94188578036', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('张健雄', 0691799090120, '123456789', '男', '86859642139', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('马航', 6649671878969, '123456789', '男', '24152522970', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('蒋立轩', 3175171457007, '123456789', '男', '28473871977', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('彭鑫鹏', 6279649625417, '123456789', '男', '97686523081', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('苏思源', 8576028946099, '123456789', '女', '35507757246', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('武哲瀚', 8020743140876, '123456789', '男', '76414464583', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('尹鹏煊', 3535236915067, '123456789', '女', '14146423077', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('孔博超', 2218201562986, '123456789', '男', '34584340385', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('梁浩', 0728943100764, '123456789', '女', '75434465291', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('邓航', 2414576989729, '123456789', '女', '33169371940', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('贾天磊', 1038515891250, '123456789', '男', '71407092730', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('尹果', 4779495281701, '123456789', '女', '81962105962', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('崔鸿涛', 0017880743871, '123456789', '女', '54426531943', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('许健柏', 4402748368719, '123456789', '男', '11406289405', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('梁远航', 7159506877880, '123456789', '男', '85860578870', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('金立诚', 4944281598442, '123456789', '男', '44900851494', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('黄煜祺', 2626588727771, '123456789', '女', '28154025407', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('戴煜祺', 7330179135905, '123456789', '男', '91074096321', 0, '未填写', 0);
insert into lms2.`user` (`user_name`, `user_id`, `password`, `gender`, `phone_number`, `borrow_number`, `email`,
                         `balance`)
values ('余展鹏', 7424864919009, '123456789', '男', '15679025159', 0, '未填写', 0);
-- 借书记录
create table if not exists lms2.`borrow_record`
(
    `user_id`     bigint   not null comment '用户id',
    `book_id`     bigint   not null comment '图书id',
    `borrow_time` datetime not null comment '借书时间',
    `return_time` bigint   not null comment '还书时间',
    primary key (user_id, book_id)
) comment '借书记录';
-- 评论
create table if not exists lms2.`comment`
(
    `content` varchar(256) default '无' not null comment '评论内容',
    `user_id` bigint not null comment '评论用户id',
    `user_name` varchar(256) default '无' not null comment '评论用户名',
    `avatar_pic` varchar(256) null comment '头像图片',
    `likes` bigint default 0 null comment '点赞数',
    `dislikes` bigint default 0 null comment '踩数',
    `book_id` bigint not null comment '书id',
    primary key (user_id,book_id)
) comment '评论';
-- 收藏夹
create table if not exists lms2.`favorites`
(
    `book_id` bigint not null comment '收藏书id',
    `user_id` bigint not null comment '收藏人id',
    `url` varchar(256) not null comment '收藏url',
    primary key (book_id,user_id)
) comment '收藏夹';
# ************************************后台管理系统***********************************************
create database if not exists lms2_admin;
-- 菜单
CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT,
                            `parent_id` bigint COMMENT '父菜单ID，一级菜单为0',
                            `name` varchar(50) COMMENT '菜单名称',
                            `url` varchar(200) COMMENT '菜单URL',
                            `perms` varchar(500) COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
                            `type` int COMMENT '类型   0：目录   1：菜单   2：按钮',
                            `icon` varchar(50) COMMENT '菜单图标',
                            `order_num` int COMMENT '排序',
                            PRIMARY KEY (`menu_id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='菜单管理';

-- 系统用户
CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT,
                            `username` varchar(50) NOT NULL COMMENT '用户名',
                            `password` varchar(100) COMMENT '密码',
                            `salt` varchar(20) COMMENT '盐',
                            `email` varchar(100) COMMENT '邮箱',
                            `mobile` varchar(100) COMMENT '手机号',
                            `status` tinyint COMMENT '状态  0：禁用   1：正常',
                            `create_user_id` bigint(20) COMMENT '创建者ID',
                            `create_time` datetime COMMENT '创建时间',
                            PRIMARY KEY (`user_id`),
                            UNIQUE INDEX (`username`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='系统用户';

-- 系统用户Token
CREATE TABLE `sys_user_token` (
                                  `user_id` bigint(20) NOT NULL,
                                  `token` varchar(100) NOT NULL COMMENT 'token',
                                  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
                                  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`user_id`),
                                  UNIQUE KEY `token` (`token`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='系统用户Token';

-- 系统验证码
CREATE TABLE `sys_captcha` (
                               `uuid` char(36) NOT NULL COMMENT 'uuid',
                               `code` varchar(6) NOT NULL COMMENT '验证码',
                               `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
                               PRIMARY KEY (`uuid`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='系统验证码';

-- 角色
CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT,
                            `role_name` varchar(100) COMMENT '角色名称',
                            `remark` varchar(100) COMMENT '备注',
                            `create_user_id` bigint(20) COMMENT '创建者ID',
                            `create_time` datetime COMMENT '创建时间',
                            PRIMARY KEY (`role_id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='角色';

-- 用户与角色对应关系
CREATE TABLE `sys_user_role` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `user_id` bigint COMMENT '用户ID',
                                 `role_id` bigint COMMENT '角色ID',
                                 PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='用户与角色对应关系';

-- 角色与菜单对应关系
CREATE TABLE `sys_role_menu` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `role_id` bigint COMMENT '角色ID',
                                 `menu_id` bigint COMMENT '菜单ID',
                                 PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='角色与菜单对应关系';

-- 系统配置信息
CREATE TABLE `sys_config` (
                              `id` bigint NOT NULL AUTO_INCREMENT,
                              `param_key` varchar(50) COMMENT 'key',
                              `param_value` varchar(2000) COMMENT 'value',
                              `status` tinyint DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
                              `remark` varchar(500) COMMENT '备注',
                              PRIMARY KEY (`id`),
                              UNIQUE INDEX (`param_key`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='系统配置信息表';


-- 系统日志
CREATE TABLE `sys_log` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT,
                           `username` varchar(50) COMMENT '用户名',
                           `operation` varchar(50) COMMENT '用户操作',
                           `method` varchar(200) COMMENT '请求方法',
                           `params` varchar(5000) COMMENT '请求参数',
                           `time` bigint NOT NULL COMMENT '执行时长(毫秒)',
                           `ip` varchar(64) COMMENT 'IP地址',
                           `create_date` datetime COMMENT '创建时间',
                           PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='系统日志';


-- 文件上传
CREATE TABLE `sys_oss` (
                           `id` bigint(20) NOT NULL AUTO_INCREMENT,
                           `url` varchar(200) COMMENT 'URL地址',
                           `create_date` datetime COMMENT '创建时间',
                           PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='文件上传';


-- 定时任务
CREATE TABLE `schedule_job` (
                                `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
                                `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
                                `params` varchar(2000) DEFAULT NULL COMMENT '参数',
                                `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
                                `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
                                `remark` varchar(255) DEFAULT NULL COMMENT '备注',
                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                PRIMARY KEY (`job_id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='定时任务';

-- 定时任务日志
CREATE TABLE `schedule_job_log` (
                                    `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
                                    `job_id` bigint(20) NOT NULL COMMENT '任务id',
                                    `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
                                    `params` varchar(2000) DEFAULT NULL COMMENT '参数',
                                    `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
                                    `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
                                    `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    PRIMARY KEY (`log_id`),
                                    KEY `job_id` (`job_id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='定时任务日志';



-- 用户表
CREATE TABLE `tb_user` (
                           `user_id` bigint NOT NULL AUTO_INCREMENT,
                           `username` varchar(50) NOT NULL COMMENT '用户名',
                           `mobile` varchar(20) NOT NULL COMMENT '手机号',
                           `password` varchar(64) COMMENT '密码',
                           `create_time` datetime COMMENT '创建时间',
                           PRIMARY KEY (`user_id`),
                           UNIQUE INDEX (`username`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8mb4 COMMENT='用户';






-- 初始数据
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES ('1', 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', '1', '1', '2016-11-11 11:11:11');

INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (2, 1, '管理员列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (5, 1, 'SQL监控', 'http://localhost:8080/renren-fast/druid/sql.html', NULL, 1, 'sql', 4);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (6, 1, '定时任务', 'job/schedule', NULL, 1, 'job', 5);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (7, 6, '查看', NULL, 'sys:schedule:list,sys:schedule:info', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (8, 6, '新增', NULL, 'sys:schedule:save', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (9, 6, '修改', NULL, 'sys:schedule:update', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (10, 6, '删除', NULL, 'sys:schedule:delete', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (11, 6, '暂停', NULL, 'sys:schedule:pause', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (12, 6, '恢复', NULL, 'sys:schedule:resume', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (13, 6, '立即执行', NULL, 'sys:schedule:run', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (14, 6, '日志列表', NULL, 'sys:schedule:log', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (27, 1, '参数管理', 'sys/config', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'config', 6);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu`(`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (30, 1, '文件上传', 'oss/oss', 'sys:oss:all', 1, 'oss', 6);

INSERT INTO `sys_config` (`param_key`, `param_value`, `status`, `remark`) VALUES ('CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', '0', '云存储配置信息');
INSERT INTO `schedule_job` (`bean_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES ('testTask', 'renren', '0 0/30 * * * ?', '0', '参数测试', now());


-- 账号：13612345678  密码：admin
INSERT INTO `tb_user` (`username`, `mobile`, `password`, `create_time`) VALUES ('mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');








--  quartz自带表结构
CREATE TABLE QRTZ_JOB_DETAILS(
                                 SCHED_NAME VARCHAR(120) NOT NULL,
                                 JOB_NAME VARCHAR(200) NOT NULL,
                                 JOB_GROUP VARCHAR(200) NOT NULL,
                                 DESCRIPTION VARCHAR(250) NULL,
                                 JOB_CLASS_NAME VARCHAR(250) NOT NULL,
                                 IS_DURABLE VARCHAR(1) NOT NULL,
                                 IS_NONCONCURRENT VARCHAR(1) NOT NULL,
                                 IS_UPDATE_DATA VARCHAR(1) NOT NULL,
                                 REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
                                 JOB_DATA BLOB NULL,
                                 PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_TRIGGERS (
                               SCHED_NAME VARCHAR(120) NOT NULL,
                               TRIGGER_NAME VARCHAR(200) NOT NULL,
                               TRIGGER_GROUP VARCHAR(200) NOT NULL,
                               JOB_NAME VARCHAR(200) NOT NULL,
                               JOB_GROUP VARCHAR(200) NOT NULL,
                               DESCRIPTION VARCHAR(250) NULL,
                               NEXT_FIRE_TIME BIGINT(13) NULL,
                               PREV_FIRE_TIME BIGINT(13) NULL,
                               PRIORITY INTEGER NULL,
                               TRIGGER_STATE VARCHAR(16) NOT NULL,
                               TRIGGER_TYPE VARCHAR(8) NOT NULL,
                               START_TIME BIGINT(13) NOT NULL,
                               END_TIME BIGINT(13) NULL,
                               CALENDAR_NAME VARCHAR(200) NULL,
                               MISFIRE_INSTR SMALLINT(2) NULL,
                               JOB_DATA BLOB NULL,
                               PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                               FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
                                   REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
                                      SCHED_NAME VARCHAR(120) NOT NULL,
                                      TRIGGER_NAME VARCHAR(200) NOT NULL,
                                      TRIGGER_GROUP VARCHAR(200) NOT NULL,
                                      REPEAT_COUNT BIGINT(7) NOT NULL,
                                      REPEAT_INTERVAL BIGINT(12) NOT NULL,
                                      TIMES_TRIGGERED BIGINT(10) NOT NULL,
                                      PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                      FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
                                          REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_CRON_TRIGGERS (
                                    SCHED_NAME VARCHAR(120) NOT NULL,
                                    TRIGGER_NAME VARCHAR(200) NOT NULL,
                                    TRIGGER_GROUP VARCHAR(200) NOT NULL,
                                    CRON_EXPRESSION VARCHAR(120) NOT NULL,
                                    TIME_ZONE_ID VARCHAR(80),
                                    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
                                        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
(
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
                                    SCHED_NAME VARCHAR(120) NOT NULL,
                                    TRIGGER_NAME VARCHAR(200) NOT NULL,
                                    TRIGGER_GROUP VARCHAR(200) NOT NULL,
                                    BLOB_DATA BLOB NULL,
                                    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
                                    INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
                                    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
                                        REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_CALENDARS (
                                SCHED_NAME VARCHAR(120) NOT NULL,
                                CALENDAR_NAME VARCHAR(200) NOT NULL,
                                CALENDAR BLOB NOT NULL,
                                PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
                                          SCHED_NAME VARCHAR(120) NOT NULL,
                                          TRIGGER_GROUP VARCHAR(200) NOT NULL,
                                          PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
                                     SCHED_NAME VARCHAR(120) NOT NULL,
                                     ENTRY_ID VARCHAR(95) NOT NULL,
                                     TRIGGER_NAME VARCHAR(200) NOT NULL,
                                     TRIGGER_GROUP VARCHAR(200) NOT NULL,
                                     INSTANCE_NAME VARCHAR(200) NOT NULL,
                                     FIRED_TIME BIGINT(13) NOT NULL,
                                     SCHED_TIME BIGINT(13) NOT NULL,
                                     PRIORITY INTEGER NOT NULL,
                                     STATE VARCHAR(16) NOT NULL,
                                     JOB_NAME VARCHAR(200) NULL,
                                     JOB_GROUP VARCHAR(200) NULL,
                                     IS_NONCONCURRENT VARCHAR(1) NULL,
                                     REQUESTS_RECOVERY VARCHAR(1) NULL,
                                     PRIMARY KEY (SCHED_NAME,ENTRY_ID))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_SCHEDULER_STATE (
                                      SCHED_NAME VARCHAR(120) NOT NULL,
                                      INSTANCE_NAME VARCHAR(200) NOT NULL,
                                      LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
                                      CHECKIN_INTERVAL BIGINT(13) NOT NULL,
                                      PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE QRTZ_LOCKS (
                            SCHED_NAME VARCHAR(120) NOT NULL,
                            LOCK_NAME VARCHAR(40) NOT NULL,
                            PRIMARY KEY (SCHED_NAME,LOCK_NAME))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY ON QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_J_GRP ON QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP);

CREATE INDEX IDX_QRTZ_T_J ON QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_JG ON QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_C ON QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
CREATE INDEX IDX_QRTZ_T_G ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_T_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_G_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME ON QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_FT_J_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_JG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_T_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_FT_TG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);

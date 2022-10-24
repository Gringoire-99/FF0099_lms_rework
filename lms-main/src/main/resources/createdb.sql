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
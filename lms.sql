create database if not exists lms2;
create table if not exists lms2.admin
(
    admin_name   varchar(256)                     not null comment '管理员名',
    admin_id     varchar(256)                     not null comment 'id'
        primary key,
    phone_number varchar(256) default '无'        not null comment '电话',
    avatar_pic   varchar(256)                     null comment '头像图片',
    password     varchar(256) default '123456789' null
)
    comment '管理员列表';

create table if not exists lms2.book
(
    book_id        varchar(256)                               not null comment '书号'
        primary key,
    is_deleted     tinyint      default 0                     not null comment '是否删除(0-未删, 1-已删)',
    author         varchar(256) default '未知'                null comment '作者',
    number         bigint       default 0                     not null comment '库存数量',
    reading_number bigint       default 0                     null comment '正在阅读数',
    press          varchar(256) default '未知'                null comment '出版社',
    book_name      varchar(256)                               not null comment '书名',
    press_time     datetime     default '2022-10-17 12:35:16' null comment '印刷时间',
    stars          bigint       default 0                     null comment '收藏',
    likes          bigint       default 0                     null comment '点赞数',
    price          decimal      default 0                     not null comment '价格',
    summary        varchar(256) default '无'                  null comment '摘要',
    cover_pic      varchar(256) default '无封面'              null comment '图片的url地址',
    check (`price` > 0),
    check (`reading_number` >= 0),
    check ((`is_deleted` = 0) or (`is_deleted` = 1)),
    constraint 检查_name
        check (`number` >= 0)
)
    comment '图书表';

create table if not exists lms2.user
(
    user_name     varchar(256)                                                                                                      not null comment '用户名',
    user_id       varchar(256)                                                                                                      not null comment '用户id'
        primary key,
    password      varchar(256) default '123456789'                                                                                  not null comment '密码',
    gender        varchar(256) default '未知'                                                                                       null comment '用户性别',
    phone_number  varchar(256)                                                                                                      not null comment '手机号',
    borrow_number tinyint      default 0                                                                                            null comment '借阅数',
    email         varchar(256) default '未填写'                                                                                     null comment '邮箱',
    avatar_pic    varchar(256) default 'https://ff0069-lms.oss-cn-hangzhou.aliyuncs.com/UserAvatars/default/%E7%94%A8%E6%88%B7.svg' null comment '头像',
    balance       decimal      default 0                                                                                            null comment '余额',
    remark        varchar(256) default '备注信息'                                                                                   null comment '备注',
    birthdate     datetime                                                                                                          null comment '出生日期',
    constraint phone_number
        unique (phone_number)
)
    comment '用户';

create table if not exists lms2.borrow_record
(
    user_id     varchar(256) not null comment '用户id',
    book_id     varchar(256) not null comment '图书id',
    borrow_time datetime     not null comment '借书时间',
    return_time datetime     not null comment '还书时间',
    primary key (user_id, book_id),
    constraint borrow_record_book_null_fk
        foreign key (book_id) references lms2.book (book_id),
    constraint borrow_record_user_null_fk
        foreign key (user_id) references lms2.user (user_id),
    check (`return_time` > `borrow_time`)
)
    comment '借书记录';

create table if not exists lms2.comment
(
    content  varchar(256) default '无' not null comment '评论内容',
    user_id  varchar(256)              not null comment '评论用户id',
    likes    bigint       default 0    null comment '点赞数',
    dislikes bigint       default 0    null comment '踩数',
    book_id  varchar(256)              not null comment '书id',
    primary key (user_id, book_id),
    constraint comment_book_null_fk
        foreign key (book_id) references lms2.book (book_id),
    constraint comment_user_null_fk
        foreign key (user_id) references lms2.user (user_id)
)
    comment '评论';

create table if not exists lms2.favorites
(
    book_id varchar(256) not null comment '收藏书id',
    user_id varchar(256) not null comment '收藏人id',
    url     varchar(256) not null comment '收藏url',
    primary key (book_id, user_id),
    constraint favorites_book_null_fk
        foreign key (book_id) references lms2.book (book_id),
    constraint favorites_user_null_fk
        foreign key (user_id) references lms2.user (user_id)
)
    comment '收藏夹';



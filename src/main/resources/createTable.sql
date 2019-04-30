drop table if exists account_msg;

drop table if exists act_management;

drop table if exists card_management;

drop table if exists prize_management;

/*==============================================================*/
/* Table: account_msg                                           */
/*==============================================================*/
create table account_msg
(
   userName             varchar(20) not null,
   password             varchar(20),
   id                   bigint,
   app_key              varchar(50),
   primary key (userName)
);

/*==============================================================*/
/* Table: act_management                                        */
/*==============================================================*/
create table act_management
(
   act_name             varchar(20),
   act_type             varchar(20),
   act_id               int not null,
   act_time             datetime,
   status               int comment '活动状态包含：未开始、未发布、进行中、已结束
            ?未开始(0)：点击了发布，但是活动时间还未到的活动
            ?未发布(1)：新添加保存下来的活动默认为未发布状态
            ?进行中(2)：在活动时间内正常进行
            已结束(3)：到活动结束时间活动会自动结束；在活动时间内手动结束活动',
   city                 varchar(20),
   visitor_NUM          int,
   participant_NUM      int,
   creator              varchar(20),
   added_time           datetime,
   primary key (act_id)
);

/*==============================================================*/
/* Table: card_management                                       */
/*==============================================================*/
create table card_management
(
   shop_ID              varchar(50) not null,
   card_name            varchar(50) not null,
   card_picture         longblob,
   most_amount          int comment '显示用户在活动期间最多可获得数量，如果填写的为0，显示为不限',
   status               int comment '启用状态的卡片才能生效，启用状态的普通卡、万能卡和霸王餐卡才能在集龙珠页面展示。
            已发布的活动，如果某一张卡片已经被领取，无法再关闭，点击则toast提示：该卡片已被用户领取，无法关闭',
   sort_value           int,
   added_time           datetime,
   primary key (card_name)
);

/*==============================================================*/
/* Table: prize_management                                      */
/*==============================================================*/
create table prize_management
(
   shop_name            varchar(50),
   shop_ID              varchar(50) not null,
   city                 varchar(20),
   act_name             varchar(50),
   act_id               int not null,
   act_status           int,
   act_time             datetime,
   coupon_name          varchar(50),
   coupon_usage_time    datetime,
   coupon_remaining     int,
   coupon_deliveries    int,
   coupon_nuclear_sales int,
   coupon_receiving_amount int comment '领取量即在集龙珠中用户兑换霸王餐，兑换此卡券的数量',
   added_time           datetime,
   channel_status       int comment '即此活动在集龙珠霸王餐列表的上下线状态，包含：上线中、已下线
            上线中：添加/导入进来的奖品默认为上线中状态，用1表示
            已下线：手动将上线中的奖品下线，用-1表示',
   primary key (shop_ID)
);

alter table card_management add constraint FK_Reference_2 foreign key (shop_ID)
      references prize_management (shop_ID) on delete restrict on update restrict;

alter table prize_management add constraint FK_Reference_1 foreign key (act_id)
      references act_management (act_id) on delete restrict on update restrict;

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
   status               int comment '�״̬������δ��ʼ��δ�����������С��ѽ���
            ?δ��ʼ(0)������˷��������ǻʱ�仹δ���Ļ
            ?δ����(1)������ӱ��������ĻĬ��Ϊδ����״̬
            ?������(2)���ڻʱ������������
            �ѽ���(3)���������ʱ�����Զ��������ڻʱ�����ֶ������',
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
   most_amount          int comment '��ʾ�û��ڻ�ڼ����ɻ�������������д��Ϊ0����ʾΪ����',
   status               int comment '����״̬�Ŀ�Ƭ������Ч������״̬����ͨ�������ܿ��Ͱ����Ϳ������ڼ�����ҳ��չʾ��
            �ѷ����Ļ�����ĳһ�ſ�Ƭ�Ѿ�����ȡ���޷��ٹرգ������toast��ʾ���ÿ�Ƭ�ѱ��û���ȡ���޷��ر�',
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
   coupon_receiving_amount int comment '��ȡ�����ڼ��������û��һ������ͣ��һ��˿�ȯ������',
   added_time           datetime,
   channel_status       int comment '���˻�ڼ�����������б��������״̬�������������С�������
            �����У����/��������Ľ�ƷĬ��Ϊ������״̬����1��ʾ
            �����ߣ��ֶ��������еĽ�Ʒ���ߣ���-1��ʾ',
   primary key (shop_ID)
);

alter table card_management add constraint FK_Reference_2 foreign key (shop_ID)
      references prize_management (shop_ID) on delete restrict on update restrict;

alter table prize_management add constraint FK_Reference_1 foreign key (act_id)
      references act_management (act_id) on delete restrict on update restrict;

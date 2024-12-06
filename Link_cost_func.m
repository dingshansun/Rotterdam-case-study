function link_cost = Link_cost_func(x_link, L_link, speed, weight, freq)
%% Network layout
l_12=L_link(1);
l_14=L_link(2);
l_16=L_link(3);
l_23=L_link(4);
l_24=L_link(5);
l_25=L_link(6);
l_35=L_link(7);
l_45=L_link(8);
l_46=L_link(9);
l_47=L_link(10);
l_57=L_link(11);
l_58=L_link(12);
l_67=L_link(13);
l_69=L_link(14);
l_78=L_link(15);
l_810=L_link(16);
l_811=L_link(17);
l_910=L_link(18);
l_1011=L_link(19);
l_710=L_link(20);
%% Parameters
bus_freq=freq(1);  %
tram_freq=freq(2);  %
metro_freq=freq(3);  %
train_freq=freq(4);

v_car=speed(1);
v_tram=speed(2);
v_metro=speed(3);
v_bus=speed(4); % this one needs to be reconsidered; bus share the same link with car, but with stops; it is considered to be fixed also
v_train=speed(5);

c_fuel=weight(1);
c_park_low=weight(2);
c_park_high=weight(3);
bus_weight=weight(4);
bus_fare=weight(5);
tram_fare=weight(6);
metro_fare=weight(7);
train_fare=weight(8);
bus_base=weight(9);
tram_base=weight(10);
metro_base=weight(11);
train_base=weight(12);

time_weight=weight(13); % 1000
money_weight=weight(14); % 10

parkingTime=8; % parking time, considering single trip
%% Mode Link flows
% Road/car link flows
x_c_12=x_link(1);
x_c_21=x_link(2);
x_c_23=x_link(3);
x_c_32=x_link(4);
x_c_14=x_link(5);
x_c_24=x_link(6);
x_c_25=x_link(7);
x_c_35=x_link(8);
x_c_16=x_link(9);
x_c_45=x_link(10);
x_c_54=x_link(11);
x_c_46=x_link(12);
x_c_64=x_link(13);
x_c_47=x_link(14);
x_c_57=x_link(15);
x_c_75=x_link(16);
x_c_58=x_link(17);
x_c_85=x_link(18);
x_c_67=x_link(19);
x_c_76=x_link(20);
x_c_78=x_link(21);
x_c_87=x_link(22);
x_c_69=x_link(23);
x_c_710=x_link(24);
x_c_107=x_link(25);
x_c_810=x_link(26);
x_c_108=x_link(27);
x_c_118=x_link(28);
x_c_109=x_link(29);
x_c_1110=x_link(30);

% Bus link flows
x_b_12=x_link(31);
x_b_21=x_link(32);
x_b_23=x_link(33);
x_b_32=x_link(34);
x_b_14=x_link(35);
x_b_24=x_link(36);
x_b_25=x_link(37);
x_b_35=x_link(38);
x_b_16=x_link(39);
x_b_45=x_link(40);
x_b_54=x_link(41);
x_b_46=x_link(42);
x_b_64=x_link(43);
x_b_47=x_link(44);
x_b_57=x_link(45);
x_b_75=x_link(46);
x_b_58=x_link(47);
x_b_85=x_link(48);
x_b_67=x_link(49);
x_b_76=x_link(50);
x_b_78=x_link(51);
x_b_87=x_link(52);
x_b_69=x_link(53);
x_b_710=x_link(54);
x_b_107=x_link(55);
x_b_810=x_link(56);
x_b_108=x_link(57);
x_b_118=x_link(58);
x_b_109=x_link(59);
x_b_1110=x_link(60);

% Tram link flows
x_t_24=x_link(61);
x_t_45=x_link(62);
x_t_54=x_link(63);
x_t_47=x_link(64);
x_t_57=x_link(65);
x_t_75=x_link(66);
x_t_67=x_link(67);
x_t_76=x_link(68);
x_t_78=x_link(69);
x_t_87=x_link(70);
x_t_810=x_link(71);
x_t_108=x_link(72);
x_t_118=x_link(73);

% Metro link flows
x_m_14=x_link(74);
x_m_24=x_link(75);
x_m_35=x_link(76);
x_m_47=x_link(77);
x_m_57=x_link(78);
x_m_75=x_link(79);
x_m_67=x_link(80);
x_m_76=x_link(81);
x_m_78=x_link(82);
x_m_87=x_link(83);
x_m_810=x_link(84);
x_m_108=x_link(85);

% Train link flows
x_r_34=x_link(86);
x_r_47=x_link(87);
x_r_74=x_link(88);
x_r_67=x_link(89);
x_r_76=x_link(90);
x_r_78=x_link(91);
x_r_87=x_link(92);
x_r_118=x_link(93);

% Transfer links
% Transfer from car to bus
x_cb_1=x_link(94);
x_cb_2=x_link(95);
x_cb_3=x_link(96);
x_cb_4=x_link(97);
x_cb_5=x_link(98);
x_cb_6=x_link(99);
% cb_7=x_link(100);
x_cb_8=x_link(100);
x_cb_9=x_link(101);
x_cb_10=x_link(102);
x_cb_11=x_link(103);
% Transfer from car to tram
x_ct_2=x_link(104);
x_ct_4=x_link(105);
x_ct_5=x_link(106);
x_ct_6=x_link(107);
% ct_7=x_link(109);
x_ct_8=x_link(108);
x_ct_10=x_link(109);
x_ct_11=x_link(110);
% transfer from car to metro
x_cm_1=x_link(111);
x_cm_2=x_link(112);
x_cm_3=x_link(113);
x_cm_4=x_link(114);
x_cm_5=x_link(115);
x_cm_6=x_link(116);
% cm_7=x_link(119);
x_cm_8=x_link(117);
x_cm_10=x_link(118);
% transfer from car to rail
x_cr_3=x_link(119);
x_cr_4=x_link(120);
x_cr_6=x_link(121);
% cr_7=x_link(122);
x_cr_8=x_link(122);
x_cr_11=x_link(123);
% transfer from bus to tram
x_bt_2=x_link(124);
x_bt_4=x_link(125);
x_bt_5=x_link(126);
x_bt_6=x_link(127);
x_bt_7=x_link(128);
x_bt_8=x_link(129);
x_bt_10=x_link(130);
x_bt_11=x_link(131);
% transfer from bus to metro
x_bm_1=x_link(132);
x_bm_2=x_link(133);
x_bm_3=x_link(134);
x_bm_4=x_link(135);
x_bm_5=x_link(136);
x_bm_6=x_link(137);
x_bm_7=x_link(138);
x_bm_8=x_link(139);
x_bm_10=x_link(140);
% transfer from bus to rail
x_br_3=x_link(141);
x_br_4=x_link(142);
x_br_6=x_link(143);
x_br_7=x_link(144);
x_br_8=x_link(145);
x_br_11=x_link(146);
% transfer from tram to bus
x_tb_2=x_link(147);
x_tb_4=x_link(148);
x_tb_5=x_link(149);
x_tb_6=x_link(150);
x_tb_7=x_link(151);
x_tb_8=x_link(152);
x_tb_10=x_link(153);
x_tb_11=x_link(154);
% transfer from tram to metro
x_tm_2=x_link(155);
x_tm_4=x_link(156);
x_tm_5=x_link(157);
x_tm_6=x_link(158);
x_tm_7=x_link(159);
x_tm_8=x_link(160);
x_tm_10=x_link(161);
% transfer from tram to rail
x_tr_4=x_link(162);
x_tr_6=x_link(163);
x_tr_7=x_link(164);
x_tr_8=x_link(165);
x_tr_11=x_link(166);
% transfer from metro to bus
x_mb_1=x_link(167);
x_mb_2=x_link(168);
x_mb_3=x_link(169);
x_mb_4=x_link(170);
x_mb_5=x_link(171);
x_mb_6=x_link(172);
x_mb_7=x_link(173);
x_mb_8=x_link(174);
x_mb_10=x_link(175);
% transfer from metro tram
x_mt_2=x_link(176);
x_mt_4=x_link(177);
x_mt_5=x_link(178);
x_mt_6=x_link(179);
x_mt_7=x_link(180);
x_mt_8=x_link(181);
x_mt_10=x_link(182);
% transfer from metro to rail
x_mr_3=x_link(183);
x_mr_4=x_link(184);
x_mr_6=x_link(185);
x_mr_7=x_link(186);
x_mr_8=x_link(187);
% transfer from rail to bus
x_rb_3=x_link(188);
x_rb_4=x_link(189);
x_rb_6=x_link(190);
x_rb_7=x_link(191);
x_rb_8=x_link(192);
x_rb_11=x_link(193);
% transfer from rail to tram
x_rt_4=x_link(194);
x_rt_6=x_link(195);
x_rt_7=x_link(196);
x_rt_8=x_link(197);
x_rt_11=x_link(198);
% transfer from rail to metro
x_rm_3=x_link(199);
x_rm_4=x_link(200);
x_rm_6=x_link(201);
x_rm_7=x_link(202);
x_rm_8=x_link(203);
% transfer from origins to nodes
x_O1c1=x_link(204);
x_O1b1=x_link(205);
x_O1m1=x_link(206);
x_O2c2=x_link(207);
x_O2b2=x_link(208);
x_O2t2=x_link(209);
x_O2m2=x_link(210);
x_O3c3=x_link(211);
x_O3b3=x_link(212);
x_O3m3=x_link(213);
x_O3r3=x_link(214);
x_O4c10=x_link(215);
x_O4b10=x_link(216);
x_O4t10=x_link(217);
x_O4m10=x_link(218);
x_O5c11=x_link(219);
x_O5b11=x_link(220);
x_O5t11=x_link(221);
x_O5r11=x_link(222);
% transfer from nodes to destinations
x_b7D1=x_link(223);
x_t7D1=x_link(224);
x_m7D1=x_link(225);
x_r7D1=x_link(226);
x_c9D2=x_link(227);
x_b9D2=x_link(228);

%% Travel cost calculation for in-vehicle links
% Car link cost; assumed that bus does not interact with car flow, for
% simplicity
car_flow=x_link(1:30);
car_link_length=[l_12, l_12, l_23, l_23, l_14, l_24, l_25, l_35, l_16, l_45, l_45, l_46, l_46, l_47, l_57, l_57, l_58, l_58, ...
    l_67, l_67, l_78, l_78, l_69, l_710, l_710, l_810, l_810, l_811, l_910, l_1011];
t_car = zeros(1, numel(car_flow)); % Travel times
m_car = zeros(1, numel(car_flow)); % Metrics
for i=1:numel(car_flow)
    [t_car(i), m_car(i)]=car_link(car_link_length(i), car_flow(i), [v_car,c_fuel]);
end

% Bus link cost; assumed to have constant speed
bus_flow=x_link(31:60);
bus_link_length=car_link_length;
t_bus = zeros(1, numel(bus_flow)); % Travel times
m_bus = zeros(1, numel(bus_flow)); % Metrics
for i=1:numel(bus_flow)
    [t_bus(i), m_bus(i)]=bus_link(bus_link_length(i), v_bus, bus_fare);
end

% Tram link cost; assumed to have constant speed
tram_flow=x_link(61:73);
tram_link_length=[l_24, l_45, l_45, l_47, l_57, l_57, l_67, l_67, l_78, l_78, l_810, l_810, l_811];
t_tram = zeros(1, numel(tram_flow));
m_tram = zeros(1, numel(tram_flow));
for i=1:numel(tram_flow)
    [t_tram(i), m_tram(i)]=tram_link(tram_link_length(i), v_tram, tram_fare);
end

% Metro link cost
metro_flow=x_link(74:85);
metro_link_length=[l_14, l_24, l_35, l_47, l_57, l_57, l_67, l_67, l_78, l_78, l_810, l_810];
t_metro = zeros(1, numel(metro_flow));
m_metro = zeros(1, numel(metro_flow));
for i=1:numel(metro_flow)
    [t_metro(i), m_metro(i)]=metro_link(metro_link_length(i), v_metro, metro_fare);
end

% Rail link cost
rail_flow=x_link(86:93);
rail_link_length=[l_34, l_47, l_47, l_67, l_67, l_78, l_78, l_811];
t_rail = zeros(1, numel(rail_flow));
m_rail = zeros(1, numel(rail_flow));
for i=1:numel(rail_flow)
    [t_rail(i), m_rail(i)]=rail_link(rail_link_length(i), v_train, train_fare);
end

%% Travel cost for transfer links
park_1_flow=x_cb_1+x_cm_1;
park_2_flow=x_cb_2+x_ct_2+x_cm_2;
park_3_flow=x_cb_3+x_cm_3+x_cr_3;
park_4_flow=x_cb_4+x_ct_4+x_cm_4+x_cr_4;
park_5_flow=x_cb_5+x_ct_5+x_cm_5;
park_6_flow=x_cb_6+x_ct_6+x_cm_6+x_cr_6;
park_8_flow=x_cb_8+x_ct_8+x_cm_8+x_cr_8;
park_9_flow=x_cb_9;
park_10_flow=x_cb_10+x_ct_10+x_cm_10;
park_11_flow=x_cb_11+x_ct_11+x_cr_11;
% park_node_flow=[park_1_flow park_2_flow park_3_flow park_4_flow park_5_flow park_6_flow park_8_flow park_9_flow park_10_flow park_11_flow]';

% free parking time; depends on the skill?
park_time_1=0.02;park_time_2=0.02;park_time_3=0.02;park_time_4=0.02;park_time_5=0.02;
park_time_6=0.02;park_time_8=0.02;park_time_9=0.02;park_time_10=0.02;park_time_11=0.02;
% park_node_time=[park_time_1 park_time_2 park_time_3 park_time_4 park_time_5 park_time_6 park_time_8 park_time_9 park_time_10 park_time_11]';
% parking cost
park_fee_1=c_park_low;park_fee_2=c_park_low;park_fee_3=c_park_low;park_fee_4=c_park_low;park_fee_5=c_park_low;
park_fee_6=c_park_low;park_fee_8=c_park_low;park_fee_9=c_park_low;park_fee_10=c_park_low;park_fee_11=c_park_low;
% park_node_fee=[park_fee_1 park_fee_2 park_fee_3 park_fee_4 park_fee_5 park_fee_6 park_fee_8 park_fee_9 park_fee_10 park_fee_11]';

t_car_bus=0.1; % transfer time from car to bus; unit: hour
t_car_tram=0.1;
t_car_metro=0.12;
t_car_rail=0.12;
t_bus_tram=0.02;
t_bus_metro=0.06;
t_bus_rail=0.06;
t_tram_metro=0.06;
t_tram_rail=0.06;
t_metro_rail=0.08;


% the flow that influence the bus waiting time, including all the flows
% entering the bus node
bus_1_flow=x_cb_1+x_mb_1+x_b_21+x_O1b1; % maybe the flow on the previous bus link impacts more; here all the flows are equivilent
bus_2_flow=x_O2b2+x_b_12+x_b_32+x_cb_2+x_tb_2+x_mb_2;
bus_3_flow=x_O3b3+x_b_23+x_cb_3+x_mb_3+x_rb_3;
bus_4_flow=x_b_14+x_b_24+x_b_54+x_b_64+x_cb_4+x_tb_4+x_mb_4+x_rb_4;
bus_5_flow=x_b_25+x_b_35+x_b_45+x_b_75+x_b_85+x_cb_5+x_tb_5+x_mb_5;
bus_6_flow=x_b_16+x_b_46+x_b_76+x_cb_6+x_tb_6+x_mb_6+x_rb_6;
bus_7_flow=x_b_47+x_b_57+x_b_67+x_b_87+x_b_107+x_tb_7+x_mb_7+x_rb_7;
bus_8_flow=x_b_58+x_b_78+x_b_108+x_b_118+x_cb_8+x_tb_8+x_mb_8+x_rb_8;
bus_9_flow=x_b_69+x_b_109+x_cb_9;
bus_10_flow=x_O4b10+x_b_710+x_b_810+x_b_1110+x_cb_10+x_tb_10+x_mb_10;
bus_11_flow=x_O5b11+x_cb_11+x_tb_11+x_rb_11;
% bus_node_flow=[bus_1_flow bus_2_flow bus_3_flow bus_4_flow bus_5_flow bus_6_flow bus_7_flow bus_8_flow bus_9_flow bus_10_flow bus_11_flow]';
% bus_node_flow_car=[bus_1_flow bus_2_flow bus_3_flow bus_4_flow bus_5_flow bus_6_flow bus_8_flow bus_9_flow bus_10_flow bus_11_flow]';
% bus_node_flow_tram=[bus_2_flow bus_4_flow bus_5_flow bus_6_flow bus_7_flow bus_8_flow bus_10_flow bus_11_flow]';
% bus_node_flow_metro=[bus_1_flow bus_2_flow bus_3_flow bus_4_flow bus_5_flow bus_6_flow bus_7_flow bus_8_flow bus_10_flow]';
% bus_node_flow_rail=[bus_3_flow bus_4_flow bus_6_flow bus_7_flow bus_8_flow bus_11_flow]';
% flow that influences tram waiting time
tram_2_flow=x_O2t2+x_ct_2+x_bt_2+x_mt_2;
tram_4_flow=x_t_24+x_t_54+x_ct_4+x_bt_4+x_mt_4+x_rt_4;
tram_5_flow=x_t_45+x_t_75+x_ct_5+x_bt_5+x_mt_5;
tram_6_flow=x_t_76+x_ct_6+x_bt_6+x_mt_6+x_rt_6;
tram_7_flow=x_t_47+x_t_57+x_t_67+x_t_87+x_bt_7+x_mt_7+x_rt_7;
tram_8_flow=x_t_78+x_t_108+x_t_118+x_ct_8+x_bt_8+x_mt_8+x_rt_8;
tram_10_flow=x_O4t10+x_t_810+x_ct_10+x_bt_10+x_mt_10;
tram_11_flow=x_O5t11+x_ct_11+x_bt_11+x_rt_11;
% tram_node_flow=[tram_2_flow tram_4_flow tram_5_flow tram_6_flow tram_7_flow tram_8_flow tram_10_flow tram_11_flow]';
% flow that influences metro waiting time
metro_1_flow=x_O1m1+x_cm_1+x_bm_1;
metro_2_flow=x_O2m2+x_cm_2+x_bm_2+x_tm_2;
metro_3_flow=x_O3m3+x_cm_3+x_bm_3+x_rm_3;
metro_4_flow=x_m_14+x_m_24+x_cm_4+x_bm_4+x_tm_4+x_rm_4;
metro_5_flow=x_m_35+x_m_75+x_cm_5+x_bm_5+x_tm_5;
metro_6_flow=x_m_76+x_cm_6+x_bm_6+x_tm_6+x_rm_6;
metro_7_flow=x_m_47+x_m_57+x_m_67+x_m_87+x_bm_7+x_tm_7+x_rm_7;
metro_8_flow=x_m_78+x_m_108+x_cm_8+x_bm_8+x_tm_8+x_rm_8;
metro_10_flow=x_O4m10+x_m_810+x_cm_10+x_bm_10+x_tm_10;
% metro_node_flow=[metro_1_flow metro_2_flow metro_3_flow metro_4_flow metro_5_flow metro_6_flow metro_7_flow metro_8_flow metro_10_flow]';
% flow that influences rail waiting time
rail_3_flow=x_O3r3+x_cr_3+x_br_3+x_mr_3;
rail_4_flow=x_r_34+x_r_74+x_cr_4+x_br_4+x_tr_4+x_mr_4;
rail_6_flow=x_r_76+x_cr_6+x_br_6+x_tr_6+x_mr_6;
rail_7_flow=x_r_47+x_r_67+x_r_87+x_br_7+x_tr_7+x_mr_7;
rail_8_flow=x_r_78+x_r_118+x_cr_8+x_br_8+x_tr_8+x_mr_8;
rail_11_flow=x_O5r11+x_cr_11+x_br_11+x_tr_11;
% rail_node_flow=[rail_3_flow rail_4_flow rail_6_flow rail_7_flow rail_8_flow rail_11_flow]';

% transfer links cost from car to bus
t_cb_1=t_car_bus+t_wait_bus(bus_1_flow, 0.5*1/bus_freq)+t_findpark(park_1_flow, park_time_1);
m_cb_1=park_fee_1*parkingTime+bus_base;
t_cb_2=t_car_bus+t_wait_bus(bus_2_flow, 0.5*1/bus_freq)+t_findpark(park_2_flow, park_time_2);
m_cb_2=park_fee_2*parkingTime+bus_base;
t_cb_3=t_car_bus+t_wait_bus(bus_3_flow, 0.5*1/bus_freq)+t_findpark(park_3_flow, park_time_3);
m_cb_3=park_fee_3*parkingTime+bus_base;
t_cb_4=t_car_bus+t_wait_bus(bus_4_flow, 0.5*1/bus_freq)+t_findpark(park_4_flow, park_time_4);
m_cb_4=park_fee_4*parkingTime+bus_base;
t_cb_5=t_car_bus+t_wait_bus(bus_5_flow, 0.5*1/bus_freq)+t_findpark(park_5_flow, park_time_5);
m_cb_5=park_fee_5*parkingTime+bus_base;
t_cb_6=t_car_bus+t_wait_bus(bus_6_flow, 0.5*1/bus_freq)+t_findpark(park_6_flow, park_time_6);
m_cb_6=park_fee_6*parkingTime+bus_base;
t_cb_8=t_car_bus+t_wait_bus(bus_8_flow, 0.5*1/bus_freq)+t_findpark(park_8_flow, park_time_8);
m_cb_8=park_fee_8*parkingTime+bus_base;
t_cb_9=t_car_bus+t_wait_bus(bus_9_flow, 0.5*1/bus_freq)+t_findpark(park_9_flow, park_time_9);
m_cb_9=park_fee_9*parkingTime+bus_base;
t_cb_10=t_car_bus+t_wait_bus(bus_10_flow, 0.5*1/bus_freq)+t_findpark(park_10_flow, park_time_10);
m_cb_10=park_fee_10*parkingTime+bus_base;
t_cb_11=t_car_bus+t_wait_bus(bus_11_flow, 0.5*1/bus_freq)+t_findpark(park_11_flow, park_time_11);
m_cb_11=park_fee_11*parkingTime+bus_base;
t_cb=[t_cb_1, t_cb_2, t_cb_3, t_cb_4, t_cb_5, t_cb_6, t_cb_8, t_cb_9, t_cb_10, t_cb_11];
m_cb=[m_cb_1, m_cb_2, m_cb_3, m_cb_4, m_cb_5, m_cb_6, m_cb_8, m_cb_9, m_cb_10, m_cb_11];

% transfer links cost from tram to bus
t_tb_2=t_bus_tram+t_wait_bus(bus_2_flow, 0.5*1/bus_freq);
m_tb_2=bus_base;
t_tb_4=t_bus_tram+t_wait_bus(bus_4_flow, 0.5*1/bus_freq);
m_tb_4=bus_base;
t_tb_5=t_bus_tram+t_wait_bus(bus_5_flow, 0.5*1/bus_freq);
m_tb_5=bus_base;
t_tb_6=t_bus_tram+t_wait_bus(bus_6_flow, 0.5*1/bus_freq);
m_tb_6=bus_base;
t_tb_7=t_bus_tram+t_wait_bus(bus_7_flow, 0.5*1/bus_freq);
m_tb_7=bus_base;
t_tb_8=t_bus_tram+t_wait_bus(bus_8_flow, 0.5*1/bus_freq);
m_tb_8=bus_base;
t_tb_10=t_bus_tram+t_wait_bus(bus_10_flow, 0.5*1/bus_freq);
m_tb_10=bus_base;
t_tb_11=t_bus_tram+t_wait_bus(bus_11_flow, 0.5*1/bus_freq);
m_tb_11=bus_base;
t_tb=[t_tb_2, t_tb_4, t_tb_5, t_tb_6, t_tb_7, t_tb_8, t_tb_10, t_tb_11];
m_tb=[m_tb_2, m_tb_4, m_tb_5, m_tb_6, m_tb_7, m_tb_8, m_tb_10, m_tb_11];

% transfer links cost from metro to bus
t_mb_1=t_bus_metro+t_wait_bus(bus_1_flow, 0.5*1/bus_freq);
m_mb_1=bus_base;
t_mb_2=t_bus_metro+t_wait_bus(bus_2_flow, 0.5*1/bus_freq);
m_mb_2=bus_base;
t_mb_3=t_bus_metro+t_wait_bus(bus_3_flow, 0.5*1/bus_freq);
m_mb_3=bus_base;
t_mb_4=t_bus_metro+t_wait_bus(bus_4_flow, 0.5*1/bus_freq);
m_mb_4=bus_base;
t_mb_5=t_bus_metro+t_wait_bus(bus_5_flow, 0.5*1/bus_freq);
m_mb_5=bus_base;
t_mb_6=t_bus_metro+t_wait_bus(bus_6_flow, 0.5*1/bus_freq);
m_mb_6=bus_base;
t_mb_7=t_bus_metro+t_wait_bus(bus_7_flow, 0.5*1/bus_freq);
m_mb_7=bus_base;
t_mb_8=t_bus_metro+t_wait_bus(bus_8_flow, 0.5*1/bus_freq);
m_mb_8=bus_base;
t_mb_10=t_bus_metro+t_wait_bus(bus_10_flow, 0.5*1/bus_freq);
m_mb_10=bus_base;
t_mb=[t_mb_1, t_mb_2,t_mb_3,t_mb_4,t_mb_5,t_mb_6,t_mb_7,t_mb_8,t_mb_10];
m_mb=[m_mb_1,m_mb_2,m_mb_3,m_mb_4,m_mb_5,m_mb_6,m_mb_7,m_mb_8,m_mb_10];

% transfer links cost from rail to bus
t_rb_3=t_bus_rail+t_wait_bus(bus_3_flow, 0.5*1/bus_freq);
m_rb_3=bus_base;
t_rb_4=t_bus_rail+t_wait_bus(bus_4_flow, 0.5*1/bus_freq);
m_rb_4=bus_base;
t_rb_6=t_bus_rail+t_wait_bus(bus_6_flow, 0.5*1/bus_freq);
m_rb_6=bus_base;
t_rb_7=t_bus_rail+t_wait_bus(bus_7_flow, 0.5*1/bus_freq);
m_rb_7=bus_base;
t_rb_8=t_bus_rail+t_wait_bus(bus_8_flow, 0.5*1/bus_freq);
m_rb_8=bus_base;
t_rb_11=t_bus_rail+t_wait_bus(bus_11_flow, 0.5*1/bus_freq);
m_rb_11=bus_base;
t_rb=[t_rb_3,t_rb_4,t_rb_6,t_rb_7,t_rb_8,t_rb_11];
m_rb=[m_rb_3,m_rb_4,m_rb_6,m_rb_7,m_rb_8,m_rb_11];

% transfer link cost from car to tram
t_ct_2=t_car_tram+t_wait_tram(tram_2_flow, 0.5*1/tram_freq)+t_findpark(park_2_flow, park_time_2);
m_ct_2=park_fee_2*parkingTime+tram_base;
t_ct_4=t_car_tram+t_wait_tram(tram_4_flow, 0.5*1/tram_freq)+t_findpark(park_4_flow, park_time_4);
m_ct_4=park_fee_4*parkingTime+tram_base;
t_ct_5=t_car_tram+t_wait_tram(tram_5_flow, 0.5*1/tram_freq)+t_findpark(park_5_flow, park_time_5);
m_ct_5=park_fee_5*parkingTime+tram_base;
t_ct_6=t_car_tram+t_wait_tram(tram_6_flow, 0.5*1/tram_freq)+t_findpark(park_6_flow, park_time_6);
m_ct_6=park_fee_6*parkingTime+tram_base;
t_ct_8=t_car_tram+t_wait_tram(tram_8_flow, 0.5*1/tram_freq)+t_findpark(park_8_flow, park_time_8);
m_ct_8=park_fee_8*parkingTime+tram_base;
t_ct_10=t_car_tram+t_wait_tram(tram_10_flow, 0.5*1/tram_freq)+t_findpark(park_10_flow, park_time_10);
m_ct_10=park_fee_10*parkingTime+tram_base;
t_ct_11=t_car_tram+t_wait_tram(tram_11_flow, 0.5*1/tram_freq)+t_findpark(park_11_flow, park_time_11);
m_ct_11=park_fee_11*parkingTime+tram_base;
t_ct=[t_ct_2,t_ct_4,t_ct_5,t_ct_6,t_ct_8,t_ct_10,t_ct_11];
m_ct=[m_ct_2,m_ct_4,m_ct_5,m_ct_6,m_ct_8,m_ct_10,m_ct_11];

% transfer link cost from bus to tram
t_bt_2=t_bus_tram+t_wait_tram(tram_2_flow, 0.5*1/tram_freq);
m_bt_2=tram_base;
t_bt_4=t_bus_tram+t_wait_tram(tram_4_flow, 0.5*1/tram_freq);
m_bt_4=tram_base;
t_bt_5=t_bus_tram+t_wait_tram(tram_5_flow, 0.5*1/tram_freq);
m_bt_5=tram_base;
t_bt_6=t_bus_tram+t_wait_tram(tram_6_flow, 0.5*1/tram_freq);
m_bt_6=tram_base;
t_bt_7=t_bus_tram+t_wait_tram(tram_7_flow, 0.5*1/tram_freq);
m_bt_7=tram_base;
t_bt_8=t_bus_tram+t_wait_tram(tram_8_flow, 0.5*1/tram_freq);
m_bt_8=tram_base;
t_bt_10=t_bus_tram+t_wait_tram(tram_10_flow, 0.5*1/tram_freq);
m_bt_10=tram_base;
t_bt_11=t_bus_tram+t_wait_tram(tram_11_flow, 0.5*1/tram_freq);
m_bt_11=tram_base;
t_bt=[t_bt_2,t_bt_4,t_bt_5,t_bt_6,t_bt_7,t_bt_8,t_bt_10,t_bt_11];
m_bt=[m_bt_2,m_bt_4,m_bt_5,m_bt_6,m_bt_7,m_bt_8,m_bt_10,m_bt_11];

% transfer link cost from metro to tram
t_mt_2=t_tram_metro+t_wait_tram(tram_2_flow, 0.5*1/tram_freq);
m_mt_2=tram_base;
t_mt_4=t_tram_metro+t_wait_tram(tram_4_flow, 0.5*1/tram_freq);
m_mt_4=tram_base;
t_mt_5=t_tram_metro+t_wait_tram(tram_5_flow, 0.5*1/tram_freq);
m_mt_5=tram_base;
t_mt_6=t_tram_metro+t_wait_tram(tram_6_flow, 0.5*1/tram_freq);
m_mt_6=tram_base;
t_mt_7=t_tram_metro+t_wait_tram(tram_7_flow, 0.5*1/tram_freq);
m_mt_7=tram_base;
t_mt_8=t_tram_metro+t_wait_tram(tram_8_flow, 0.5*1/tram_freq);
m_mt_8=tram_base;
t_mt_10=t_tram_metro+t_wait_tram(tram_10_flow, 0.5*1/tram_freq);
m_mt_10=tram_base;
t_mt=[t_mt_2,t_mt_4,t_mt_5,t_mt_6,t_mt_7,t_mt_8,t_mt_10];
m_mt=[m_mt_2,m_mt_4,m_mt_5,m_mt_6,m_mt_7,m_mt_8,m_mt_10];

% transfer link cost from rail to tram
t_rt_4=t_tram_rail+t_wait_tram(tram_4_flow, 0.5*1/tram_freq);
m_rt_4=tram_base;
t_rt_6=t_tram_rail+t_wait_tram(tram_6_flow, 0.5*1/tram_freq);
m_rt_6=tram_base;
t_rt_7=t_tram_rail+t_wait_tram(tram_7_flow, 0.5*1/tram_freq);
m_rt_7=tram_base;
t_rt_8=t_tram_rail+t_wait_tram(tram_8_flow, 0.5*1/tram_freq);
m_rt_8=tram_base;
t_rt_11=t_tram_rail+t_wait_tram(tram_11_flow, 0.5*1/tram_freq);
m_rt_11=tram_base;
t_rt=[t_rt_4,t_rt_6,t_rt_7,t_rt_8,t_rt_11];
m_rt=[m_rt_4,m_rt_6,m_rt_7,m_rt_8,m_rt_11];

% transfer link cost from car to metro
t_cm_1=t_car_metro+t_wait_metro(metro_1_flow, 0.5*1/metro_freq)+t_findpark(park_1_flow, park_time_1);
m_cm_1=park_fee_1*parkingTime+metro_base;
t_cm_2=t_car_metro+t_wait_metro(metro_2_flow, 0.5*1/metro_freq)+t_findpark(park_2_flow, park_time_2);
m_cm_2=park_fee_2*parkingTime+metro_base;
t_cm_3=t_car_metro+t_wait_metro(metro_3_flow, 0.5*1/metro_freq)+t_findpark(park_3_flow, park_time_3);
m_cm_3=park_fee_3*parkingTime+metro_base;
t_cm_4=t_car_metro+t_wait_metro(metro_4_flow, 0.5*1/metro_freq)+t_findpark(park_4_flow, park_time_4);
m_cm_4=park_fee_4*parkingTime+metro_base;
t_cm_5=t_car_metro+t_wait_metro(metro_5_flow, 0.5*1/metro_freq)+t_findpark(park_5_flow, park_time_5);
m_cm_5=park_fee_5*parkingTime+metro_base;
t_cm_6=t_car_metro+t_wait_metro(metro_6_flow, 0.5*1/metro_freq)+t_findpark(park_6_flow, park_time_6);
m_cm_6=park_fee_6*parkingTime+metro_base;
t_cm_8=t_car_metro+t_wait_metro(metro_8_flow, 0.5*1/metro_freq)+t_findpark(park_8_flow, park_time_8);
m_cm_8=park_fee_8*parkingTime+metro_base;
t_cm_10=t_car_metro+t_wait_metro(metro_10_flow, 0.5*1/metro_freq)+t_findpark(park_10_flow, park_time_10);
m_cm_10=park_fee_10*parkingTime+metro_base;
t_cm=[t_cm_1,t_cm_2,t_cm_3,t_cm_4,t_cm_5,t_cm_6,t_cm_8,t_cm_10];
m_cm=[m_cm_1,m_cm_2,m_cm_3,m_cm_4,m_cm_5,m_cm_6,m_cm_8,m_cm_10];

% transfer link cost from bus to metro
t_bm_1=t_bus_metro+t_wait_metro(metro_1_flow, 0.5*1/metro_freq);
m_bm_1=metro_base;
t_bm_2=t_bus_metro+t_wait_metro(metro_2_flow, 0.5*1/metro_freq);
m_bm_2=metro_base;
t_bm_3=t_bus_metro+t_wait_metro(metro_3_flow, 0.5*1/metro_freq);
m_bm_3=metro_base;
t_bm_4=t_bus_metro+t_wait_metro(metro_4_flow, 0.5*1/metro_freq);
m_bm_4=metro_base;
t_bm_5=t_bus_metro+t_wait_metro(metro_5_flow, 0.5*1/metro_freq);
m_bm_5=metro_base;
t_bm_6=t_bus_metro+t_wait_metro(metro_6_flow, 0.5*1/metro_freq);
m_bm_6=metro_base;
t_bm_7=t_bus_metro+t_wait_metro(metro_7_flow, 0.5*1/metro_freq);
m_bm_7=metro_base;
t_bm_8=t_bus_metro+t_wait_metro(metro_8_flow, 0.5*1/metro_freq);
m_bm_8=metro_base;
t_bm_10=t_bus_metro+t_wait_metro(metro_10_flow, 0.5*1/metro_freq);
m_bm_10=metro_base;
t_bm=[t_bm_1,t_bm_2,t_bm_3,t_bm_4,t_bm_5,t_bm_6,t_bm_7,t_bm_8,t_bm_10];
m_bm=[m_bm_1,m_bm_2,m_bm_3,m_bm_4,m_bm_5,m_bm_6,m_bm_7,m_bm_8,m_bm_10];

% transfer link cost from tram to metro
t_tm_2=t_tram_metro+t_wait_metro(metro_2_flow, 0.5*1/metro_freq);
m_tm_2=metro_base;
t_tm_4=t_tram_metro+t_wait_metro(metro_4_flow, 0.5*1/metro_freq);
m_tm_4=metro_base;
t_tm_5=t_tram_metro+t_wait_metro(metro_5_flow, 0.5*1/metro_freq);
m_tm_5=metro_base;
t_tm_6=t_tram_metro+t_wait_metro(metro_6_flow, 0.5*1/metro_freq);
m_tm_6=metro_base;
t_tm_7=t_tram_metro+t_wait_metro(metro_7_flow, 0.5*1/metro_freq);
m_tm_7=metro_base;
t_tm_8=t_tram_metro+t_wait_metro(metro_8_flow, 0.5*1/metro_freq);
m_tm_8=metro_base;
t_tm_10=t_tram_metro+t_wait_metro(metro_10_flow, 0.5*1/metro_freq);
m_tm_10=metro_base;
t_tm=[t_tm_2,t_tm_4,t_tm_5,t_tm_6,t_tm_7,t_tm_8,t_tm_10];
m_tm=[m_tm_2,m_tm_4,m_tm_5,m_tm_6,m_tm_7,m_tm_8,m_tm_10];

% transfer link cost from rail to metro
t_rm_3=t_metro_rail+t_wait_metro(metro_3_flow, 0.5*1/metro_freq);
m_rm_3=metro_base;
t_rm_4=t_metro_rail+t_wait_metro(metro_4_flow, 0.5*1/metro_freq);
m_rm_4=metro_base;
t_rm_6=t_metro_rail+t_wait_metro(metro_6_flow, 0.5*1/metro_freq);
m_rm_6=metro_base;
t_rm_7=t_metro_rail+t_wait_metro(metro_7_flow, 0.5*1/metro_freq);
m_rm_7=metro_base;
t_rm_8=t_metro_rail+t_wait_metro(metro_8_flow, 0.5*1/metro_freq);
m_rm_8=metro_base;
t_rm=[t_rm_3,t_rm_4,t_rm_6,t_rm_7,t_rm_8];
m_rm=[m_rm_3,m_rm_4,m_rm_6,m_rm_7,m_rm_8];

% transfer link cost from car to rail
t_cr_3=t_car_rail+t_wait_rail(rail_3_flow, 0.5*1/train_freq)+t_findpark(park_3_flow, park_time_3);
m_cr_3=park_fee_3*parkingTime+train_base;
t_cr_4=t_car_rail+t_wait_rail(rail_4_flow, 0.5*1/train_freq)+t_findpark(park_4_flow, park_time_4);
m_cr_4=park_fee_4*parkingTime+train_base;
t_cr_6=t_car_rail+t_wait_rail(rail_6_flow, 0.5*1/train_freq)+t_findpark(park_6_flow, park_time_6);
m_cr_6=park_fee_6*parkingTime+train_base;
t_cr_8=t_car_rail+t_wait_rail(rail_8_flow, 0.5*1/train_freq)+t_findpark(park_8_flow, park_time_8);
m_cr_8=park_fee_8*parkingTime+train_base;
t_cr_11=t_car_rail+t_wait_rail(rail_11_flow, 0.5*1/train_freq)+t_findpark(park_11_flow, park_time_11);
m_cr_11=park_fee_11*parkingTime+train_base;
t_cr=[t_cr_3,t_cr_4,t_cr_6,t_cr_8,t_cr_11];
m_cr=[m_cr_3,m_cr_4,m_cr_6,m_cr_8,m_cr_11];

% transfer link cost from bus to rail
t_br_3=t_bus_rail+t_wait_rail(rail_3_flow, 0.5*1/train_freq);
m_br_3=train_base;
t_br_4=t_bus_rail+t_wait_rail(rail_4_flow, 0.5*1/train_freq);
m_br_4=train_base;
t_br_6=t_bus_rail+t_wait_rail(rail_6_flow, 0.5*1/train_freq);
m_br_6=train_base;
t_br_7=t_bus_rail+t_wait_rail(rail_7_flow, 0.5*1/train_freq);
m_br_7=train_base;
t_br_8=t_bus_rail+t_wait_rail(rail_8_flow, 0.5*1/train_freq);
m_br_8=train_base;
t_br_11=t_bus_rail+t_wait_rail(rail_11_flow, 0.5*1/train_freq);
m_br_11=train_base;
t_br=[t_br_3,t_br_4,t_br_6,t_br_7,t_br_8,t_br_11];
m_br=[m_br_3,m_br_4,m_br_6,m_br_7,m_br_8,m_br_11];

% transfer link cost from tram to rail
t_tr_4=t_tram_rail+t_wait_rail(rail_4_flow, 0.5*1/train_freq);
m_tr_4=train_base;
t_tr_6=t_tram_rail+t_wait_rail(rail_6_flow, 0.5*1/train_freq);
m_tr_6=train_base;
t_tr_7=t_tram_rail+t_wait_rail(rail_7_flow, 0.5*1/train_freq);
m_tr_7=train_base;
t_tr_8=t_tram_rail+t_wait_rail(rail_8_flow, 0.5*1/train_freq);
m_tr_8=train_base;
t_tr_11=t_tram_rail+t_wait_rail(rail_11_flow, 0.5*1/train_freq);
m_tr_11=train_base;
t_tr=[t_tr_4,t_tr_6,t_tr_7,t_tr_8,t_tr_11];
m_tr=[m_tr_4,m_tr_6,m_tr_7,m_tr_8,m_tr_11];

% transfer link cost from metro to rail
t_mr_3=t_metro_rail+t_wait_rail(rail_3_flow, 0.5*1/train_freq);
m_mr_3=train_base;
t_mr_4=t_metro_rail+t_wait_rail(rail_4_flow, 0.5*1/train_freq);
m_mr_4=train_base;
t_mr_6=t_metro_rail+t_wait_rail(rail_6_flow, 0.5*1/train_freq);
m_mr_6=train_base;
t_mr_7=t_metro_rail+t_wait_rail(rail_7_flow, 0.5*1/train_freq);
m_mr_7=train_base;
t_mr_8=t_metro_rail+t_wait_rail(rail_8_flow, 0.5*1/train_freq);
m_mr_8=train_base;
t_mr=[t_mr_3,t_mr_4,t_mr_6,t_mr_7,t_mr_8];
m_mr=[m_mr_3,m_mr_4,m_mr_6,m_mr_7,m_mr_8];

% transfer link cost from origin to node
% origin to car node
t_oc_1=0;
m_oc_1=0;
t_oc_2=0;
m_oc_2=0;
t_oc_3=0;
m_oc_3=0;
t_oc_4=0;
m_oc_4=0;
t_oc_5=0;
m_oc_5=0;
t_oc=[t_oc_1,t_oc_2,t_oc_3,t_oc_4,t_oc_5];
m_oc=[m_oc_1,m_oc_2,m_oc_3,m_oc_4,m_oc_5];
% origin to bus node
t_origin_bus=0.15;
t_ob_1=t_origin_bus+t_wait_bus(bus_1_flow, 0.5*1/bus_freq);
m_ob_1=bus_base;
t_ob_2=t_origin_bus+t_wait_bus(bus_2_flow, 0.5*1/bus_freq);
m_ob_2=bus_base;
t_ob_3=t_origin_bus+t_wait_bus(bus_3_flow, 0.5*1/bus_freq);
m_ob_3=bus_base;
t_ob_4=t_origin_bus+t_wait_bus(bus_10_flow, 0.5*1/bus_freq);
m_ob_4=bus_base;
t_ob_5=t_origin_bus+t_wait_bus(bus_11_flow, 0.5*1/bus_freq);
m_ob_5=bus_base;
t_ob=[t_ob_1,t_ob_2,t_ob_3,t_ob_4,t_ob_5];
m_ob=[];
% origin to tram node
t_origin_tram=0.15;
t_ot_2=t_origin_tram+t_wait_tram(tram_2_flow, 0.5*1/tram_freq);
m_ot_2=tram_base;
t_ot_4=t_origin_tram+t_wait_tram(tram_10_flow, 0.5*1/tram_freq);
m_ot_4=tram_base;
t_ot_5=t_origin_tram+t_wait_tram(tram_11_flow, 0.5*1/tram_freq);
m_ot_5=tram_base;
% origin to metro node
t_origin_metro=0.2;
t_om_1=t_origin_metro+t_wait_metro(metro_1_flow, 0.5*1/metro_freq);
m_om_1=metro_base;
t_om_2=t_origin_metro+t_wait_metro(metro_2_flow, 0.5*1/metro_freq);
m_om_2=metro_base;
t_om_3=t_origin_metro+t_wait_metro(metro_3_flow, 0.5*1/metro_freq);
m_om_3=metro_base;
t_om_4=t_origin_metro+t_wait_metro(metro_10_flow, 0.5*1/metro_freq);
m_om_4=metro_base;
t_om_5=t_origin_metro+t_wait_metro(metro_11_flow, 0.5*1/metro_freq);
m_om_5=metro_base;
% origin to rail node
t_origin_rail=0.25;
t_or_3=t_origin_rail+t_wait_rail(rail_3_flow, 0.5*1/train_freq);
m_or_3=train_base;
t_or_5=t_origin_rail+t_wait_rail(rail_11_flow, 0.5*1/train_freq);
m_or_5=train_base;

% transfer from node to destination
% from car node to destination
t_car_desti=0.03;
t_cd_2=t_car_desti+t_findpark(park_9_flow, park_time_9);
m_cd_2=0;
% from bus node to destination
t_bus_desti=0.06;
t_bd_1=t_bus_desti;
m_bd_1=0;
t_bd_2=t_bus_desti+0.02;
m_bd_2=0;
% from tram node to destination
t_tram_desti=0.06;
t_td_1=t_tram_desti;
m_td_1=0;
% from metro node to destination
t_metro_desti=0.09;
t_md_1=t_metro_desti;
m_md_1=0;
% from rail node to destination
t_rail_desti=0.09;
t_rd_1=t_rail_desti;
m_rd_1=0;

%% 
time_cost=[t_car, t_bus, t_tram, t_metro, t_rail];

monetary_cost=[m_car, m_bus, m_tram, m_metro, m_rail];




end


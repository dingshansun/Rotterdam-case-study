clear
X={'x_c_12';
'x_c_21';
'x_c_23';
'x_c_32';
'x_c_14';
'x_c_24';
'x_c_25';
'x_c_35';
'x_c_16';
'x_c_45';
'x_c_54';
'x_c_46';
'x_c_64';
'x_c_47';
'x_c_57';
'x_c_75';
'x_c_58';
'x_c_85';
'x_c_67';
'x_c_76';
'x_c_78';
'x_c_87';
'x_c_69';
'x_c_710';
'x_c_107';
'x_c_810';
'x_c_108';
'x_c_118';
'x_c_109';
'x_c_1110';
'x_b_12';
'x_b_21';
'x_b_23';
'x_b_32';
'x_b_14';
'x_b_24';
'x_b_25';
'x_b_35';
'x_b_16';
'x_b_45';
'x_b_54';
'x_b_46';
'x_b_64';
'x_b_47';
'x_b_57';
'x_b_75';
'x_b_58';
'x_b_85';
'x_b_67';
'x_b_76';
'x_b_78';
'x_b_87';
'x_b_69';
'x_b_710';
'x_b_107';
'x_b_810';
'x_b_108';
'x_b_118';
'x_b_109';
'x_b_1110';
'x_t_24';
'x_t_45';
'x_t_54';
'x_t_47';
'x_t_57';
'x_t_75';
'x_t_67';
'x_t_76';
'x_t_78';
'x_t_87';
'x_t_810';
'x_t_108';
'x_t_118';
'x_m_14';
'x_m_24';
'x_m_35';
'x_m_47';
'x_m_57';
'x_m_75';
'x_m_67';
'x_m_76';
'x_m_78';
'x_m_87';
'x_m_810';
'x_m_108';
'x_r_34';
'x_r_47';
'x_r_74';
'x_r_67';
'x_r_76';
'x_r_78';
'x_r_87';
'x_r_118';
'x_cb_1';
'x_cb_2';
'x_cb_3';
'x_cb_4';
'x_cb_5';
'x_cb_6';
'x_cb_8';
'x_cb_9';
'x_cb_10';
'x_cb_11';
'x_ct_2';
'x_ct_4';
'x_ct_5';
'x_ct_6';
'x_ct_8';
'x_ct_10';
'x_ct_11';
'x_cm_1';
'x_cm_2';
'x_cm_3';
'x_cm_4';
'x_cm_5';
'x_cm_6';
'x_cm_8';
'x_cm_10';
'x_cr_3';
'x_cr_4';
'x_cr_6';
'x_cr_8';
'x_cr_11';
'x_bt_2';
'x_bt_4';
'x_bt_5';
'x_bt_6';
'x_bt_7';
'x_bt_8';
'x_bt_10';
'x_bt_11';
'x_bm_1';
'x_bm_2';
'x_bm_3';
'x_bm_4';
'x_bm_5';
'x_bm_6';
'x_bm_7';
'x_bm_8';
'x_bm_10';
'x_br_3';
'x_br_4';
'x_br_6';
'x_br_7';
'x_br_8';
'x_br_11';
'x_tb_2';
'x_tb_4';
'x_tb_5';
'x_tb_6';
'x_tb_7';
'x_tb_8';
'x_tb_10';
'x_tb_11';
'x_tm_2';
'x_tm_4';
'x_tm_5';
'x_tm_6';
'x_tm_7';
'x_tm_8';
'x_tm_10';
'x_tr_4';
'x_tr_6';
'x_tr_7';
'x_tr_8';
'x_tr_11';
'x_mb_1';
'x_mb_2';
'x_mb_3';
'x_mb_4';
'x_mb_5';
'x_mb_6';
'x_mb_7';
'x_mb_8';
'x_mb_10';
'x_mt_2';
'x_mt_4';
'x_mt_5';
'x_mt_6';
'x_mt_7';
'x_mt_8';
'x_mt_10';
'x_mr_3';
'x_mr_4';
'x_mr_6';
'x_mr_7';
'x_mr_8';
'x_rb_3';
'x_rb_4';
'x_rb_6';
'x_rb_7';
'x_rb_8';
'x_rb_11';
'x_rt_4';
'x_rt_6';
'x_rt_7';
'x_rt_8';
'x_rt_11';
'x_rm_3';
'x_rm_4';
'x_rm_6';
'x_rm_7';
'x_rm_8';
'x_O1c1';
'x_O1b1';
'x_O1m1';
'x_O2c2';
'x_O2b2';
'x_O2t2';
'x_O2m2';
'x_O3c3';
'x_O3b3';
'x_O3m3';
'x_O3r3';
'x_O4c10';
'x_O4b10';
'x_O4t10';
'x_O4m10';
'x_O5c11';
'x_O5b11';
'x_O5t11';
'x_O5r11';
'x_b7D1';
'x_t7D1';
'x_m7D1';
'x_r7D1';
'x_c9D2';
'x_b9D2'};

% Input initialization (example setup for testing)
Aeq = zeros(52, 228); % Initialize the Aeq matrix
% Assume plusMatrix, minusMatrix, and X are provided.
[plusMatrix,minusMatrix]=Extract_matrix;
% Iterate over rows
for i = 1:size(Aeq, 1)
    % Extract current row of plusMatrix and minusMatrix
    plusStrings = plusMatrix(i, :);
    minusStrings = minusMatrix(i, :);
    
    % Remove empty strings
    plusStrings = plusStrings(~cellfun('isempty', plusStrings));
    minusStrings = minusStrings(~cellfun('isempty', minusStrings));
    
    % Find indices in X for plus and minus strings
    [~, plusIndices] = ismember(plusStrings, X);
    [~, minusIndices] = ismember(minusStrings, X);
    
    % Set +1 for matching plus indices
    Aeq(i, plusIndices(plusIndices > 0)) = 1;
    % Set -1 for matching minus indices
    Aeq(i, minusIndices(minusIndices > 0)) = -1;
end
[row, col, val] = find(Aeq); % Find row indices, column indices, and values of nonzero elements
[m, n] = size(Aeq);          % Get dimensions of Aeq
Aeq_sparse = sparse(row, col, val, m, n);
Aeq_full = full(Aeq_sparse);
assert(isequal(Aeq, Aeq_full), 'Conversion failed!');
disp('Sparse and dense matrices are equivalent.');
% Display result
% disp('Matrix Aeq:');
% disp(Aeq);

% Aeq=zeros(52,227); % the constraints of node flows, according to conservation
% Positive_index=cell(52,10);
% % node O1: +x_O1c1+x_O1b1+x_O1m1
% Positive_index(1,1:3)={'x_O1c1', 'x_O1b1','x_O1m1'};
% % node O2: +x_O2c2+x_O2b2+x_O2t2+x_O2m2
% Positive_index(2,1:4)={'x_O2c2','x_O2b2','x_O2t2','x_O2m2'};
% % node O3: +x_O3c3+x_O3b3+x_O3m3+x_O3r3
% Positive_index(3,1:4)={'x_O3c3','x_O3b3','x_O3m3','x_O3r3'};
% % node O4: +x_O4c10+x_O4b10+x_O4t10+x_O4m10
% Positive_index(4,1:4)={'x_O4c10','x_O4b10','x_O4t10','x_O4m10'};
% % node O5: +x_O5c11+x_O5b11+x_O5t11+x_O5r11
% Positive_index(5,1:4)={'x_O5c11','x_O5b11','x_O5t11','x_O5r11'};
% % node D1: +x_b7D1+x_t7D1+x_m7D1+x_r7D1
% Positive_index(6,1:4)={'x_b7D1','x_t7D1','x_m7D1','x_r7D1'};
% % node D2: +x_c9D2+x_b9D2
% Positive_index(7,1:2)={'x_c9D2','x_b9D2'};
% % node c1: +x_O1c1+x_c_21   -x_c_12-x_c_14-x_c_16-x_cb_1-x_cm_1
% Positive_index(8,1:2)={'x_O1c1','x_c_21'};
% % node c2: +x_O2c2+x_c_12+x_c_32    -x_c_21-x_c_23-x_c_24-x_c_25-x_cb_2-x_ct_2-x_cm_2
% Positive_index(9,1:3)={'x_O2c2','x_c_12','x_c_32'};
% % node c3: +x_O3c3+x_c_23   -x_c_32-x_c_35-x_cb_3-x_cm_3-x_cr_3
% Positive_index(10,1:2)={'x_O3c3','x_c_23'};
% % node c4: +x_c_14+x_c_24+x_c_54+x_c_64     -x_c_45-x_c_46-x_c_47-x_cb_4-x_ct_4-x_cm_4-x_cr_4
% Positive_index(11,1:4)={'x_c_14','x_c_24','x_c_54','x_c_64'};
% % node c5: +x_c_25+x_c_35+x_c_45+x_c_75+x_c_85    -x_c_54-x_c_57-x_c_58-x_cb_5-x_ct_5-x_cm_5
% Positive_index(12,1:5)={'x_c_25','x_c_35','x_c_45','x_c_75','x_c_85'};
% % node c6: +x_c_16+x_c_46+x_c_76    -x_c_64-x_c_67-x_c_69-x_cb_6-x_ct_6-x_cm_6-x_cr_6
% Positive_index(13,1:3)={'x_c_16','x_c_46','x_c_76'};
% % node c7: +x_c_47+x_c_57+x_c_67+x_c_87+x_c_107     -x_c_75-x_c_76-x_c_78-x_c_710
% Positive_index(14,1:5)={'x_c_47','x_c_57','x_c_67','x_c_87','x_c_107'};
% % node c8: +x_c_58+x_c_78+x_c_108+x_c_118     -x_c_85-x_c_87-x_c_810-x_ct_8-x_cm_8-x_cb_8-x_cr_8
% Positive_index(15,1:4)={'x_c_58','x_c_78','x_c_108','x_c_118'};
% % node c9: +x_c_69+x_c_109    -x_c9D2-x_cb_9
% Positive_index(16,1:2)={'x_c_69','x_c_109'};
% % node c10: +x_O4c10+x_c_710+x_c_810+x_c_1110     -x_c_107-x_c_108-x_c_109-x_cb_10-x_ct_10-x_cm_10
% Positive_index(17,1:4)={'x_O4c10','x_c_710','x_c_810','x_c_1110'};
% % node c11: +x_O5c11   -x_c_118-x_c_1110-x_cb_11-x_ct_11-x_cr_11
% Positive_index(18,1:1)={'x_O5c11'};
% % node b1: +x_O1b1+x_cb_1+x_mb_1+x_b_21   -x_b_12-x_b_14-x_b_16-x_bm_1
% Positive_index(19,1:4)={'x_O1b1','x_cb_1','x_mb_1','x_b_21'};
% % node b2: +x_O2b2+x_cb_2+x_tb_2+x_mb_2+x_b_12+x_b_32    -x_b_21-x_b_23-x_b_24-x_b_25-x_bt_2-x_bm_2
% Positive_index(20,1:6)={'x_O2b2','x_cb_2','x_tb_2','x_mb_2','x_b_12','x_b_32'};
% % node b3: +x_O3b3+x_b_23+x_cb_3+x_mb_3+x_rb_3     -x_b_32-x_b_35-x_bm_3-x_br_3
% Positive_index(21,1:5)={'x_O3b3','x_b_23','x_cb_3','x_mb_3','x_rb_3'};
% % node b4: +x_b_14+x_b_24+x_b_54+x_b_64+x_cb_4+x_tb_4+x_mb_4+x_rb_4    -x_b_45-x_b_46-x_b_47-x_bt_4-x_bm_4-x_br_4
% Positive_index(22,1:8)={'x_b_14','x_b_24','x_b_54','x_b_64','x_cb_4','x_tb_4','x_mb_4','x_rb_4'};
% % node b5: +x_b_25+x_b_35+x_b_45+x_b_75+x_b_85+x_cb_5+x_tb_5+x_mb_5     -x_b_58-x_b_57-x_b_54-x_bt_5-x_bm_5
% Positive_index(23,1:8)={'x_b_25','x_b_35','x_b_45','x_b_75','x_b_85','x_cb_5','x_tb_5','x_mb_5'};
% % node b6: +x_b_16+x_b_46+x_b_76+x_cb_6+x_tb_6+x_mb_6+x_rb_6    -x_b_64-x_b_67-x_b_69-x_bt_6-x_bm_6-x_br_6
% Positive_index(24,1:7)={'x_b_16','x_b_46','x_b_76','x_cb_6','x_tb_6','x_mb_6','x_rb_6'};
% % node b7: +x_b_47+x_b_57+x_b_67+x_b_87+x_b_107+x_tb_7+x_mb_7+x_rb_7   -x_b_75-x_b_76-x_b_78-x_b_710-x_b7D1-x_bt_7-x_bm_7-x_br_7
% Positive_index(25,1:8)={'x_b_47','x_b_57','x_b_67','x_b_87','x_b_107','x_tb_7','x_mb_7','x_rb_7'};
% % node b8: +x_b_58+x_b_78+x_b_108+x_b_118+x_cb_8+x_tb_8+x_mb_8+x_rb_8    -x_b_85-x_b_87-x_b_810-x_b_811-x_bt_8-x_bm_8-x_br_8
% Positive_index(26,1:8)={'x_b_58','x_b_78','x_b_108','x_b_118','x_cb_8','x_tb_8','x_mb_8','x_rb_8'};
% % node b9: +x_b_69+x_b_109+x_cb_9   -x_b9D2
% Positive_index(27,1:3)={'x_b_69','x_b_109','x_cb_9'};
% % node b10: +x_O4b10+x_b_710+x_b_810+x_b_1110+x_cb_10+x_tb_10+x_mb_10    -x_b_107-x_b_108-x_b_109-x_bt_10-x_bm_10
% Positive_index(28,1:7)={'x_O4b10','x_b_710','x_b_810','x_b_1110','x_cb_10','x_tb_10','x_mb_10'};
% % node b11: +x_O5b11+x_cb_11+x_tb_11+x_rb_11     -x_b_118-x_b_1110-x_bt_11-x_br_11
% Positive_index(29,1:4)={'x_O5b11','x_cb_11','x_tb_11','x_rb_11'};
% 
% % node t2: +x_O2t2+x_ct_2+x_bt_2+x_mt_2   -x_t_24-x_tb_2-x_tm_2
% Positive_index(30,1:4)={'x_O2t2','x_ct_2','x_bt_2','x_mt_2'};
% % node t4: +x_t_24+x_t_54+x_ct_4+x_bt_4+x_mt_4+x_rt_4     -x_t_45-x_t_47-x_tb_4-x_tm_4-x_tr_4
% Positive_index(31,1:6)={'x_t_24','x_t_54','x_ct_4','x_bt_4','x_mt_4','x_rt_4'};
% % node t5: +x_t_45+x_t_75+x_ct_5+x_bt_5+x_mt_5    -x_t_54-x_t_57-x_tb_5-x_tm_5
% Positive_index(32,1:5)={'x_t_45','x_t_75','x_ct_5','x_bt_5','x_mt_5'};
% % node t6: +x_t_76+x_ct_6+x_bt_6+x_mt_6+x_rt_6    -x_t_67-x_tb_6-x_tm_6-x_tr_6
% Positive_index(33,1:5)={'x_t_76','x_ct_6','x_bt_6','x_mt_6','x_rt_6'};
% % node t7: +x_t_47+x_t_57+x_t_67+x_t_87+x_bt_7+x_mt_7+x_rt_7    -x_t7D1-x_t_75-x_t_76-x_t_78-x_tb_7-x_tm_7-x_tr_7
% Positive_index(34,1:7)={'x_t_47','x_t_57','x_t_67','x_t_87','x_bt_7','x_mt_7','x_rt_7'};
% % node t8: +x_t_78+x_t_108+x_t_118+x_ct_8+x_bt_8+x_mt_8+x_rt_8     -x_t_87-x_t_810-x_tb_8-x_tm_8-x_tr_8
% Positive_index(35,1:7)={'x_t_78','x_t_108','x_t_118','x_ct_8','x_bt_8','x_mt_8','x_rt_8'};
% % node t10: +x_O4t10+x_t_810+x_ct_10+x_bt_10+x_mt_10      -x_t_108-x_tb_10-x_tm_10
% Positive_index(36,1:5)={'x_O4t10','x_t_810','x_ct_10','x_bt_10','x_mt_10'};
% % node t11: +x_O5t11+x_ct_11+x_bt_11+x_rt_11     -x_t_118-x_tb_11-x_tr_11
% Positive_index(37,1:4)={'x_O5t11','x_ct_11','x_bt_11','x_rt_11'};
% 
% % node m1: +x_O1m1+x_cm_1+x_bm_1    -x_m_14-x_mb_1
% Positive_index(38,1:3)={'x_O1m1','x_cm_1','x_bm_1'};
% % node m2: +x_O2m2+x_cm_2+x_bm_2+x_tm_2    -x_m_24-x_mb_2-x_mt_2
% Positive_index(39,1:4)={'x_O2m2','x_cm_2','x_bm_2','x_tm_2'};
% % node m3: +x_O3m3+x_cm_3+x_bm_3+x_rm_3    -x_m_35-x_mb_3-x_mr_3
% Positive_index(40,1:4)={'x_O3m3','x_cm_3','x_bm_3','x_rm_3'};
% % node m4: +x_m_14+x_m_24+x_cm_4+x_bm_4+x_tm_4+x_rm_4    -x_m_47-x_mb_4-x_mt_4-x_mr_4
% Positive_index(41,1:6)={'x_m_14','x_m_24','x_cm_4','x_bm_4','x_tm_4','x_rm_4'};
% % node m5: +x_m_35+x_m_75+x_cm_5+x_bm_5+x_tm_5    -x_m_57-x_mb_5-x_mt_5
% Positive_index(42,1:5)={'x_m_35','x_m_75','x_cm_5','x_bm_5','x_tm_5'};
% % node m6: +x_m_76+x_cm_6+x_bm_6+x_tm_6+x_rm_6    -x_m_67-x_mb_6-x_mt_6-x_mr_6
% Positive_index(43,1:5)={'x_m_76','x_cm_6','x_bm_6','x_tm_6','x_rm_6'};
% % node m7: +x_m_47+x_m_57+x_m_67+x_m_87+x_bm_7+x_tm_7+x_rm_7   -x_m7D1-x_m_75-x_m_76-x_m_78-x_mb_7-x_mt_7-x_mr_7
% Positive_index(44,1:7)={'x_m_47','x_m_57','x_m_67','x_m_87','x_bm_7','x_tm_7','x_rm_7'};
% % node m8: +x_m_78+x_m_108+x_cm_8+x_bm_8+x_tm_8+x_rm_8   -x_m_87-x_m_810-x_mb_8-x_mt_8-x_mr_8
% Positive_index(45,1:6)={'x_m_78','x_m_108','x_cm_8','x_bm_8','x_tm_8','x_rm_8'};
% % node m10: +x_O4m10+x_m_810+x_cm_10+x_bm_10+x_tm_10     -x_m_108-x_mb_10-x_mt_10
% Positive_index(46,1:5)={'x_O4m10','x_m_810','x_cm_10','x_bm_10','x_tm_10'};
% 
% %node r3: +x_O3r3+x_cr_3+x_br_3+x_mr_3     -x_r_34-x_rb_3-x_rm_3
% Positive_index(47,1:4)={'x_O3r3','x_cr_3','x_br_3','x_mr_3'};
% %node r4: +x_r_34+x_r_74+x_cr_4+x_br_4+x_tr_4+x_mr_4    -x_r_47-x_rb_4-x_rt_4-x_rm_4
% Positive_index(48,1:6)={'x_r_34','x_r_74','x_cr_4','x_br_4','x_tr_4','x_mr_4'};
% %node r6: +x_r_76+x_cr_6+x_br_6+x_tr_6+x_mr_6    -x_r_67-x_rb_6-x_rt_6-x_rm_6
% Positive_index(49,1:5)={'x_r_76','x_cr_6','x_br_6','x_tr_6','x_mr_6'};
% %node r7: +x_r_47+x_r_67+x_r_87+x_br_7+x_tr_7+x_mr_7     -x_r7D1-x_r_74-x_r_76-x_r_78-x_rb_7-x_rt_7-x_rm_7
% Positive_index(50,1:6)={'x_r_47','x_r_67','x_r_87','x_br_7','x_tr_7','x_mr_7'};
% %node r8: +x_r_78+x_r_118+x_cr_8+x_br_8+x_tr_8+x_mr_8     -x_r_87-x_rb_8-x_rt_8-x_rm_8
% Positive_index(51,1:6)={'x_r_78','x_r_118','x_cr_8','x_br_8','x_tr_8','x_mr_8'};
% %node r11: +x_cr_11+x_br_11+x_tr_11     -x_r_118-x_rb_11-x_rt_11
% Positive_index(52,1:3)={'x_cr_11','x_br_11','x_tr_11'};





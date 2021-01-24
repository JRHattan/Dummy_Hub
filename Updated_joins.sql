SELECT id, loan_amnt, annual_inc, loan_status, dti, delinq_2yrs, fico_range_low, inq_last_6mths, open_acc, pub_rec, revol_bal, revol_util, total_acc, collections_12_mths_ex_med, acc_now_delinq, tot_coll_amt, tot_cur_bal, acc_open_past_24mths, avg_cur_bal, bc_open_to_buy, bc_util, chargeoff_within_12_mths, mo_sin_old_rev_tl_op, mo_sin_rcnt_rev_tl_op, mo_sin_rcnt_tl, mort_acc, mths_since_recent_bc, num_accts_ever_120_pd, num_actv_bc_tl, num_actv_rev_tl, num_bc_sats, num_bc_tl, num_il_tl, num_op_rev_tl, num_rev_accts, num_rev_tl_bal_gt_0, num_sats, num_tl_30dpd, num_tl_90g_dpd_24m, num_tl_op_past_12m, pct_tl_nvr_dlq, percent_bc_gt_75, pub_rec_bankruptcies, tax_liens, tot_hi_cred_lim, total_bal_ex_mort, total_bc_limit, total_il_high_credit_limit INTO join_test_3
FROM loan_data_final;

SELECT id, issue_d INTO join_test_4
FROM date_id;


CREATE TABLE loan_data_final_with_date
AS (SELECT join_test_3.id, join_test_3.loan_amnt, join_test_3.annual_inc, join_test_3.loan_status, join_test_3.dti, join_test_3.delinq_2yrs, join_test_3.fico_range_low, join_test_3.inq_last_6mths, join_test_3.open_acc, join_test_3.pub_rec, join_test_3.revol_bal, join_test_3.revol_util, join_test_3.total_acc, join_test_3.collections_12_mths_ex_med, join_test_3.acc_now_delinq, join_test_3.tot_coll_amt, join_test_3.tot_cur_bal, join_test_3.acc_open_past_24mths, join_test_3.avg_cur_bal, join_test_3.bc_open_to_buy, join_test_3.bc_util, join_test_3.chargeoff_within_12_mths, join_test_3.mo_sin_old_rev_tl_op, join_test_3.mo_sin_rcnt_rev_tl_op, join_test_3.mo_sin_rcnt_tl, join_test_3.mort_acc, join_test_3.mths_since_recent_bc, join_test_3.num_accts_ever_120_pd, join_test_3.num_actv_bc_tl, join_test_3.num_actv_rev_tl, join_test_3.num_bc_sats, join_test_3.num_bc_tl, join_test_3.num_il_tl, join_test_3.num_op_rev_tl, join_test_3.num_rev_accts, join_test_3.num_rev_tl_bal_gt_0, join_test_3.num_sats, join_test_3.num_tl_30dpd, join_test_3.num_tl_90g_dpd_24m, join_test_3.num_tl_op_past_12m, join_test_3.pct_tl_nvr_dlq, join_test_3.percent_bc_gt_75, join_test_3.pub_rec_bankruptcies, join_test_3.tax_liens, join_test_3.tot_hi_cred_lim, join_test_3.total_bal_ex_mort, join_test_3.total_bc_limit, join_test_3.total_il_high_credit_limit, join_test_4.issue_d
	FROM join_test_4
	FULL JOIN join_test_3
	ON join_test_3.id = join_test_4.id
   )
   
DELETE 
FROM loan_data_final_with_date
WHERE (loan_amnt IS NULL OR loan_amnt = 0) 
AND (annual_inc IS NULL OR annual_inc = 0) 
AND (loan_status IS NULL);
**Create Neighbor Count Dummies with Gender and Race Identified for Each Origin and Destination Kid


clear all

cd "$repository/data_sets/generated"

use multiple_year_neighbor_number_score

*Identifying race and gender for destination kids
rename destination_gecc_id child

merge  m:1 child using gender_race

*Dropping kids not in our sample 
drop if _m == 2

drop _m

drop year

rename race race_destination
rename gender gender_destination

rename child destination_gecc_id

save neighbor_dummies_race_gender, replace


**Create Neighbors by Distance Male Neighbors 
local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if gender_destination == "Male"
		
		drop if total_meters > `d'
		

	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_m
	}
		
		save neighbors_male_circle_`d', replace
		
}

/*
**Create Neighbors by Distance Missing Gender Neighbors = NO SUCH OBSERVATIONS!!!!!!!!!!
local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if gender_destination == ""
		
		drop if total_meters > `d'
		
		count
		return list
		local num_observations = r(N)
		
		if `num_observations' == 0 {
		
		save neighbors_missing_gender_circle_`d', replace
		}
		
		else if `num_observations' > 0 {

		collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
		sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
		 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
		 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
		 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
		 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
		 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
		 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
		 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
		 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
		 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
		 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
		 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
		 aoy5_treated, by(origin_gecc_id randomization_ori )
		 
		reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated, i(origin_gecc_id randomization_ori ) j(test) s
		rename _* *

		foreach var in cash cogx college control kinderprep pka pkb preschool treated {
			rename `var' `var'_`d'_missing_gender
		}
		
		save neighbors_missing_gender_circle_`d', replace
		}
}
*/

**Create Neighbors by Distance Female Neighbors
local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if gender_destination == "Female"
		
		drop if total_meters > `d'


	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_f
	}
		
		save neighbors_female_circle_`d', replace
}

**Create Neighbors by Distance Black Neighbors

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if race_destination == "African American"
		
		drop if total_meters > `d'


	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_b
	}
		
		save neighbors_black_circle_`d', replace
}

**Create Neighbors by Distance Hispanic Neighbors

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if race_destination == "Hispanic"
		
		drop if total_meters > `d'


	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_h
	}
		
		save neighbors_hispanic_circle_`d', replace
}

**Create Neighbors by Distance Other Race Neighbors

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if race_destination == "Other"
		
		drop if total_meters > `d'


	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_o
	}
		
		save neighbors_other_race_circle_`d', replace
}

**Create Neighbors by Distance Missing Race Neighbors

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if race_destination == ""
		
		drop if total_meters > `d'
		
		count
		return list
		local num_observations = r(N)
		
		if `num_observations' == 0 {
		
		save neighbors_missing_race_circle_`d', replace
		
		}
		
		else if `num_observations' > 0 {
	

	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_n
	}
		
		save neighbors_missing_race_circle_`d', replace
		}
}

**Create Neighbors by Distance White Non-Hispanic Race Neighbors

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"

	foreach d of local distance {
	
		clear all
		cd "$repository/data_sets/generated"
		use neighbor_dummies_race_gender
		keep if race_destination == "White Non-Hispanic"
		
		drop if total_meters > `d'


	collapse (sum) pre_cash mid_cash post_cash sl_cash pre_cogx mid_cogx post_cogx ///
	sl_cogx pre_college mid_college post_college sl_college pre_control mid_control ///
	 post_control sl_control pre_kinderprep mid_kinderprep post_kinderprep ///
	 sl_kinderprep pre_pka mid_pka post_pka sl_pka pre_pkb mid_pkb post_pkb ///
	 sl_pkb pre_preschool mid_preschool post_preschool sl_preschool pre_treated ///
	 mid_treated post_treated sl_treated aoy1_cash aoy2_cash aoy3_cash ///
	 aoy4_cash aoy5_cash aoy1_cogx aoy2_cogx aoy3_cogx aoy4_cogx aoy5_cogx ///
	 aoy1_college aoy2_college aoy3_college aoy4_college aoy5_college aoy1_control ///
	 aoy2_control aoy3_control aoy4_control aoy5_control aoy1_kinderprep ///
	 aoy2_kinderprep aoy3_kinderprep aoy4_kinderprep aoy5_kinderprep aoy1_pka ///
	 aoy2_pka aoy3_pka aoy4_pka aoy5_pka aoy1_pkb aoy2_pkb aoy3_pkb aoy4_pkb ///
	 aoy5_pkb aoy1_preschool aoy2_preschool aoy3_preschool aoy4_preschool ///
	 aoy5_preschool aoy1_treated aoy2_treated aoy3_treated aoy4_treated ///
	 aoy5_treated ///
	 pre_v1std_cog_cash mid_v1std_cog_cash post_v1std_cog_cash sl_v1std_cog_cash aoy1_v1std_cog_cash aoy2_v1std_cog_cash aoy3_v1std_cog_cash aoy4_v1std_cog_cash aoy5_v1std_cog_cash ///
	 pre_v2std_cog_cash mid_v2std_cog_cash post_v2std_cog_cash sl_v2std_cog_cash aoy1_v2std_cog_cash aoy2_v2std_cog_cash aoy3_v2std_cog_cash aoy4_v2std_cog_cash aoy5_v2std_cog_cash ///
     pre_v1std_cog_cogx mid_v1std_cog_cogx post_v1std_cog_cogx sl_v1std_cog_cogx aoy1_v1std_cog_cogx aoy2_v1std_cog_cogx aoy3_v1std_cog_cogx aoy4_v1std_cog_cogx aoy5_v1std_cog_cogx ///
	 pre_v2std_cog_cogx mid_v2std_cog_cogx post_v2std_cog_cogx sl_v2std_cog_cogx aoy1_v2std_cog_cogx aoy2_v2std_cog_cogx aoy3_v2std_cog_cogx aoy4_v2std_cog_cogx aoy5_v2std_cog_cogx ///
     pre_v1std_cog_college mid_v1std_cog_college post_v1std_cog_college sl_v1std_cog_college aoy1_v1std_cog_college aoy2_v1std_cog_college aoy3_v1std_cog_college aoy4_v1std_cog_college aoy5_v1std_cog_college ///
	 pre_v2std_cog_college mid_v2std_cog_college post_v2std_cog_college sl_v2std_cog_college aoy1_v2std_cog_college aoy2_v2std_cog_college aoy3_v2std_cog_college aoy4_v2std_cog_college aoy5_v2std_cog_college ///
     pre_v1std_cog_control mid_v1std_cog_control post_v1std_cog_control sl_v1std_cog_control aoy1_v1std_cog_control aoy2_v1std_cog_control aoy3_v1std_cog_control aoy4_v1std_cog_control aoy5_v1std_cog_control ///
	 pre_v2std_cog_control mid_v2std_cog_control post_v2std_cog_control sl_v2std_cog_control aoy1_v2std_cog_control aoy2_v2std_cog_control aoy3_v2std_cog_control aoy4_v2std_cog_control aoy5_v2std_cog_control ///
     pre_v1std_cog_kinderprep mid_v1std_cog_kinderprep post_v1std_cog_kinderprep sl_v1std_cog_kinderprep aoy1_v1std_cog_kinderprep aoy2_v1std_cog_kinderprep aoy3_v1std_cog_kinderprep aoy4_v1std_cog_kinderprep aoy5_v1std_cog_kinderprep ///
	 pre_v2std_cog_kinderprep mid_v2std_cog_kinderprep post_v2std_cog_kinderprep sl_v2std_cog_kinderprep aoy1_v2std_cog_kinderprep aoy2_v2std_cog_kinderprep aoy3_v2std_cog_kinderprep aoy4_v2std_cog_kinderprep aoy5_v2std_cog_kinderprep ///
     pre_v1std_cog_pka mid_v1std_cog_pka post_v1std_cog_pka sl_v1std_cog_pka aoy1_v1std_cog_pka aoy2_v1std_cog_pka aoy3_v1std_cog_pka aoy4_v1std_cog_pka aoy5_v1std_cog_pka ///
	 pre_v2std_cog_pka mid_v2std_cog_pka post_v2std_cog_pka sl_v2std_cog_pka aoy1_v2std_cog_pka aoy2_v2std_cog_pka aoy3_v2std_cog_pka aoy4_v2std_cog_pka aoy5_v2std_cog_pka ///
     pre_v1std_cog_pkb mid_v1std_cog_pkb post_v1std_cog_pkb sl_v1std_cog_pkb aoy1_v1std_cog_pkb aoy2_v1std_cog_pkb aoy3_v1std_cog_pkb aoy4_v1std_cog_pkb aoy5_v1std_cog_pkb ///
	 pre_v2std_cog_pkb mid_v2std_cog_pkb post_v2std_cog_pkb sl_v2std_cog_pkb aoy1_v2std_cog_pkb aoy2_v2std_cog_pkb aoy3_v2std_cog_pkb aoy4_v2std_cog_pkb aoy5_v2std_cog_pkb ///
     pre_v1std_cog_preschool mid_v1std_cog_preschool post_v1std_cog_preschool sl_v1std_cog_preschool aoy1_v1std_cog_preschool aoy2_v1std_cog_preschool aoy3_v1std_cog_preschool aoy4_v1std_cog_preschool aoy5_v1std_cog_preschool ///
	 pre_v2std_cog_preschool mid_v2std_cog_preschool post_v2std_cog_preschool sl_v2std_cog_preschool aoy1_v2std_cog_preschool aoy2_v2std_cog_preschool aoy3_v2std_cog_preschool aoy4_v2std_cog_preschool aoy5_v2std_cog_preschool ///
     pre_v1std_cog_treated mid_v1std_cog_treated post_v1std_cog_treated sl_v1std_cog_treated aoy1_v1std_cog_treated aoy2_v1std_cog_treated aoy3_v1std_cog_treated aoy4_v1std_cog_treated aoy5_v1std_cog_treated ///
	 pre_v2std_cog_treated mid_v2std_cog_treated post_v2std_cog_treated sl_v2std_cog_treated aoy1_v2std_cog_treated aoy2_v2std_cog_treated aoy3_v2std_cog_treated aoy4_v2std_cog_treated aoy5_v2std_cog_treated /// 
     mispre_v1std_cog_cash mismid_v1std_cog_cash mispost_v1std_cog_cash missl_v1std_cog_cash misaoy1_v1std_cog_cash misaoy2_v1std_cog_cash misaoy3_v1std_cog_cash misaoy4_v1std_cog_cash misaoy5_v1std_cog_cash ///
	 mispre_v2std_cog_cash mismid_v2std_cog_cash mispost_v2std_cog_cash missl_v2std_cog_cash misaoy1_v2std_cog_cash misaoy2_v2std_cog_cash misaoy3_v2std_cog_cash misaoy4_v2std_cog_cash misaoy5_v2std_cog_cash ///
     mispre_v1std_cog_cogx mismid_v1std_cog_cogx mispost_v1std_cog_cogx missl_v1std_cog_cogx misaoy1_v1std_cog_cogx misaoy2_v1std_cog_cogx misaoy3_v1std_cog_cogx misaoy4_v1std_cog_cogx misaoy5_v1std_cog_cogx ///
	 mispre_v2std_cog_cogx mismid_v2std_cog_cogx mispost_v2std_cog_cogx missl_v2std_cog_cogx misaoy1_v2std_cog_cogx misaoy2_v2std_cog_cogx misaoy3_v2std_cog_cogx misaoy4_v2std_cog_cogx misaoy5_v2std_cog_cogx ///
     mispre_v1std_cog_college mismid_v1std_cog_college mispost_v1std_cog_college missl_v1std_cog_college misaoy1_v1std_cog_college misaoy2_v1std_cog_college misaoy3_v1std_cog_college misaoy4_v1std_cog_college misaoy5_v1std_cog_college ///
	 mispre_v2std_cog_college mismid_v2std_cog_college mispost_v2std_cog_college missl_v2std_cog_college misaoy1_v2std_cog_college misaoy2_v2std_cog_college misaoy3_v2std_cog_college misaoy4_v2std_cog_college misaoy5_v2std_cog_college ///
     mispre_v1std_cog_control mismid_v1std_cog_control mispost_v1std_cog_control missl_v1std_cog_control misaoy1_v1std_cog_control misaoy2_v1std_cog_control misaoy3_v1std_cog_control misaoy4_v1std_cog_control misaoy5_v1std_cog_control ///
	 mispre_v2std_cog_control mismid_v2std_cog_control mispost_v2std_cog_control missl_v2std_cog_control misaoy1_v2std_cog_control misaoy2_v2std_cog_control misaoy3_v2std_cog_control misaoy4_v2std_cog_control misaoy5_v2std_cog_control ///
     mispre_v1std_cog_kinderprep mismid_v1std_cog_kinderprep mispost_v1std_cog_kinderprep missl_v1std_cog_kinderprep misaoy1_v1std_cog_kinderprep misaoy2_v1std_cog_kinderprep misaoy3_v1std_cog_kinderprep misaoy4_v1std_cog_kinderprep misaoy5_v1std_cog_kinderprep ///
	 mispre_v2std_cog_kinderprep mismid_v2std_cog_kinderprep mispost_v2std_cog_kinderprep missl_v2std_cog_kinderprep misaoy1_v2std_cog_kinderprep misaoy2_v2std_cog_kinderprep misaoy3_v2std_cog_kinderprep misaoy4_v2std_cog_kinderprep misaoy5_v2std_cog_kinderprep ///
     mispre_v1std_cog_pka mismid_v1std_cog_pka mispost_v1std_cog_pka missl_v1std_cog_pka misaoy1_v1std_cog_pka misaoy2_v1std_cog_pka misaoy3_v1std_cog_pka misaoy4_v1std_cog_pka misaoy5_v1std_cog_pka ///
	 mispre_v2std_cog_pka mismid_v2std_cog_pka mispost_v2std_cog_pka missl_v2std_cog_pka misaoy1_v2std_cog_pka misaoy2_v2std_cog_pka misaoy3_v2std_cog_pka misaoy4_v2std_cog_pka misaoy5_v2std_cog_pka ///
     mispre_v1std_cog_pkb mismid_v1std_cog_pkb mispost_v1std_cog_pkb missl_v1std_cog_pkb misaoy1_v1std_cog_pkb misaoy2_v1std_cog_pkb misaoy3_v1std_cog_pkb misaoy4_v1std_cog_pkb misaoy5_v1std_cog_pkb ///
	 mispre_v2std_cog_pkb mismid_v2std_cog_pkb mispost_v2std_cog_pkb missl_v2std_cog_pkb misaoy1_v2std_cog_pkb misaoy2_v2std_cog_pkb misaoy3_v2std_cog_pkb misaoy4_v2std_cog_pkb misaoy5_v2std_cog_pkb /// 
     mispre_v1std_cog_preschool mismid_v1std_cog_preschool mispost_v1std_cog_preschool missl_v1std_cog_preschool misaoy1_v1std_cog_preschool misaoy2_v1std_cog_preschool misaoy3_v1std_cog_preschool misaoy4_v1std_cog_preschool misaoy5_v1std_cog_preschool ///
	 mispre_v2std_cog_preschool mismid_v2std_cog_preschool mispost_v2std_cog_preschool missl_v2std_cog_preschool misaoy1_v2std_cog_preschool misaoy2_v2std_cog_preschool misaoy3_v2std_cog_preschool misaoy4_v2std_cog_preschool misaoy5_v2std_cog_preschool ///
     mispre_v1std_cog_treated mismid_v1std_cog_treated mispost_v1std_cog_treated missl_v1std_cog_treated misaoy1_v1std_cog_treated misaoy2_v1std_cog_treated misaoy3_v1std_cog_treated misaoy4_v1std_cog_treated misaoy5_v1std_cog_treated /// 
	 mispre_v2std_cog_treated mismid_v2std_cog_treated mispost_v2std_cog_treated missl_v2std_cog_treated misaoy1_v2std_cog_treated misaoy2_v2std_cog_treated misaoy3_v2std_cog_treated misaoy4_v2std_cog_treated misaoy5_v2std_cog_treated ///  
	 pre_v1std_ncog_cash mid_v1std_ncog_cash post_v1std_ncog_cash sl_v1std_ncog_cash aoy1_v1std_ncog_cash aoy2_v1std_ncog_cash aoy3_v1std_ncog_cash aoy4_v1std_ncog_cash aoy5_v1std_ncog_cash ///
	 pre_v2std_ncog_cash mid_v2std_ncog_cash post_v2std_ncog_cash sl_v2std_ncog_cash aoy1_v2std_ncog_cash aoy2_v2std_ncog_cash aoy3_v2std_ncog_cash aoy4_v2std_ncog_cash aoy5_v2std_ncog_cash ///
     pre_v1std_ncog_cogx mid_v1std_ncog_cogx post_v1std_ncog_cogx sl_v1std_ncog_cogx aoy1_v1std_ncog_cogx aoy2_v1std_ncog_cogx aoy3_v1std_ncog_cogx aoy4_v1std_ncog_cogx aoy5_v1std_ncog_cogx ///
	 pre_v2std_ncog_cogx mid_v2std_ncog_cogx post_v2std_ncog_cogx sl_v2std_ncog_cogx aoy1_v2std_ncog_cogx aoy2_v2std_ncog_cogx aoy3_v2std_ncog_cogx aoy4_v2std_ncog_cogx aoy5_v2std_ncog_cogx ///
     pre_v1std_ncog_college mid_v1std_ncog_college post_v1std_ncog_college sl_v1std_ncog_college aoy1_v1std_ncog_college aoy2_v1std_ncog_college aoy3_v1std_ncog_college aoy4_v1std_ncog_college aoy5_v1std_ncog_college ///
	 pre_v2std_ncog_college mid_v2std_ncog_college post_v2std_ncog_college sl_v2std_ncog_college aoy1_v2std_ncog_college aoy2_v2std_ncog_college aoy3_v2std_ncog_college aoy4_v2std_ncog_college aoy5_v2std_ncog_college ///
     pre_v1std_ncog_control mid_v1std_ncog_control post_v1std_ncog_control sl_v1std_ncog_control aoy1_v1std_ncog_control aoy2_v1std_ncog_control aoy3_v1std_ncog_control aoy4_v1std_ncog_control aoy5_v1std_ncog_control ///
	 pre_v2std_ncog_control mid_v2std_ncog_control post_v2std_ncog_control sl_v2std_ncog_control aoy1_v2std_ncog_control aoy2_v2std_ncog_control aoy3_v2std_ncog_control aoy4_v2std_ncog_control aoy5_v2std_ncog_control ///
     pre_v1std_ncog_kinderprep mid_v1std_ncog_kinderprep post_v1std_ncog_kinderprep sl_v1std_ncog_kinderprep aoy1_v1std_ncog_kinderprep aoy2_v1std_ncog_kinderprep aoy3_v1std_ncog_kinderprep aoy4_v1std_ncog_kinderprep aoy5_v1std_ncog_kinderprep ///
	 pre_v2std_ncog_kinderprep mid_v2std_ncog_kinderprep post_v2std_ncog_kinderprep sl_v2std_ncog_kinderprep aoy1_v2std_ncog_kinderprep aoy2_v2std_ncog_kinderprep aoy3_v2std_ncog_kinderprep aoy4_v2std_ncog_kinderprep aoy5_v2std_ncog_kinderprep ///
     pre_v1std_ncog_pka mid_v1std_ncog_pka post_v1std_ncog_pka sl_v1std_ncog_pka aoy1_v1std_ncog_pka aoy2_v1std_ncog_pka aoy3_v1std_ncog_pka aoy4_v1std_ncog_pka aoy5_v1std_ncog_pka ///
	 pre_v2std_ncog_pka mid_v2std_ncog_pka post_v2std_ncog_pka sl_v2std_ncog_pka aoy1_v2std_ncog_pka aoy2_v2std_ncog_pka aoy3_v2std_ncog_pka aoy4_v2std_ncog_pka aoy5_v2std_ncog_pka ///
     pre_v1std_ncog_pkb mid_v1std_ncog_pkb post_v1std_ncog_pkb sl_v1std_ncog_pkb aoy1_v1std_ncog_pkb aoy2_v1std_ncog_pkb aoy3_v1std_ncog_pkb aoy4_v1std_ncog_pkb aoy5_v1std_ncog_pkb ///
	 pre_v2std_ncog_pkb mid_v2std_ncog_pkb post_v2std_ncog_pkb sl_v2std_ncog_pkb aoy1_v2std_ncog_pkb aoy2_v2std_ncog_pkb aoy3_v2std_ncog_pkb aoy4_v2std_ncog_pkb aoy5_v2std_ncog_pkb ///
     pre_v1std_ncog_preschool mid_v1std_ncog_preschool post_v1std_ncog_preschool sl_v1std_ncog_preschool aoy1_v1std_ncog_preschool aoy2_v1std_ncog_preschool aoy3_v1std_ncog_preschool aoy4_v1std_ncog_preschool aoy5_v1std_ncog_preschool ///
	 pre_v2std_ncog_preschool mid_v2std_ncog_preschool post_v2std_ncog_preschool sl_v2std_ncog_preschool aoy1_v2std_ncog_preschool aoy2_v2std_ncog_preschool aoy3_v2std_ncog_preschool aoy4_v2std_ncog_preschool aoy5_v2std_ncog_preschool ///
     pre_v1std_ncog_treated mid_v1std_ncog_treated post_v1std_ncog_treated sl_v1std_ncog_treated aoy1_v1std_ncog_treated aoy2_v1std_ncog_treated aoy3_v1std_ncog_treated aoy4_v1std_ncog_treated aoy5_v1std_ncog_treated ///
	 pre_v2std_ncog_treated mid_v2std_ncog_treated post_v2std_ncog_treated sl_v2std_ncog_treated aoy1_v2std_ncog_treated aoy2_v2std_ncog_treated aoy3_v2std_ncog_treated aoy4_v2std_ncog_treated aoy5_v2std_ncog_treated /// 
     mispre_v1std_ncog_cash mismid_v1std_ncog_cash mispost_v1std_ncog_cash missl_v1std_ncog_cash misaoy1_v1std_ncog_cash misaoy2_v1std_ncog_cash misaoy3_v1std_ncog_cash misaoy4_v1std_ncog_cash misaoy5_v1std_ncog_cash ///
	 mispre_v2std_ncog_cash mismid_v2std_ncog_cash mispost_v2std_ncog_cash missl_v2std_ncog_cash misaoy1_v2std_ncog_cash misaoy2_v2std_ncog_cash misaoy3_v2std_ncog_cash misaoy4_v2std_ncog_cash misaoy5_v2std_ncog_cash ///
     mispre_v1std_ncog_cogx mismid_v1std_ncog_cogx mispost_v1std_ncog_cogx missl_v1std_ncog_cogx misaoy1_v1std_ncog_cogx misaoy2_v1std_ncog_cogx misaoy3_v1std_ncog_cogx misaoy4_v1std_ncog_cogx misaoy5_v1std_ncog_cogx ///
	 mispre_v2std_ncog_cogx mismid_v2std_ncog_cogx mispost_v2std_ncog_cogx missl_v2std_ncog_cogx misaoy1_v2std_ncog_cogx misaoy2_v2std_ncog_cogx misaoy3_v2std_ncog_cogx misaoy4_v2std_ncog_cogx misaoy5_v2std_ncog_cogx ///
     mispre_v1std_ncog_college mismid_v1std_ncog_college mispost_v1std_ncog_college missl_v1std_ncog_college misaoy1_v1std_ncog_college misaoy2_v1std_ncog_college misaoy3_v1std_ncog_college misaoy4_v1std_ncog_college misaoy5_v1std_ncog_college ///
	 mispre_v2std_ncog_college mismid_v2std_ncog_college mispost_v2std_ncog_college missl_v2std_ncog_college misaoy1_v2std_ncog_college misaoy2_v2std_ncog_college misaoy3_v2std_ncog_college misaoy4_v2std_ncog_college misaoy5_v2std_ncog_college ///
     mispre_v1std_ncog_control mismid_v1std_ncog_control mispost_v1std_ncog_control missl_v1std_ncog_control misaoy1_v1std_ncog_control misaoy2_v1std_ncog_control misaoy3_v1std_ncog_control misaoy4_v1std_ncog_control misaoy5_v1std_ncog_control ///
	 mispre_v2std_ncog_control mismid_v2std_ncog_control mispost_v2std_ncog_control missl_v2std_ncog_control misaoy1_v2std_ncog_control misaoy2_v2std_ncog_control misaoy3_v2std_ncog_control misaoy4_v2std_ncog_control misaoy5_v2std_ncog_control ///
     mispre_v1std_ncog_kinderprep mismid_v1std_ncog_kinderprep mispost_v1std_ncog_kinderprep missl_v1std_ncog_kinderprep misaoy1_v1std_ncog_kinderprep misaoy2_v1std_ncog_kinderprep misaoy3_v1std_ncog_kinderprep misaoy4_v1std_ncog_kinderprep misaoy5_v1std_ncog_kinderprep ///
	 mispre_v2std_ncog_kinderprep mismid_v2std_ncog_kinderprep mispost_v2std_ncog_kinderprep missl_v2std_ncog_kinderprep misaoy1_v2std_ncog_kinderprep misaoy2_v2std_ncog_kinderprep misaoy3_v2std_ncog_kinderprep misaoy4_v2std_ncog_kinderprep misaoy5_v2std_ncog_kinderprep ///
     mispre_v1std_ncog_pka mismid_v1std_ncog_pka mispost_v1std_ncog_pka missl_v1std_ncog_pka misaoy1_v1std_ncog_pka misaoy2_v1std_ncog_pka misaoy3_v1std_ncog_pka misaoy4_v1std_ncog_pka misaoy5_v1std_ncog_pka ///
	 mispre_v2std_ncog_pka mismid_v2std_ncog_pka mispost_v2std_ncog_pka missl_v2std_ncog_pka misaoy1_v2std_ncog_pka misaoy2_v2std_ncog_pka misaoy3_v2std_ncog_pka misaoy4_v2std_ncog_pka misaoy5_v2std_ncog_pka ///
     mispre_v1std_ncog_pkb mismid_v1std_ncog_pkb mispost_v1std_ncog_pkb missl_v1std_ncog_pkb misaoy1_v1std_ncog_pkb misaoy2_v1std_ncog_pkb misaoy3_v1std_ncog_pkb misaoy4_v1std_ncog_pkb misaoy5_v1std_ncog_pkb ///
	 mispre_v2std_ncog_pkb mismid_v2std_ncog_pkb mispost_v2std_ncog_pkb missl_v2std_ncog_pkb misaoy1_v2std_ncog_pkb misaoy2_v2std_ncog_pkb misaoy3_v2std_ncog_pkb misaoy4_v2std_ncog_pkb misaoy5_v2std_ncog_pkb ///
     mispre_v1std_ncog_preschool mismid_v1std_ncog_preschool mispost_v1std_ncog_preschool missl_v1std_ncog_preschool misaoy1_v1std_ncog_preschool misaoy2_v1std_ncog_preschool misaoy3_v1std_ncog_preschool misaoy4_v1std_ncog_preschool misaoy5_v1std_ncog_preschool ///
	 mispre_v2std_ncog_preschool mismid_v2std_ncog_preschool mispost_v2std_ncog_preschool missl_v2std_ncog_preschool misaoy1_v2std_ncog_preschool misaoy2_v2std_ncog_preschool misaoy3_v2std_ncog_preschool misaoy4_v2std_ncog_preschool misaoy5_v2std_ncog_preschool ///
     mispre_v1std_ncog_treated mismid_v1std_ncog_treated mispost_v1std_ncog_treated missl_v1std_ncog_treated misaoy1_v1std_ncog_treated misaoy2_v1std_ncog_treated misaoy3_v1std_ncog_treated misaoy4_v1std_ncog_treated misaoy5_v1std_ncog_treated ///
	 mispre_v2std_ncog_treated mismid_v2std_ncog_treated mispost_v2std_ncog_treated missl_v2std_ncog_treated misaoy1_v2std_ncog_treated misaoy2_v2std_ncog_treated misaoy3_v2std_ncog_treated misaoy4_v2std_ncog_treated misaoy5_v2std_ncog_treated /// 
	 pre_mt_cash mid_mt_cash post_mt_cash sl_mt_cash aoy1_mt_cash aoy2_mt_cash aoy3_mt_cash aoy4_mt_cash aoy5_mt_cash ///
	 pre_mt_college mid_mt_college post_mt_college sl_mt_college aoy1_mt_college aoy2_mt_college aoy3_mt_college aoy4_mt_college aoy5_mt_college ///
	 pre_mt_cogx mid_mt_cogx post_mt_cogx sl_mt_cogx aoy1_mt_cogx aoy2_mt_cogx aoy3_mt_cogx aoy4_mt_cogx aoy5_mt_cogx ///
	 pre_mt_control mid_mt_control post_mt_control sl_mt_control aoy1_mt_control aoy2_mt_control aoy3_mt_control aoy4_mt_control aoy5_mt_control ///
	 pre_mt_kinderprep mid_mt_kinderprep post_mt_kinderprep sl_mt_kinderprep aoy1_mt_kinderprep aoy2_mt_kinderprep aoy3_mt_kinderprep aoy4_mt_kinderprep aoy5_mt_kinderprep ///
	 pre_mt_pka mid_mt_pka post_mt_pka sl_mt_pka aoy1_mt_pka aoy2_mt_pka aoy3_mt_pka aoy4_mt_pka aoy5_mt_pka ///
	 pre_mt_pkb mid_mt_pkb post_mt_pkb sl_mt_pkb aoy1_mt_pkb aoy2_mt_pkb aoy3_mt_pkb aoy4_mt_pkb aoy5_mt_pkb ///
	 pre_mt_preschool mid_mt_preschool post_mt_preschool sl_mt_preschool aoy1_mt_preschool aoy2_mt_preschool aoy3_mt_preschool aoy4_mt_preschool aoy5_mt_preschool ///
	 pre_mt_treated mid_mt_treated post_mt_treated sl_mt_treated aoy1_mt_treated aoy2_mt_treated aoy3_mt_treated aoy4_mt_treated aoy5_mt_treated ///
	 pre_mc_cash mid_mc_cash post_mc_cash sl_mc_cash aoy1_mc_cash aoy2_mc_cash aoy3_mc_cash aoy4_mc_cash aoy5_mc_cash ///
	 pre_mc_college mid_mc_college post_mc_college sl_mc_college aoy1_mc_college aoy2_mc_college aoy3_mc_college aoy4_mc_college aoy5_mc_college ///
	 pre_mc_cogx mid_mc_cogx post_mc_cogx sl_mc_cogx aoy1_mc_cogx aoy2_mc_cogx aoy3_mc_cogx aoy4_mc_cogx aoy5_mc_cogx ///
	 pre_mc_control mid_mc_control post_mc_control sl_mc_control aoy1_mc_control aoy2_mc_control aoy3_mc_control aoy4_mc_control aoy5_mc_control ///
	 pre_mc_kinderprep mid_mc_kinderprep post_mc_kinderprep sl_mc_kinderprep aoy1_mc_kinderprep aoy2_mc_kinderprep aoy3_mc_kinderprep aoy4_mc_kinderprep aoy5_mc_kinderprep ///
	 pre_mc_pka mid_mc_pka post_mc_pka sl_mc_pka aoy1_mc_pka aoy2_mc_pka aoy3_mc_pka aoy4_mc_pka aoy5_mc_pka ///
	 pre_mc_pkb mid_mc_pkb post_mc_pkb sl_mc_pkb aoy1_mc_pkb aoy2_mc_pkb aoy3_mc_pkb aoy4_mc_pkb aoy5_mc_pkb ///
	 pre_mc_preschool mid_mc_preschool post_mc_preschool sl_mc_preschool aoy1_mc_preschool aoy2_mc_preschool aoy3_mc_preschool aoy4_mc_preschool aoy5_mc_preschool ///
	 pre_mc_treated mid_mc_treated post_mc_treated sl_mc_treated aoy1_mc_treated aoy2_mc_treated aoy3_mc_treated aoy4_mc_treated aoy5_mc_treated ///
	 pre_num_in_treat mid_num_in_treat post_num_in_treat sl_num_in_treat aoy1_num_in_treat aoy2_num_in_treat aoy3_num_in_treat aoy4_num_in_treat aoy5_num_in_treat,  by (origin_gecc_id randomization_ori) 






	 
	reshape long @_cash @_cogx @_college @_control @_kinderprep @_pka @_pkb @_preschool @_treated ///
			@_v1std_cog_cash @_v1std_cog_cogx @_v1std_cog_college @_v1std_cog_control @_v1std_cog_kinderprep @_v1std_cog_pka @_v1std_cog_pkb @_v1std_cog_preschool @_v1std_cog_treated ///
			@_v2std_cog_cash @_v2std_cog_cogx @_v2std_cog_college @_v2std_cog_control @_v2std_cog_kinderprep @_v2std_cog_pka @_v2std_cog_pkb @_v2std_cog_preschool @_v2std_cog_treated ///
			mis@_v1std_cog_cash mis@_v1std_cog_cogx mis@_v1std_cog_college mis@_v1std_cog_control mis@_v1std_cog_kinderprep mis@_v1std_cog_pka mis@_v1std_cog_pkb mis@_v1std_cog_preschool mis@_v1std_cog_treated ///
			mis@_v2std_cog_cash mis@_v2std_cog_cogx mis@_v2std_cog_college mis@_v2std_cog_control mis@_v2std_cog_kinderprep mis@_v2std_cog_pka mis@_v2std_cog_pkb mis@_v2std_cog_preschool mis@_v2std_cog_treated ///
			@_v1std_ncog_cash @_v1std_ncog_cogx @_v1std_ncog_college @_v1std_ncog_control @_v1std_ncog_kinderprep @_v1std_ncog_pka @_v1std_ncog_pkb @_v1std_ncog_preschool @_v1std_ncog_treated ///
			@_v2std_ncog_cash @_v2std_ncog_cogx @_v2std_ncog_college @_v2std_ncog_control @_v2std_ncog_kinderprep @_v2std_ncog_pka @_v2std_ncog_pkb @_v2std_ncog_preschool @_v2std_ncog_treated ///
			mis@_v1std_ncog_cash mis@_v1std_ncog_cogx mis@_v1std_ncog_college mis@_v1std_ncog_control mis@_v1std_ncog_kinderprep mis@_v1std_ncog_pka mis@_v1std_ncog_pkb mis@_v1std_ncog_preschool mis@_v1std_ncog_treated ///
			mis@_v2std_ncog_cash mis@_v2std_ncog_cogx mis@_v2std_ncog_college mis@_v2std_ncog_control mis@_v2std_ncog_kinderprep mis@_v2std_ncog_pka mis@_v2std_ncog_pkb mis@_v2std_ncog_preschool mis@_v2std_ncog_treated ///
			@_mt_cash @_mt_cogx @_mt_college @_mt_control @_mt_kinderprep @_mt_pka @_mt_pkb @_mt_preschool @_mt_treated ///
			@_mc_cash @_mc_cogx @_mc_college @_mc_control @_mc_kinderprep @_mc_pka @_mc_pkb @_mc_preschool @_mc_treated @_num_in_treat, i(origin_gecc_id randomization_ori) j(test) s
			
	rename _* *

	foreach version in v1 v2 {
	foreach score in cog ncog {
	*av_score_control is the average score of all control neighbors for whom we have a score
	gen `version'`score'_contr =  `version'std_`score'_control / (control - mis_`version'std_`score'_control) 
	*av_score_treated is the average score of all treated neighbors for whom we have a score
	gen `version'`score'_treat = `version'std_`score'_treated / (treated - mis_`version'std_`score'_treated)
	*av_score_notkindertreated is the average score of all treated neighbors for whom we have a score except for kinderprep
	gen `version'`score'_nktreat = (`version'std_`score'_treated - `version'std_`score'_kinderprep)/ (treated - kinderprep - mis_`version'std_`score'_treated + mis_`version'std_`score'_kinderprep)
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen `version'`score'_`treat' =  `version'std_`score'_`treat' / (`treat' - mis_`version'std_`score'_`treat')
	}

	
	

	}
	}

	*av_month_incontrol is the average number months certain types of neighbors have spent in control : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_incontr_contr = mc_control/control
	gen month_incontr_treat = mc_treated/treated
	gen month_incontr_nktreat = (mc_treated - mc_kinderprep)/ (treated - kinderprep)		
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_incontr_`treat' =  mc_`treat'/`treat'
	}
	*av_month_intreat is the average number months certain types of neighbors have spent in treatment : this is defined for
	*control neighbors, treated neighbors, and treated without kinderprep
	gen month_intreat_treat = mt_treated/treated
	gen month_intreat_nktreat = (mt_treated - mt_kinderprep)/ (treated - kinderprep)
	gen month_intreat_contr = mt_control/control
	*broken down by type of treatment
	foreach treat in cash cogx college kinderprep pka pkb preschool {
	gen month_intreat_`treat' =  mt_`treat'/`treat'
	}
	
	

	keep origin_gecc_id randomization_ori test cash cogx college control kinderprep pka pkb preschool treated ///
	v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash ///
	v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx ///
	v1cog_college v1ncog_college v2cog_college v2ncog_college ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ///
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_nktreat month_intreat_contr ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat
	

	foreach var in cash cogx college control kinderprep pka pkb preschool treated v1cog_contr v1cog_treat v1cog_nktreat v1ncog_contr v1ncog_treat v1ncog_nktreat v2cog_contr v2cog_treat v2cog_nktreat v2ncog_contr v2ncog_treat v2ncog_nktreat /// 
	month_incontr_contr month_incontr_treat month_incontr_nktreat month_intreat_treat month_intreat_contr month_intreat_nktreat  ///
	v1cog_cash v1ncog_cash v2cog_cash v2ncog_cash v1cog_cogx v1ncog_cogx v2cog_cogx v2ncog_cogx v1cog_college v1ncog_college v2cog_college v2ncog_college  ///
	v1cog_kinderprep v1ncog_kinderprep v2cog_kinderprep v2ncog_kinderprep  ///
	v1cog_pka v1ncog_pka v2cog_pka v2ncog_pka  ///
	v1cog_pkb v1ncog_pkb v2cog_pkb v2ncog_pkb ////
	v1cog_preschool v1ncog_preschool v2cog_preschool v2ncog_preschool ///
	month_incontr_cash month_incontr_college month_incontr_cogx month_incontr_kinderprep month_incontr_preschool month_incontr_pka  month_incontr_pkb ///
	month_intreat_cash month_intreat_college month_intreat_cogx month_intreat_kinderprep month_intreat_preschool month_intreat_pka  month_intreat_pkb num_in_treat {
		rename `var' `var'_`d'_w
	}
		
		save neighbors_white_circle_`d', replace
}

**Merging all distances

clear all
cd "$repository/data_sets/generated"

foreach name in m f b h w o n {
clear all
cd "$repository/data_sets/generated"
use neighbors_`name'_circle_500

foreach x in 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000 {
merge 1:1 origin_gecc_id test randomization_ori using neighbors_`name'_circle_`x'
drop _merge
}

rename origin_gecc_id child
rename randomization_ori year
tostring year, replace

foreach var of varlist cash_500_`name'-treated_20000_`name' {
replace `var' = 0 if `var' == .
}

save merged_`name'_neigh_count, replace

}




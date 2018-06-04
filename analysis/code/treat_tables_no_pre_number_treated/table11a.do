**Table 11a: Spillover from neighbors of own race and other race


clear all

cd "$repository/data_sets/generated"

use table34_unique_data_clean

*Dropping those kids for whom we lack addresses
foreach kid in 1116 1130 2080 2526 2565 2687 3359 3527 3909 3917 3930 4079 4409 4913 {

drop if child == `kid'
}


***********************************************************************************
**If want to reproduce table restricting sample to control kids, add the code below


keep  if (T == 1 & first_random == 1) | (CT== 1 & second_random == 1) | (TT == 1&  first_random == 1) | (TTT == 1&  first_random == 1) |(K==1 & first_random  ==1)| (CK==1& second_random ==1)


***********************************************************************************


**Merging with number of neighbors of different races Hispanic

foreach neighbor in merged_hispanic_neigh_count merged_black_neigh_count merged_missing_race_neigh_count merged_white_neigh_count merged_other_race_neigh_count merged_neigh_count {

merge 1:1 child test year using `neighbor'
**Drop observations not pertaining to our analytical sample
drop if _merge == 2
drop _merge
}

**Defining Key Explanatory Variable
foreach distance in 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 {


gen number_treated_`distance'_ownrace = treated_`distance'_h if race == "Hispanic"
gen number_treated_`distance'_otherrace = treated_`distance'_b + treated_`distance'_n + treated_`distance'_o + treated_`distance'_w if race == "Hispanic"

replace number_treated_`distance'_ownrace = treated_`distance'_b if race == "African American"
replace number_treated_`distance'_otherrace = treated_`distance'_h + treated_`distance'_n + treated_`distance'_o + treated_`distance'_w if race == "African American"

replace number_treated_`distance'_ownrace = treated_`distance'_w if race == "White Non-Hispanic"
replace number_treated_`distance'_otherrace = treated_`distance'_b + treated_`distance'_n + treated_`distance'_o + treated_`distance'_h if race == "White Non-Hispanic"

replace number_treated_`distance'_ownrace = treated_`distance'_o if race == "Other"
replace number_treated_`distance'_otherrace = treated_`distance'_b + treated_`distance'_n + treated_`distance'_w + treated_`distance'_h if race == "Other"
}

**Generated Num Total Neighbors
foreach distance in 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 {
gen total_neigh_`distance' = treated_`distance' + control_`distance'
}

**Merging with distance to school and block group variable
foreach file in Relevant_DistToSchool_1 Relevant_DistToSchool_2 Relevant_censusblock_checc {
merge m:1 child using `file'
*drop if _merge == 2
drop _merge
} 

	
replace age_pre = . if age_pre == 0	

**Creating factor variables
egen gender_num = group(gender)
egen race_num = group(race)
egen blockgroup_num = group(blockgroup)
destring year, replace


drop if test == "pre"

**Setting up Time Dimension
gen test_num = 1 if test == "mid"
replace test_num = 2 if test == "post"
replace test_num = 3 if test == "sl"
replace test_num = 4 if test == "aoy1"
replace test_num = 5 if test == "aoy2"
replace test_num = 6 if test == "aoy3"
replace test_num = 7 if test == "aoy4"

sort child test_num
xtset child test_num	
	
local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000"
local num : list sizeof local(distance)
local i = 1


file open file9 using "$repository/analysis/tables/treat_tables_no_pre_number_treated/table11a_races_own_other_race.tex", replace write


file write file9 "\documentclass[11pt]{article}"
file write file9 _n "\usepackage{booktabs, multicol, multirow}"
file write file9 _n "\usepackage{caption}"
file write file9 _n "\usepackage{adjustbox}"
file write file9 _n "\usepackage[flushleft]{threeparttable}"
file write file9 _n	"\begin{document}"

file write file9 _n "\begin{table}[h]\centering\small" 

file write file9 _n "\caption{Spillover Own Race and Other Race} \begin{threeparttable}"
file write file9 _n "\renewcommand{\arraystretch}{.85}"
file write file9 _n "\begin{adjustbox}{width = \textwidth}"
file write file9 _n "\begin{tabular}{lcc|cc|cc}"
file write file9 _n "\toprule"
file write file9 _n "\midrule"
file write file9 _n "& \multicolumn{2}{c}{All Races} & \multicolumn{2}{c}{Subsample of Blacks} & \multicolumn{2}{c}{Subsample of Hispanics} \\"
file write file9 _n "& Cognitive Score & Non-Cognitive Score & Cognitive Score & Non-Cognitive Score & Cognitive Score & Non-Cognitive Score \\"
file write file9 _n " $ d $ (meters)& (1) & (2) & (3) & (4) & (5) & (6) \\"
file write file9 _n "\midrule"

file write file9 _n "& \multicolumn{6}{c}{}\\"
file write file9 _n "& \multicolumn{6}{c}{Spillover from Own Race Neighbors}\\ \cline{2-7}"

**Storing Coefficients - Neighbors Own Race

foreach d of local distance  {	
	local j = 1
	foreach assess in cog ncog { 

	***FIXED EFFECTS - ALL RACES
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1, fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_ownrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	
	***FIXED EFFECTS - ONLY SUBSAMPLE BLACKS
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1 & race == "African American", fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_ownrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	***FIXED EFFECTS - ONLY SUBSAMPLE HISPANICS
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1 & race == "Hispanic", fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_ownrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_ownrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	}
	

	file write file9 _n "\multirow{2}{*}{`d'} & `item_1_`d'' & `item_4_`d'' & `item_2_`d''  & `item_5_`d''  & `item_3_`d'' & `item_6_`d''    \\"
	file write file9 _n "& (`se_1_`d'') & (`se_4_`d'') & (`se_2_`d'')  & (`se_5_`d'') & (`se_3_`d'') & (`se_6_`d'')  \\"

	if `i' < `num' {
		file write file9 _n "& & & & & & \\"	
	}
	local i = `i' + 1
}	


local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000"
local num : list sizeof local(distance)
local i = 1



file write file9 _n "& \multicolumn{6}{c}{}\\"
file write file9 _n "& \multicolumn{6}{c}{Spillover from Other Race Neighbors}\\ \cline{2-7}"


**Storing Coefficients - Neighbors Other Race

foreach d of local distance  {	
	local j = 1
	foreach assess in cog ncog { 

	***FIXED EFFECTS - ALL RACES
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1, fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_otherrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	
	***FIXED EFFECTS - ONLY SUBSAMPLE BLACKS
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1 & race == "African American", fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_otherrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	***FIXED EFFECTS - ONLY SUBSAMPLE HISPANICS
	quietly xtreg std_`assess' number_treated_`d'_ownrace  number_treated_`d'_otherrace total_neigh_`d' i.test_num  if has_`assess' == 1 & race == "Hispanic", fe cluster(child) 
	
	matrix d = r(table) 

	*adding stars
		if d[4,1] < 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "**"
		}	
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc") + "*"
		}
		else {
			local item_`j'_`d' = string(round(_b[number_treated_`d'_otherrace], .0001), "%13.0gc")
		}		
		
		local se_`j'_`d' = string(round(_se[number_treated_`d'_otherrace], .0001), "%13.0gc")
		
		local j = `j' + 1

	}
	

	file write file9 _n "\multirow{2}{*}{`d'} & `item_1_`d'' & `item_4_`d'' & `item_2_`d''  & `item_5_`d''  & `item_3_`d'' & `item_6_`d''    \\"
	file write file9 _n "& (`se_1_`d'') & (`se_4_`d'') & (`se_2_`d'')  & (`se_5_`d'') & (`se_3_`d'') & (`se_6_`d'')  \\"

	if `i' < `num' {
		file write file9 _n "& & & & & & \\"	
	}
	local i = `i' + 1
}
	
file write file9 _n "\midrule"
file write file9 _n "\bottomrule"
file write file9 _n "\end{tabular}"
file write file9 _n "\end{adjustbox}"
file write file9 _n "\begin{tablenotes}"
file write file9 _n "\footnotesize"

file write file9 _n "\item \textit{Notes:} TBA"
file write file9 _n "\item *** p$<$0.01, ** p$<$0.05, * p$<$0.1"
file write file9 _n "\end{tablenotes}"
file write file9 _n "\end{threeparttable}"
file write file9 _n "} \end{table}"

file write file9 _n "\end{document}"

file close file9

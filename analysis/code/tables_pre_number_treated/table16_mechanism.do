***Create Table 16 : Kinder vs. Parent Treated********

clear all

cd "$repository/data_sets/generated"

use table34_unique_data_clean

*Dropping those kids for whom we lack addresses
foreach kid in 1116 1130 2080 2526 2565 2687 3359 3527 3909 3917 3930 4079 4409 4913 {

drop if child == `kid'
}

***********************************************************************************
**If want to reproduce table restricting sample to control kids, add the code below


keep if (C == 1 & first_random == 1) | (CC == 1 & first_random == 1) | (CT_pretreat == 1) | (CK_prekinder == 1)

***********************************************************************************

**Merging with number of neighbors by rings

merge 1:1 child test year using merged_neigh_count

**Keeping the observations pertaining to our relevant sample
keep if _merge == 3

drop _merge

**Defining Percent Parent Treated and Percent Child Treated
foreach d in 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000 {
gen percent_parent_treated_`d' = ((cash_`d'+ college_`d') / (treated_`d' + control_`d'))*100
gen percent_child_treated_`d' = ((cogx_`d' + preschool_`d' + kinderprep_`d' + pka_`d' + pkb_`d')/ (treated_`d' + control_`d'))*100
}

**Generated Num Total Neighbors
foreach distance in 500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000 {
gen total_parent_neigh_`distance' = cash_`distance' + college_`distance'
gen total_child_neigh_`distance' = cogx_`distance' + preschool_`distance' + kinderprep_`distance' + pka_`distance' + pkb_`distance'
gen total_neigh_`distance' = control_`distance' + treated_`distance'
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

**Setting up Time Dimension
gen test_num = 0 if test == "pre"
replace test_num = 1 if test == "mid"
replace test_num = 2 if test == "post"
replace test_num = 3 if test == "sl"
replace test_num = 4 if test == "aoy1"
replace test_num = 5 if test == "aoy2"
replace test_num = 6 if test == "aoy3"
replace test_num = 7 if test == "aoy4"

sort child test_num
xtset child test_num	
	

local distance "500 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000 15000 20000"
local num : list sizeof local(distance)
local i = 1


file open file13 using "$repository/analysis/tables/tables_pre_number_treated/table16_mechanism.tex", replace write


file write file13 _n "\documentclass[11pt]{article}"
file write file13 _n "\usepackage{booktabs, multicol, multirow}"
file write file13 _n "\usepackage{caption}"
file write file13 _n "\usepackage{adjustbox}"
file write file13 _n "\usepackage[flushleft]{threeparttable}"
file write file13 _n	"\begin{document}"

file write file13 _n "\begin{table}[H]\centering \caption{The Effect from Parent vs. Child Programs}"
file write file13 _n "\begin{adjustbox}{totalheight = \textheight}"
file write file13 _n "\begin{threeparttable}"
file write file13 _n "\begin{tabular}{cc|c}"
file write file13 _n "\toprule"
file write file13 _n "\midrule"
file write file13 _n "& \multicolumn{1}{c}{Cognitive Scores} & \multicolumn{1}{c}{Non-cognitive Scores}\\ "
file write file13 _n "& Fixed Effect & Fixed Effect\\"
file write file13 _n "Distance & (1) & (2) \\"
file write file13 _n "\midrule"


**Running mechanism regressions	


foreach d of local distance  {	
	local j = 1
	foreach assess in cog ncog {

	***FIXED EFFECTS
	quietly xtreg std_`assess' total_parent_neigh_`d' total_child_neigh_`d' total_neigh_`d' i.test_num if has_`assess' == 1, fe cluster(child) 
	
	matrix d = r(table) 

		*adding stars for parent effect
		if d[4,1] < 0.01 {
			local item_p`j'_`d' = string(round(_b[total_parent_neigh_`d'], .0001), "%13.0gc") + "***"
		}
		else if d[4,1] < 0.05 & d[4,1] >= 0.01 {
			local item_p`j'_`d' = string(round(_b[total_parent_neigh_`d'], .0001), "%13.0gc") + "**"
		}
		else if d[4,1] < 0.1 & d[4,1] >= 0.05 {
			local item_p`j'_`d' = string(round(_b[total_parent_neigh_`d'], .0001), "%13.0gc") + "*"
		}
		else {
			local item_p`j'_`d' = string(round(_b[total_parent_neigh_`d'], .0001), "%13.0gc")
		}		
		
		local se_p`j'_`d' = string(round(_se[total_parent_neigh_`d'], .0001), "%13.0gc")

		*adding stars for child effect
		if d[4,2] < 0.01 {
			local item_c`j'_`d' = string(round(_b[total_child_neigh_`d'], .0001), "%13.0gc") + "***"
		}
		else if d[4,2] < 0.05 & d[4,2] >= 0.01 {
			local item_c`j'_`d' = string(round(_b[total_child_neigh_`d'], .0001), "%13.0gc") + "**"
		}
		else if d[4,2] < 0.1 & d[4,2] >= 0.05 {
			local item_c`j'_`d' = string(round(_b[total_child_neigh_`d'], .0001), "%13.0gc") + "*"
		}
		else {
			local item_c`j'_`d' = string(round(_b[total_child_neigh_`d'], .0001), "%13.0gc")
		}		
		
		local se_c`j'_`d' = string(round(_se[total_child_neigh_`d'], .0001), "%13.0gc")

		
		local j = `j' + 1

	}

file write file13 _n "$P^{Parent}_{i,t,`d'}$ & `item_p1_`d'' & `item_p2_`d'' \\"
file write file13 _n "& (`se_p1_`d'') & (`se_p2_`d'') \\"
file write file13 _n "$P^{Child}_{i,t,`d'}$ & `item_c1_`d'' & `item_c2_`d'' \\"
file write file13 _n "& (`se_c1_`d'') & (`se_c2_`d'') \\"

	if `i' < `num' {
		file write file13 _n "& & \\"	
	}
	local i = `i' + 1
}	
	
file write file13 _n "\midrule"
file write file13 _n "\bottomrule"
file write file13 _n "\end{tabular}"
file write file13 _n "\begin{tablenotes}"
file write file13 _n "\footnotesize"

file write file13 _n "\item \textit{Notes:} The point estimates from the effect of a 1\% increase in the share of neighbors in which parents have been treated and 1\% increase in the share of treated neighbors in which the child has been treated directly."
file write file13 _n "\item Robust standard errors, clustered at the individual level in parentheses"
file write file13 _n "\item *** p$<$0.01, ** p$<$0.05, * p$<$0.1"
file write file13 _n "\end{tablenotes}"
file write file13 _n "\end{threeparttable}"
file write file13 _n "\end{adjustbox}"
file write file13 _n "} \end{table}"

file write file13 _n "\end{document}"

file close file13



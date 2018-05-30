** MERGING DATA SET FOR TABLES 5, 6 and ABOVE on the TEACHER EASE DATA

clear all

cd "$repository/data_sets/generated"

use table56_unique_data_clean

**Merging with teacher ease data

merge 1:1 child test year using neighbor_class_multiple_years

save teacherease_merged_table56, replace

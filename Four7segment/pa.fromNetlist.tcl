
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Four7segment -dir "C:/Users/USER/Desktop/New folder/Four7segment/planAhead_run_2" -part xc3s200ft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/USER/Desktop/New folder/Four7segment/FourSegment.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/USER/Desktop/New folder/Four7segment} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "FourSegment.ucf" [current_fileset -constrset]
add_files [list {FourSegment.ucf}] -fileset [get_property constrset [current_run]]
link_design

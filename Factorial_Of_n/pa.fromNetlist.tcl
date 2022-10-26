
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name Factorial_Of_n -dir "C:/Users/USER/Desktop/New folder/Factorial_Of_n/planAhead_run_1" -part xc3s200ft256-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/USER/Desktop/New folder/Factorial_Of_n/Top_Module.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/USER/Desktop/New folder/Factorial_Of_n} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "Top_Module.ucf" [current_fileset -constrset]
add_files [list {Top_Module.ucf}] -fileset [get_property constrset [current_run]]
link_design

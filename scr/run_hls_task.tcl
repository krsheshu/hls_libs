#------------------------------------------------------------------
# Setting project paths and output directory
#------------------------------------------------------------------

set   PROJECT_NAME              $::env(PROJECT_NAME)
set   DEV_PARTNAME              $::env(DEV_PARTNAME)
set   SOLUTION_NAME             $::env(SOLUTION_NAME)

set   HLS_EXEC                  $::env(HLS_EXEC)

set   TARGET_CLOCK_PERIOD_NS    $::env(TARGET_CLOCK_PERIOD_NS)
set   DIRECTIVE_TCL_FILE        $::env(DIRECTIVE_TCL_FILE)

#------------------------------------------------------------------
# Creating the Project
#------------------------------------------------------------------

open_project                    ${PROJECT_NAME}

#------------------------------------------------------------------
# Open and Configure the Solution, apply directives
#------------------------------------------------------------------

open_solution                   ${SOLUTION_NAME}
set_part                        ${DEV_PARTNAME}

create_clock  -period           ${TARGET_CLOCK_PERIOD_NS}

source                          ${DIRECTIVE_TCL_FILE}

#------------------------------------------------------------------
# Run Simulate
#------------------------------------------------------------------
if { ${HLS_EXEC} == 0 } {
  csim_design
}

#------------------------------------------------------------------
# Run Synthesize
#------------------------------------------------------------------
if { ${HLS_EXEC} == 1 } {
  csynth_design
}

#------------------------------------------------------------------
# Run Synthesize, RTL Cosim
#------------------------------------------------------------------
if { ${HLS_EXEC} == 2 } {
  cosim_design
}

#------------------------------------------------------------------
# Run Synthesize, RTL Cosim
#------------------------------------------------------------------
if { ${HLS_EXEC} == 3 } {
  export_design
}


#------------------------------------------------------------------
# Done!
#------------------------------------------------------------------
exit

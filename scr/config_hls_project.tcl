#------------------------------------------------------------------
# Setting project paths and output directory
#------------------------------------------------------------------

set   PROJECT_NAME				      $::env(PROJECT_NAME)
set   DEV_PARTNAME            	$::env(DEV_PARTNAME)
set   PROJECT_ROOT_DIR        	$::env(PROJECT_ROOT_DIR)

set   SOLUTION_NAME           	$::env(SOLUTION_NAME)
set   SOLUTION_ROOT_DIR       	$::env(SOLUTION_ROOT_DIR)
set   SRC_DIR                 	$::env(SRC_DIR)
set   SRC_FILES               	$::env(SRC_FILES)
set	  TOP_LEVEL_FUNCTION      	$::env(TOP_LEVEL_FUNCTION)

set	  TARGET_CLOCK_PERIOD_NS  	$::env(TARGET_CLOCK_PERIOD_NS)
set	  DIRECTIVE_TCL_FILE      	$::env(DIRECTIVE_TCL_FILE)

set   TB_DIR                  	$::env(TB_DIR)
set   TB_FILES				  	      $::env(TB_FILES)
set   OUTPUT_DIR              	$::env(OUTPUT_DIR)

set   DEV_PARTNAME            	$::env(DEV_PARTNAME)
set   SOLUTION_NAME           	$::env(SOLUTION_NAME)

set	  TARGET_CLOCK_PERIOD_NS  	$::env(TARGET_CLOCK_PERIOD_NS)
set	  DIRECTIVE_TCL_FILE      	$::env(DIRECTIVE_TCL_FILE)


#------------------------------------------------------------------
# Creating the Project
#------------------------------------------------------------------

open_project  -reset		        ${PROJECT_NAME}

#------------------------------------------------------------------
# Add hls design files and set top level function
#------------------------------------------------------------------

add_files					              [ glob ${SRC_FILES}	]
set_top						              ${TOP_LEVEL_FUNCTION}

#------------------------------------------------------------------
# Add testbench files
#------------------------------------------------------------------

add_files		-tb                 [ glob ${TB_FILES}	]

#------------------------------------------------------------------
# Open and Configure the Solution, apply directives
#------------------------------------------------------------------

open_solution				            ${SOLUTION_NAME}
set_part					              ${DEV_PARTNAME}

create_clock	-period		        ${TARGET_CLOCK_PERIOD_NS}

source						              ${DIRECTIVE_TCL_FILE}

#------------------------------------------------------------------
# Done!
#------------------------------------------------------------------
exit

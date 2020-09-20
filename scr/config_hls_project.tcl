#------------------------------------------------------------------
# Setting project paths and output directory
#------------------------------------------------------------------

set   PROJECT_NAME				      $::env(PROJECT_NAME)

set   SRC_FILES               	$::env(SRC_FILES)
set	  TOP_LEVEL_FUNCTION      	$::env(TOP_LEVEL_FUNCTION)

set   TB_FILES				  	      $::env(TB_FILES)

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
# Done!
#------------------------------------------------------------------
exit

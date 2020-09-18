#-------------------------------------------------------------------------------
# Vivado HLS Project Configuration:
#
# Specify the name of the design (project),
# Please make sure that make is run from the current directory
#-------------------------------------------------------------------------------

# Vivado options
VIVADO_HLS_BIN							=	vivado_hls
COMPILE_OPTIONS							=	-notrace


# FPGA Device Options
export DEV_PARTNAME						=	xczu4cg-sfvc784-1-e

# Project Options
export PROJECT_NAME						=	unoptimized_fir
export PROJECT_ROOT_DIR					=	$(shell pwd)
export HLS_ROOT_DIR						=	${PROJECT_ROOT_DIR}/../../..


export SOLUTION_NAME					=	solution_1
export SOLUTION_ROOT_DIR				=	${PROJECT_ROOT_DIR}
export TOP_LEVEL_FUNCTION				=   ${PROJECT_NAME}

export PROJECT_SRC_BASE_DIR				=	${PROJECT_ROOT_DIR}/src

# Directory options
export SRC_DIR							=	${PROJECT_SRC_BASE_DIR}
export SCR_DIR							=	${PROJECT_ROOT_DIR}/scr
export TB_DIR							=	${PROJECT_ROOT_DIR}/tb
export OUTPUT_DIR						=	${PROJECT_ROOT_DIR}/builds

# Filenames
export SRC_FILES						=	${SRC_DIR}/*.*
export TB_FILES							=	${TB_DIR}/*.cpp

export HLS_PROJ_CONFIG_TCL_FILE			=	${HLS_ROOT_DIR}/scr/config_hls_project.tcl
export HLS_RUN_TASK_TCL_FILE			=	${HLS_ROOT_DIR}/scr/run_hls_task.tcl

# HL Synthesis Parameters
export TARGET_CLOCK_PERIOD_NS			=	10
export DIRECTIVE_TCL_FILE				=	${SCR_DIR}/directives.tcl

# Shell Specific Parameters

TIME									= /usr/bin/time

#-------------------------------------------------------------------------------
# Main Targets
#
# all						: build everything (default: project flow)
# clean						: cleans everything
#-------------------------------------------------------------------------------


.PHONY: all clean sim synth cosim export

all: creat_proj sim synth cosim



#-------------------------------------------------------------------------------
# Clean-up
#-------------------------------------------------------------------------------

clean:

	@echo "\n====================  CLEAN-UP BUILD  ==================\n"
	rm -rf ${OUTPUT_DIR}


#-------------------------------------------------------------------------------
# Target implementations
#-------------------------------------------------------------------------------

VIVADO_HLS_PROJ_FILE					=	${OUTPUT_DIR}/vivado_hls.app

SIM_RPT_FILE							=	${OUTPUT_DIR}/${SOLUTION_NAME}/csim/report/${PROJECT_NAME}_csim.log

SYNTH_RPT_FILE							=	${OUTPUT_DIR}/${SOLUTION_NAME}/syn/report/${PROJECT_NAME}_csynth.rpt

COSIM_RPT_FILE							=	${OUTPUT_DIR}/${SOLUTION_NAME}/sim/report/${PROJECT_NAME}_cosim.rpt


${VIVADO_HLS_PROJ_FILE}: ${SRC_DIR}/*.cpp ${SRC_DIR}/*.h ${TB_DIR}/*.cpp

	@echo "\n=======================  Create Project ==========================\n"
	mkdir -p ${OUTPUT_DIR}
	cd ${OUTPUT_DIR} && time ( ${VIVADO_HLS_BIN} -f ${HLS_PROJ_CONFIG_TCL_FILE} )


$(SIM_RPT_FILE):

	@echo "\n==============================  SIM  =============================\n"
	cd ${OUTPUT_DIR} && time ( export HLS_EXEC=0 && ${VIVADO_HLS_BIN} -f ${HLS_RUN_TASK_TCL_FILE} )


${SYNTH_RPT_FILE}:

	@echo "\n============================  SYNTH  =============================\n"
	cd ${OUTPUT_DIR} && time ( export HLS_EXEC=1 && ${VIVADO_HLS_BIN} -f ${HLS_RUN_TASK_TCL_FILE} )


${COSIM_RPT_FILE}:

	@echo "\n============================  CO-SIM  ============================\n"
	cd ${OUTPUT_DIR} && time ( export HLS_EXEC=2 && ${VIVADO_HLS_BIN} -f ${HLS_RUN_TASK_TCL_FILE} )


creat_proj:	${VIVADO_HLS_PROJ_FILE}

sim: creat_proj ${SIM_RPT_FILE}

synth: sim ${SYNTH_RPT_FILE}

cosim: synth ${COSIM_RPT_FILE}

export: cosim

	@echo "\n============================= EXPORT =============================\n"
	cd ${OUTPUT_DIR} && time ( export HLS_EXEC=3 && ${VIVADO_HLS_BIN} -f ${HLS_RUN_TASK_TCL_FILE} )


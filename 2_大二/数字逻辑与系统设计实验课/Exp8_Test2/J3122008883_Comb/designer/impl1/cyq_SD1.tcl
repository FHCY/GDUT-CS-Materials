# Created by Microsemi Libero Software 11.9.0.4
# Mon Nov 20 15:55:39 2023

# (OPEN DESIGN)

open_design "cyq_SD1.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "cyq_SD1_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {E:\cyq\J3122008883_Comb\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

backannotate -format "SDF" -language "VERILOG" -netlist

save_design

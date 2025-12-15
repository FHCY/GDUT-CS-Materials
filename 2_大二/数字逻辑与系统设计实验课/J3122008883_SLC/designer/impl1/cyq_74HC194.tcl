# Created by Microsemi Libero Software 11.9.0.4
# Mon Nov 27 10:01:47 2023

# (OPEN DESIGN)

open_design "cyq_74HC194.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "cyq_74HC194_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {E:\3122008883\J3122008883_SLC\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

backannotate -format "SDF" -language "VERILOG" -netlist

save_design

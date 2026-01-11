# Created by Microsemi Libero Software 11.9.0.4
# Thu Dec 12 15:31:34 2024

# (OPEN DESIGN)

open_design "lzy_SD2.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "lzy_SD2_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\FHCY\Desktop\study\signal\J3123009048_Comb\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

backannotate -format "SDF" -language "VERILOG" -netlist

save_design

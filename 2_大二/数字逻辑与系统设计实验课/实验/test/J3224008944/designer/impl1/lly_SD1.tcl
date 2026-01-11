# Created by Microsemi Libero Software 11.9.0.4
# Tue Dec 23 19:44:27 2025

# (OPEN DESIGN)

open_design "lly_SD1.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "lly_SD1_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\FHCY\Desktop\J3224008944\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"

backannotate -format "SDF" -language "VERILOG" -netlist

save_design

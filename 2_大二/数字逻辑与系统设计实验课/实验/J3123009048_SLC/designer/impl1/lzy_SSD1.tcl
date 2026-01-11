# Created by Microsemi Libero Software 11.9.0.4
# Tue Dec 17 17:41:19 2024

# (OPEN DESIGN)

open_design "lzy_SSD1.adb"

# set default back-annotation base-name
set_defvar "BA_NAME" "lzy_SSD1_ba"
set_defvar "IDE_DESIGNERVIEW_NAME" {Impl1}
set_defvar "IDE_DESIGNERVIEW_COUNT" "1"
set_defvar "IDE_DESIGNERVIEW_REV0" {Impl1}
set_defvar "IDE_DESIGNERVIEW_REVNUM0" "1"
set_defvar "IDE_DESIGNERVIEW_ROOTDIR" {C:\Users\FHCY\Desktop\study\signal\J3123009048_SLC\designer}
set_defvar "IDE_DESIGNERVIEW_LASTREV" "1"


# import of input files
import_source  \
-format "edif" -edif_flavor "GENERIC" -netlist_naming "VERILOG" {../../synthesis/lzy_SSD1.edn} -merge_physical "no" -merge_timing "yes"
compile
report -type "status" {lzy_SSD1_compile_report.txt}
report -type "pin" -listby "name" {lzy_SSD1_report_pin_byname.txt}
report -type "pin" -listby "number" {lzy_SSD1_report_pin_bynumber.txt}

save_design

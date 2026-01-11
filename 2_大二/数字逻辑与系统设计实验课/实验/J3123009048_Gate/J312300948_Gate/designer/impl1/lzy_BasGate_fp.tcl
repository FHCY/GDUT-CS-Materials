new_project \
    -name {lzy_BasGate} \
    -location {C:\New Folder2\J312300948_Gate\designer\impl1\lzy_BasGate_fp} \
    -mode {single}
set_programming_file -file {C:\New Folder2\J312300948_Gate\designer\impl1\lzy_BasGate.pdb}
set_programming_action -action {PROGRAM}
run_selected_actions
save_project
close_project

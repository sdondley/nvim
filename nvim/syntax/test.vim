syn match Good "^\s*ok \d\+ -"
syn match Good " PASS\n"
syn match Good "All tests successful"
syn match Comment "^#.*$"
syn match Bad "not ok \d\+ -"
syn match lineno " line \d\+\."
syn match failed_test "# Failed test"
syn match failed_test_at "#   at "
syn match failed_test_at "  Failed tests:"
syn match failed_test_at " FAILED\n"
syn match failed_test_at "Failed [^\n]\+ subtests"
syn match failed_test_at "Bad plan."
syn match failed_test_at "You planned [^\n]\+ but ran \d\+\."
syn match died "# died:[^\n]\+ at"
syn match got "#\s\+got:[^\n]\+"
syn match got "#\s\+expected:[^\n]\+"
syn match looks "#\s\+Looks[^\n]\+"
syn match debug_log "^\[DEBUG.*: \d\+$"
syn region info start="^\[INFO" end="\n\S"he=e-1,me=e-1
syn match tsr 'Test Summary Report'
syn match tsr '-------------------'
syn match tsr '\(Wstat: [^\n]\+ Failed: \d\+\)'

hi Bad cterm=bold ctermfg=Red
hi died ctermfg=Red
"hi warning cterm=none ctermfg=Red
hi Good cterm=bold ctermfg=DarkGreen
hi failed_test ctermfg=Red
hi failed_test_at ctermfg=Red
hi tsr ctermfg=Yellow
hi looks ctermfg=Red
hi lineno cterm=bold ctermfg=White
hi got cterm=bold ctermfg=White
hi expected cterm=bold ctermfg=White
hi info ctermfg=DarkGreen
hi debug_log ctermfg=Blue



"syn region warning contains=test_file,file,lineno,line_no_com,perl_lib,error_msg,builder_line start="^#\s\+Failed" end="#   at\sline \d\+\.\n"

"syn match Good "^\s*ok \d\+  -"
"syn region okline contains=Good start="^ok" end="\d"
"syn match builder_line "Builder\.pm line \d\+\."
"syn match log "\[\S\+:\d\+\]"
"syn match line_no "Line \d\+\:"
"syn match line_no_com "line \d\+\,"
"syn match error_msg "^# \t.*at"hs=s+3
"syn match perl_lib "perl_lib\/.*\.pm"hs=s+9
"syn match file " at [^\/]\+\.p[ml] "hs=s+3
"syn match subtest_file "^\s\+#\s\+.*at .*line \d\+\.\n"hs=s+5
"syn match test_file "\/[^\/]\+\/t\/.*\.t "hs=s+1
"syn match my_error "^[^(ok |not ok |#)].*line \d\+\.\n"
"syn region not_ok_subtest contains=subtest_file start="^\s\+not ok \d\+" end="^\s\+# Looks like you faile.*\n"
"syn region Bad contains=warning start="^not ok " end="^\ze[^#]"re=e-1,he=e-1
"syn region warning contains=test_file,file,lineno,line_no_com,perl_lib,error_msg,builder_line start="^#\s\+Failed" end="^\ze[^#]"re=e-1,he=e-1
"syn match comment "^#.*\n"
"syn match premature "^# Looks like.*\n"
"syn region dump fold transparent start="$VAR\d\+\s=\s"rs=s-1 end=";\n\n"
"syn region subtest start="# Subtest" end=":"
"syn match divider "----*"
"syn match warn 'WARN\|FATAL\|ERROR'
"syn match script contains=warn '[A-Z]\{4,5}.*> '
"syn region trace contains=trace_package start="^\[TRACE" end="\n\S"he=e-1,me=e-1
"syn region info start="^\[INFO" end="\n\S"he=e-1,me=e-1
"syn region warn_log start="^\[WARN" end="\n\S"he=e-1,me=e-1
"syn region error_log start="^\[ERROR" end="\n\S"he=e-1,me=e-1
"syn region fatal_fold contained fold start="^\s\+Facebook" end="main \d\+"
"syn region fatal contains=fatal_fold start="^\[FATAL" end="\n\n"
"syn match trace_package "::[a-z_][^:]\+: " contained
"
"hi trace_package ctermfg=DarkCyan
"hi trace ctermfg=Cyan
"hi warn_log ctermfg=Yellow
"hi error_log ctermfg=Red
"hi fatal ctermfg=Red
"hi Good cterm=bold ctermfg=DarkGreen
"hi divider cterm=bold ctermfg=yellow ctermbg=black
"hi dump ctermfg=LightBlue
"hi okline ctermfg=Green
"hi my_error cterm=none ctermfg=Red
"hi premature cterm=none ctermfg=Red
"hi failed cterm=none ctermfg=Red
"hi comment ctermfg=Cyan
"hi line_no ctermfg=White
"hi line_no_com ctermfg=White
"hi file ctermfg=White
"hi test_file ctermfg=White
"hi perl_lib ctermfg=White
"hi error_msg ctermfg=Green
"hi subtest ctermfg=Cyan
"hi builder_line cterm=none ctermfg=Red
"hi not_ok_subtest ctermfg=Red
"hi warn ctermfg=Red
"hi subtest_file ctermfg=White
"hi script ctermfg=White
"hi log ctermfg=White
"hi Folded ctermfg=Grey
"
"
"hi fatal_fold Folded ctermfg=Red
"syn region fatal fold transparent start="\[FATAL\]"rs=s-1 end="main \d\+\n"
"syn match info "^\[INFO.*: \d\+$"
"syn match trace "^\[TRACE.*: \d\+\n[^\[ ]"he=-1,me=-1

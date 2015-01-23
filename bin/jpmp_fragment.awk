BEGIN { s = "" } \
$1 == "Stack" && $2 =="Trace" { if (s) print s; s = "" } \
$1 == "at" { sub(/\([^)]*\)?$/, "", $2); sub(/^java/, "j", $2); if (s) s = s "," $2; else s = $2 } \
END { if(s) print s }
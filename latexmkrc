$pdf_mode = "5";
$out_dir="build";

#$pdflatex = "find . -type d -not -path './.git*' -not -path './build*' -exec mkdir -p $out_dir/{} \\; && xelatex %O -interaction=nonstopmode %S";
$compiling_cmd = "find . -type d -not -path './.git*' -not -path './build*' -exec mkdir -p $out_dir/{} \\;";

#$pdf_previewer  = 'gv --watch';
$pdf_previewer  = 'start evince';
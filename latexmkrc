$pdf_mode = "1";
$out_dir="build";

$pdflatex = "find . -type d -not -path './.git*' -not -path './build*' -exec mkdir -p $out_dir/{} \\; && xelatex %O -interaction=nonstopmode %S";

$pdf_previewer  = 'gv --watch';
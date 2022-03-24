#!/bin/bash
dhd=`pwd`
# locate saxon jar file
sax_jar=$dhd/lib/SaxonHE9-9-0-2J/saxon9he.jar

# locate FOP base directory
fop_lib=$dhd/lib/fop-2.3

# for hyphenation, you will also need 'offo hyphenation binaries': 
# simply place 'fop-hyph.jar' in 'fop/lib' 

# additional options for FOP processing (sent to the java process)
#   -d64: optimization for 64 bit processor
#   -Xmx3000m: sets the maximum available memory allocation pool to 3000 MB
# Note: It's safe to leave this variable blank
# fop_opts="-d64 -Xmx3000m"

# these variables shouldn't need to be changed, they are relative to fop_lib
fop_bin=${fop_lib}/fop
fop_conf=${fop_lib}/conf/fop.xconf

xslfo_xsl=$dhd/lib/tei2pdf/xsl-fo-producer.xsl
xslfo_xsl_separated=$dhd/lib/tei2pdf/xsl-fo-producer-separated.xsl
input_path=$dhd/input/xml
output_path=$dhd/output
separated_path=$output_path/separated
sep_xml=$separated_path/xml
sep_pdf=$separated_path/pdf
sep_fo=$separated_path/fo

tei_xsl_separated=$dhd/lib/tei2pdf/TEIcorpus_producer-separated.xsl


# further options that may be useful

# cleanup transitional files when finished
cleanup=true

#!/bin/bash

if [[ -f 'config/config_separated.sh' ]]; then
    source config/config_separated.sh
fi
mkdir -p $separated_path/{fo,pdf,xml}
searchstring=".xml"
cd $input_path
for i in *.xml; do java -jar "${sax_jar}" "$i" "${tei_xsl_separated}" > "${sep_xml}/$i" && \
 java -jar "${sax_jar}" "${sep_xml}/$i" "${xslfo_xsl_separated}" > "${sep_fo}/${i%$searchstring*}.fo" && \
FOP_OPTS="${fop_opts}" "${fop_bin}" -c "${fop_conf}" "${sep_fo}/${i%$searchstring*}.fo" "${sep_pdf}/${i%$searchstring*}.pdf"; done


if "$cleanup"; then
    mv $sep_pdf/*.pdf $output_path/
    rm -r $separated_path
fi
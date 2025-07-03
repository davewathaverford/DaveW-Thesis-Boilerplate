#!/bin/sh
THIS=CS_Ed_anonymizer.sh # to do ... maybe use the shell variable if I can remember it? Hopefully it won't have problematic path info?
echo " " >> ${THIS}
wc CS_Ed*.bib
echo "%%  Auto-regenerating anonymous bibliography at `date`" > CS_Ed_anon.bib
git commit -m "committing before auto-anonymizing" CS_Ed*.bib ${THIS} && cat CS_Ed.bib | \
	sed -e '/^% TO ANONYMIZE DELETE FROM HERE.../,/^% ...TO HERE (DELETE FROM THERE, TO ANOMYMIZE, THAT IS)/d'    | \
	sed -e 's/_ANONYMOUS_VERSION,/,/'                                                         | \
	cat >> CS_Ed_anon.bib &&
wc CS_Ed*.bib
echo " " >> ${THIS}
git commit -m "committing after auto-anonymizing" CS_Ed*.bib ${THIS}

# There may be some blank lines after this, to make sure git commit has something to do, feel free to delete, sigh
 
 
 
 
 
 
 
 
 
 
 

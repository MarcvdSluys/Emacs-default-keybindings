#!/bin/bash

##  emacs-sort-keybindings.sh: sort emacs keybindings obtained from C-h b in emacs -q
##  2021-03-13, MvdS:  initial version.

INFILE="emacs-default-keybindings.txt"
OUTFILE="emacs-default-keybindings-sorted.org"

echo -e "*Emacs default keybindings*\n" > $OUTFILE
echo "Steps to produce this list:" >> $OUTFILE
echo "1. $ emacs -q &  # Start emacs without ini file" >> $OUTFILE
echo "2. C-h b  ;; Show all keybindings" >> $OUTFILE
echo "3. C-x o  ;; Jump to other window" >> $OUTFILE
echo "4. C-x C-w $INFILE  ;; Write buffer to $INFILE" >> $OUTFILE
echo "5. $ ./emacs-sort-keybindings.sh  # Run emacs-sort-keybindings.sh to produce $OUTFILE" >> $OUTFILE



echo -e "\n* Ctrl" >> $OUTFILE
grep -E '^C-' $INFILE | grep -vE '^C-h|^C-x' | LC_ALL=C sort  >> $OUTFILE
echo -e "\n** C-h: help" >> $OUTFILE
grep -E '^C-h' $INFILE | LC_ALL=C sort  >> $OUTFILE
echo -e "\n** C-x" >> $OUTFILE
grep -E '^C-x' $INFILE | LC_ALL=C sort  >> $OUTFILE

echo -e "\n* Meta" >> $OUTFILE
grep -E '^M-' $INFILE | LC_ALL=C sort  >> $OUTFILE

echo -e "\n* Alt" >> $OUTFILE
grep -E '^A-' $INFILE | LC_ALL=C sort  >> $OUTFILE

echo -e "\n* Super" >> $OUTFILE
grep -E '^s-' $INFILE | LC_ALL=C sort >> $OUTFILE

echo -e "\n* Function keys" >> $OUTFILE
grep -E '^<f[0-9]' $INFILE | LC_ALL=C sort >> $OUTFILE

echo -e "\n* Keypad keys" >> $OUTFILE
grep -E 'kp-' $INFILE | LC_ALL=C sort >> $OUTFILE

echo -e "\n* Mouse" >> $OUTFILE
grep -E 'mouse-' $INFILE | LC_ALL=C sort >> $OUTFILE

# echo -e "\n* Dead" >> $OUTFILE
# grep -E 'dead-' $INFILE | LC_ALL=C sort >> $OUTFILE
# 
# echo -e "\n* Mute" >> $OUTFILE
# grep -E 'mute-' $INFILE | LC_ALL=C sort >> $OUTFILE

echo -e "\n* Help" >> $OUTFILE
grep -E '^<help>' $INFILE | LC_ALL=C sort >> $OUTFILE

echo -e "\n* Remap" >> $OUTFILE
grep -E '^<remap>' $INFILE | LC_ALL=C sort >> $OUTFILE



echo -e "\n* Other" >> $OUTFILE
grep -vE '^C-|^M-|^$|^ |^A-|^s-|kp-|mouse-|dead-|mute-|^<help>|^<f[0-9]|^<remap>|key             binding|^`|:$|\-------|' $INFILE | LC_ALL=C sort  >> $OUTFILE

echo >> $OUTFILE


# Add bullet points (+) to all bare items for better readability on GitHub:
sed -i \
    -e 's|^.*$|+ &|' \
    -e 's|^+ \*|\*|' \
    -e 's|^+ \([0-9]\)|  \1|' \
    -e 's|^+ $||' \
    $OUTFILE


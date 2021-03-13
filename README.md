# List of all default Emacs keybindings #


This repository contains a list of all default keybindings for GNU emacs, as well as a sorted version of that
list in Org mode format.  This can help me to get a better overview of the default bindings and provides me
with a searchable and greppable file.

## Original list ##

The original list is in `emacs-default-keybindings.txt`.  It was generated by starting emacs without ini file
(`$ emacs -q`), listing all key bindings using `C-h b` and saving that buffer to a file.


## Sorted list in Org mode format ##

The sorted list was generated by the bash script `emacs-sort-keybindings.sh` and saved as
`emacs-default-keybindings-sorted.org`.  Note that Org mode formatting uses plain text, so that you should be
able to display this file with any text editor or e.g. `less`.



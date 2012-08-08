{smcl}
{* 07 August 2012}{...}
{hline}
help for {hi:mergemany}
{hline}

{title:Title}

{p 8 20 2}
    {hi:mergemany} {hline 2} A flexible command to merge many files

{title:Syntax}

One-to-one merge of files where user lists full file names

{p 8 20 2}
{cmdab:mergemany} {cmd:1:1} {it: filename1 filename2}...{cmd:,}
match({varlist}) [{it:options}]


One-to-one merge of files where user takes advantage of numerical regularity in file name

{p 8 20 2}
{cmdab:mergemany} {cmd:1:1}  {it: fileprefix}{cmd:,} 
match({varlist}) {cmdab:num:erical(}{help numlist}{cmd:)} [{it:options}]


One-to-one merge of all files in the current working directory

{p 8 20 2}
{cmdab:mergemany} {cmd:1:1}  {it: all}{cmd:,} 
match({varlist}) {cmdab:all} [{it:options}]



This syntax also generalises to one-to-many, many-to-one, and many-to-many as per {help merge}


{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab :Options}
{synopt :{opth m:atch(varlist)}}lists the variable(s) upon which the match is performed; this is a required option.
{p_end}
{...}
{synopt :{cmdab:num:erical(}{help numlist}{cmd:)}}used when specifying a merge based upon the numerical suffix of a file name; 
cannot be used with {cmd:all}
{p_end}
{...}
{synopt :{opt all}}merges all files in the current working directory; cannot be used with {cmdab:num:erical(}{help numlist}{cmd:)}
{p_end}
{...}
{synopt :{opt keep}}conserves the dataset currently in memory while simultaneously performing the merge between all filnames; 
in this case the option {cmdab:sav:ing(}{it:filename}{cmd:)} is recommended 
{p_end}
{...}
{synopt :{cmdab:sav:ing(}{it:filename}{cmd:)}}saves the final resulting file from all merges as {it: filename.dta}; 
recommended when conserving the dataset in memory via {cmd:keep}
{p_end}
{...}
{synopt :{opt ver:bose}}creates a variable to mark merge results for each separate merge; by default this is _merge_{it:filename}
{...}
{p_end}
{synoptline}
{p2colreset}


{title:Description}

{hi:mergemany} is an extension to the command {help merge}, providing a flexible way for many datasets to be merged into one final dataset.  {hi:mergemany} is able to perform the standard 
merges defined in {help merge} (one-to-one, one-to-many, many-to-one, many-to-many); one of these matches must be specified. 

{hi:mergemany} provides a number of ways to specify the files to be merged.  File names may be listed in full allowing for merges of files in separate directories or with no obvious 
naming scheme.  A numerical suffix can be used in the case that files share a common prefix but differ due to a non-identical suffix (such as {it:file1}, {it:file2}, {it:file3}...).  In this 
case the suffix is listed as an argument and the option {cmdab:num:erical(}{help numlist}{cmd:)} must be specified.  Finally, all files from the current working directory can be merged into one file
(see {help cd} for help in navigating to a required directory).  When merging all files from a directory the argument {it:all} should be included in place of file names and the option {cmd:all} 
must be specified. 

The resulting match rate for each using file merged into the parent file are displayed as program output, however in order for a resulting variable to be included listing the 
source and contents of each observation (as per the variable {cmd:_merge} in {help merge}), the option {cmd:ver:bose} must be specified.  For more details regarding these outputs and the values
taken by these variables (if specified), see the {help merge##results:match results table} in {help merge}.


{title:Author}

{pstd}
Damian C. Clarke, University of Oxford and ComunidadMujer. {browse "mailto:damian.clarke@economics.ox.ac.uk"}
{p_end}

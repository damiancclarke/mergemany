{smcl}
{* 07 August 2012}{...}
{hline}
help for {hi:mergemany}
{hline}

{title:Title}

{p 8 20 2}
    {hi:mergemany} {hline 2} A generalised way to merge many files

{title:Syntax}

One-to-one merge of files where user lists full file names
{p 8 20 2}
{cmdab:mergemany} {cmd:1:1} {it: filename1 filename2}... {cmd:,}
match({varlist}) [{it:options}]

One-to-one merge of files where user takes advantage of numerical regularity in file name
{p 8 20 2}
{cmdab:mergemany} {cmd:1:1}  {it: fileprefix} 
{cmd:,} match({varlist}) {cmdab:num:erical(}{numlist}{cmdab)} [{it:options}]

{help varlist} is the match variables that uniquely identify observations. It is required.

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{synopt:{opt csv}}files to be merged are .csv (default){p_end}
{synopt:{opt txt}}files to be merged are .txt{p_end}
{synopt:{opt dta}}files to be merged are .dta{p_end}
{synopt:{opt tab}}insheet tab delimited data{p_end}
{synopt:{opt comma}}insheet comma delimited data{p_end}
{synopt:{opt double}}insheet all numeric variables as double. See {help format}{p_end}
{synopt:{opt format}}specify a format to be used in the event that a numberic variable must be converted to string. See {help tostring} and {help format}{p_end}
{synopt:{opt do(filename)}}runs the specified do file on each individual file before merging{p_end}
{synopt:{opt strings(varlist)}}force the varlist to string format and all others to numeric{p_end}
{synopt:{opt force}}forces conversion to string or numeric. Required with the string option.{p_end}
{synopt:{opt showsource}}generates a new string variable containing the name of the file each observation was drawn from.{p_end}
{synoptline}

{p2colreset}{...}
{p 4 6 2}

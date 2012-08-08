* mergemany 1.00                 dh:2012-07-03                  Damian C. Clarke
*---|----1----|----2----|----3----|----4----|----5----|----6----|----7----|----8

capture program drop mergemany
program define mergemany
        vers 10
	
	// COMMAND SYNTAX
	#delimit ;
        syntax anything(name=bases), 
	Match(string) //Required: these are the variables to match on
	[SAVing(string)
	NUMerical(numlist)
	all
	keep
	VERbose
	type(string)
	];
	#delimit cr
	
	if length("`keep'") != 0 preserve
	clear
	
	//Replace user defined merge parameter as mm (can be 1:1, 1:m, m:m, m:1)
	local mm=`"`1'"'
	
	//Process depends upon whether user specifies numerical, all, or normal
	//error due to choosing both numerical and all
	if length(`"`numerical'"') != 0 & (length("`all'") > 0) {
		di in yellow "You cannot specify both numerical and all.  You may only choose one of these options."
	}

	//numerical()
	else if length(`"`numerical'"') != 0 {
		di in yellow "You have specified a numerical file appendix"
		local name = reverse(subinstr(reverse(`"`2'"'), ",", "",1))
		
		tokenize `numerical'
		if length(`"`type'"') != 0 & "`type'"!="dta" insheet using
		use "`name'`1'.dta"
		local i=2
		
		if length(`"`type'"') != 0 & "`type'"!="dta" insheet using 
		while "`2'" != "" {
			merge `mm' `match' using "`name'`2'.dta", generate(_merge_`name'`i')
			if length(`"`verbose'"') == 0 drop _merge*
			mac shift
			local ++i
			}
	}
		
	//all
	else if length(`"`numerical'"') == 0 & (length("`all'") > 0) {
		di in yellow "You have specified that you want to merge all files from the current folder."
		di in yellow "If a list of files does not appear below, your working directory contains no .dta files" 
		local dir `c(pwd)'
		local list : dir `"`dir'"' files "*.dta"
		dis `"`list'"'
		
		tempvar x
		gen `x'=.
		local i=1
		foreach file of local list {
			local file`i' "`file'"
			local ++i
			}
		drop `x'

		//Merge bases with all files from the folder
		use "`file1'"
		local --i
		foreach num of numlist 2(1)`i' {
			local savename = reverse(subinstr(reverse(`"`file`num''"'), "atd.", "",1))			
			merge `mm' `match' using `"`file`num''"', gen(_merge_`savename')
			if length(`"`verbose'"') == 0 drop _merge*
		}
	}

	//normal
	else if length(`"`numerical'"') == 0 & (length("`all'") == 0){
				
		//Merge bases which the user has listed in the list anything 
		tokenize `bases'
		use `2'.dta
		while "`3'" != "" {
			merge `mm' `match' using `3', gen(_merge_`3')
			if length(`"`verbose'"') == 0 drop _merge*
			mac shift
			}
	}


	//Saves created do file as name defined by user if user specifies option
	if length(`"`verbose'"') !=0 order _merge*
	if length(`"`saving'"') != 0 save "`saving'.dta", replace
	if length("`keep'") != 0 restore

end

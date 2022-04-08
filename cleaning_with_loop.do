use bertrand.dta, clear

ds, has(type string) 
foreach var of varlist `r(varlist)'{
encode `var', gen(`var'_1)
drop `var'
rename `var'_1 `var'
}
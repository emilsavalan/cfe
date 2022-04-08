// install package
ssc install estout

// import data
use bertrand.dta, clear

// look at data
desc


// data labeling
//// creating vars, cleaning, fixing

lab var yearsexp "Years of experience"
gen expsq_001 = (yearsexp*yearsexp)/100
lab var expsq_001 "Years of experience^2 (*100)"
gen exp_01 = yearsexp/10
lab var exp_01 "Years of experience (*10)"

tab city sex
replace city = "0" if city == "c"
replace city = "1" if city == "b"
destring city, replace
lab def cityl 0 "Chicago" 1 "Boston"
lab val city cityl
lab var city ""

replace sex = "0" if sex == "f"
replace sex = "1" if sex == "m"
destring sex, replace
lab def sexl 0 "female" 1 "male"
lab val sex sexl

replace race = "0" if race == "w"
replace race = "1" if race == "b"
destring race, replace
lab def racel 0 "white" 1 "black"
lab val race racel

lab var volunteer "Volunteering? (Y = 1)"
lab var military "Military experience? (Y = 1)"
lab var email "Email? (Y = 1)"
lab var empholes "Employment holes? (Y = 1)"
lab var workinschool "Work in school? (Y = 1)"
lab var honors "Honors? (Y = 1)"
lab var computerskills "Computer skills? (Y = 1)"
lab var specialskills "Special skills? (Y = 1)"


// save data
//save, replace
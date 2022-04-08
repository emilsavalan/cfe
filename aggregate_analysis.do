// import data
use bertrand.dta, clear

// Aggregate, reshape....

gen double w_l_mean = .
gen double b_l_mean = .
gen double w_h_mean = .
gen double b_h_mean = .

gen double w_ratio = .
gen double b_ratio = .

gen double w_p =.
gen double b_p =.

gen double w_diff = . 
gen double b_diff =.

su call if l==1 & race=="w"
replace w_l_mean = round(100*r(mean), 0.01)
su call if l==1 & race=="b"
replace b_l_mean = round(100*r(mean), 0.01)
su call if h==1 & race=="w"
replace w_h_mean = round(100*r(mean), 0.01)
su call if h==1 & race=="b"
replace b_h_mean = round(100*r(mean), 0.01)

di w_l_mean, b_l_mean, w_h_mean, b_h_mean

replace w_ratio=round(w_h_mean/w_l_mean,0.01)
replace b_ratio=round(b_h_mean/b_l_mean,0.01)
di w_ratio, b_ratio

replace w_diff=w_h_mean - w_l_mean
replace b_diff=round(b_h_mean - b_l_mean, 0.01)
di w_diff, b_diff



// simple analysis
ttest call if race=="w", by(l)
replace w_p = round(r(p), 0.0001)
ttest call if race=="b", by(l)
replace b_p = round(r(p), 0.0001)



// some table 

program tabled
di _skip(30)"Table 4"
di "{hline 70}"
di _skip(30)" Panel A"
di _skip(30)"(Percent Callback)"
di _skip(26)"Low"_skip(3)"High"_skip(3)"Ratio"_skip(3)_skip(3)"Difference (p-value)"
di "White names"_skip(15)w_l_mean _skip(2)w_h_mean _skip(3) w_ratio _skip(8) w_diff "(" w_p ")"
di "African-American names" _skip(4) b_l_mean _skip(2) b_h_mean _skip(4) b_ratio _skip(7) b_diff "(" b_p ")"
end

tabled
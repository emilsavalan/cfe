// the analysis is from the replication of the paper by Bertrand et al. where they studied the racial discrimation on job market


// installing package for nice regression tables
do lib_install.do

// encoding of variables with loop
do cleaning_with_loop.do

// some fixings, relabelings, manipulations
do fixing_manipulations.do

//aggregate data to some descriptive tables 
do aggregate_analysis.do

// running regressions
do regressions.do
# import pandas to work with data
# import .dta file

import pandas
rep_url = "https://github.com/emilsavalan/cfe/raw/main/" 
data = pandas.read_stata(rep_url + "bertrand.dta")


pandas.set_option('precision', 4)

# check and look at imported data
print(data.head())
print(data.tail())


# using list 
cv_characteristics = ['education', 'yearsexp', 'honors', 'volunteer', 'military',
          'email', 'workinschool', 'computerskills', 'specialskills']



for x in range(len(data)):
	if (data.loc[x, 'sex']== "m"):
		data.loc[x, 'sex'] = 1
	else:
		data.loc[x, 'sex'] = 0

	if (data.loc[x, 'city']== "c"):
		data.loc[x, 'city'] = 1
	else:
		data.loc[x, 'city'] = 0

	if (data.loc[x, 'race']== "w"):
		data.loc[x, 'race'] = 1
	else:
		data.loc[x, 'race'] = 0		
	if (data.loc[x, 'education'] > 3):
		data.loc[x, 'college'] = 1
	else:
		data.loc[x, 'college'] = 0			



# using of function
def data_by_cv_characteristics(list):
	return data.loc[:, list].head()


print(data_by_cv_characteristics(cv_characteristics))

print(data_by_cv_characteristics('education'))



data_cv_charac = data_by_cv_characteristics(cv_characteristics)


black = data_cv_charac[data['race']==0]
white = data_cv_charac[data['race']== 1]

# dictionary use
dictlist = {'mean_both': data_cv_charac.mean(),   'std_both': data_cv_charac.std(),
           'mean_black': black.mean(), 'std_black': black.std(),
           'mean_white': white.mean(), 'std_white': white.std()}
print(pandas.DataFrame(dictlist))


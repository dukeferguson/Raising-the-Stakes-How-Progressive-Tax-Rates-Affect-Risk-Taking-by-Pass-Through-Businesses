global path "C:\Users\vcfe222\Dropbox\Research\Stakes Races\Betting Pools - Risk\Final Code"

/*Importing Data*/
clear
import excel using "$path\Original.xlsx", firstrow
replace trackid=subinstr(trackid," ","",.)
tab trackid
save "$path/Original.dta" , replace

/*Cleaning Data*/
use "$path/Original.dta" , clear
drop if country == "PR"
drop if country == "PR "
gen Canada = 0
replace Canada = 1 if country == "CAN"
gen USA = 0
replace USA = 1 if country == "USA"

/*Date*/
rename racedate date

/*Distance*/
replace distance = distance/100

/*Other*/
replace sexrestriction = "N" if sexrestriction == ""
replace weather = "C" if weather == ""
drop temperature

save "$path/data1.dta" , replace

/*Gen Number Vars*/
use "$path/data1.dta" , clear

gen dayofweek = dow(date)
egen trackidnum=group(trackid)
egen dayofweeknum=group(dayofweek)

save "$path/testdata.dta" , replace

/*State define*/
use "$path/testdata.dta" , clear

gen AR = 0
replace AR = 1 if trackid == "OP"

gen AZ = 0
replace AZ = 1 if trackid == "AZD" | trackid == "RIL" | trackid == "TUP" | trackid == "YAV" | trackid == "DUN" | trackid == "SAF" | trackid == "DG"

gen CA = 0
replace CA = 1 if trackid == "DMR" | trackid == "GG" | trackid == "LA" | trackid == "SA" | trackid == "SAC" | trackid == "BHP" | trackid == "BSR" | trackid == "FER" | trackid == "FNO" | trackid == "FPX" | trackid == "GG" | trackid == "HOL" | trackid == "LRC" | trackid == "OSA" | trackid == "OTH" | trackid == "OTP" | trackid == "PLN" | trackid == "SOL" | trackid == "SR" | trackid == "STK" | trackid == "SON"

gen CO = 0
replace CO = 1 if trackid == "ARP"

gen DE = 0
replace DE = 1 if trackid == "DEL" | trackid == "WNT"

gen FL = 0
replace FL = 1 if trackid == "GP" | trackid == "GPW" | trackid == "TAM" | trackid == "CRC" | trackid == "OTC" | trackid == "PMB"

gen GA = 0
replace GA = 1 if trackid == "ATH"

gen IA = 0
replace IA = 1 if trackid == "PRM"

gen ID = 0
replace ID = 1 if trackid == "BOI" | trackid == "SDY" | trackid == "BKF" | trackid == "POD" | trackid == "EMT" | trackid == "JRM" | trackid == "RUP" | trackid == "CAS" | trackid == "ONE"

gen IL = 0
replace IL = 1 if trackid == "AP" | trackid == "FP" | trackid == "HAW"

gen IN = 0
replace IN = 1 if trackid == "BTP" | trackid == "HOO" | trackid == "IND"

gen KS = 0
replace KS = 1 if trackid == "EUR" | trackid == "ANF"

gen KY = 0
replace KY = 1 if trackid == "CD" | trackid == "KD" | trackid == "KEE" | trackid == "TP" | trackid == "ELP" | trackid == "LEX"

gen LA = 0
replace LA = 1 if trackid == "DED" | trackid == "EVD" | trackid == "FG" | trackid == "LAD"

gen MA = 0
replace MA = 1 if trackid == "SUF"

gen MD = 0
replace MD = 1 if trackid == "LRL" | trackid == "PIM" | trackid == "TIM" | trackid == "MON" | trackid == "GLN" | trackid == "FAI" | trackid == "GN" | trackid == "SHW"

gen MI = 0
replace MI = 1 if trackid == "HP" | trackid == "PNL" | trackid == "MPM"

gen MN = 0
replace MN = 1 if trackid == "CBY"

gen MT= 0
replace MT = 1 if trackid == "MC" | trackid == "GF" | trackid == "YD" | trackid == "WMF" | trackid == "KSP"

gen NC = 0
replace NC = 1 if trackid == "CHL" | trackid == "STN" | trackid == "TRY" | trackid == "CLM"

gen ND = 0
replace ND = 1 if trackid == "FAR" | trackid == "CPW"

gen NE = 0
replace NE = 1 if trackid == "ATO" | trackid == "CLS" | trackid == "FON" | trackid == "HPO" | trackid == "LNN"

gen NM = 0
replace NM = 1 if trackid == "ALB" | trackid == "RUI" | trackid == "SRP" | trackid == "SUN" | trackid == "ZIA"

gen NJ = 0
replace NJ = 1 if trackid == "MED" | trackid == "MTH" | trackid == "ATL" | trackid == "FH"

gen NV = 0
replace NV = 1 if trackid == "ELY" | trackid == "ELK" 

gen NY = 0
replace NY = 1 if trackid == "SAR" | trackid == "BEL" | trackid == "AQU" | trackid == "FL" | trackid == "FLG" | trackid == "GV"

gen OH = 0
replace OH = 1 if trackid == "BEU" | trackid == "MVR" | trackid == "RD" | trackid == "TDN"

gen OK = 0
replace OK = 1 if trackid == "FMT" | trackid == "RP" | trackid == "WRD" | trackid == "BRD"

gen OR = 0
replace OR = 1 if trackid == "PM" | trackid == "UN" | trackid == "GRP" | trackid == "PRV" | trackid == "TIL" | trackid == "BRN"

gen PA = 0
replace PA = 1 if trackid == "PEN" | trackid == "PHA" | trackid == "PID" | trackid == "PRX" | trackid == "MAL" | trackid == "UNI" | trackid == "WIL"

gen SC = 0
replace SC = 1 if trackid == "AIK" | trackid == "CAM"

gen TN = 0
replace TN = 1 if trackid == "PW"

gen TX = 0
replace TX = 1 if trackid == "HOU" | trackid == "LS" | trackid == "MAN" | trackid == "RET" | trackid == "GIL"

gen VA = 0
replace VA = 1 if trackid == "CNL" | trackid == "MID" | trackid == "GRM" | trackid == "FX" | trackid == "MOR"

gen WA = 0
replace WA = 1 if trackid == "EMD" | trackid == "SUD" | trackid == "WW" | trackid == "WTS" | trackid == "DAY"

gen WV = 0
replace WV = 1 if trackid == "CT" | trackid == "MNR"

gen WY = 0
replace WY = 1 if trackid == "CWF" | trackid == "ED" | trackid == "SWF" | trackid == "WYO"



gen AB = 0
replace AB = 1 if trackid == "NP" | trackid == "LBG" | trackid == "MIL" | trackid == "GPR" | trackid == "ABT" | trackid == "CTD" | trackid == "CTM"

gen BC = 0
replace BC = 1 if trackid == "HST" | trackid == "SND" | trackid == "KIN" | trackid == "KAM" | trackid == "DEP"

gen MB = 0
replace MB = 1 if trackid == "ASD" 

gen ON = 0
replace ON = 1 if trackid == "WO" | trackid == "FE"

gen SK = 0
replace SK = 1 if trackid == "MD" | trackid == "MDA"



gen StateName = ""
replace StateName = "Arkansas" if AR == 1
replace StateName = "Arizona" if AZ == 1
replace StateName = "California" if CA == 1
replace StateName = "Colorado" if CO == 1
replace StateName = "Delaware" if DE == 1
replace StateName = "Florida" if FL == 1
replace StateName = "Georgia" if GA == 1
replace StateName = "Iowa" if IA == 1
replace StateName = "Idaho" if ID == 1
replace StateName = "Illinois" if IL == 1
replace StateName = "Indiana" if IN == 1
replace StateName = "Kansas" if KS == 1
replace StateName = "Kentucky" if KY == 1
replace StateName = "Louisiana" if LA == 1
replace StateName = "Massachusetts" if MA == 1
replace StateName = "Maryland" if MD == 1
replace StateName = "Montana" if MT == 1
replace StateName = "Michigan" if MI == 1
replace StateName = "Minnesota" if MN == 1
replace StateName = "Nebraska" if NE == 1
replace StateName = "North Dakota" if ND == 1
replace StateName = "New Mexico" if NM == 1
replace StateName = "Nevada" if NV == 1
replace StateName = "New Jersey" if NJ == 1
replace StateName = "New York" if NY == 1
replace StateName = "North Carolina" if NC == 1
replace StateName = "Ohio" if OH == 1
replace StateName = "Oklahoma" if OK == 1
replace StateName = "Oregon" if OR == 1
replace StateName = "Pennsylvania" if PA == 1
replace StateName = "South Carolina" if SC == 1
replace StateName = "Tennessee" if TN == 1
replace StateName = "Texas" if TX == 1
replace StateName = "Virginia" if VA == 1
replace StateName = "Washington" if WA == 1
replace StateName = "West Virginia" if WV == 1
replace StateName = "Wyoming" if WY == 1

replace StateName = "Alberta" if AB == 1
replace StateName = "British Columbia" if BC == 1
replace StateName = "Manitoba" if MB == 1
replace StateName = "Ontario" if ON == 1
replace StateName = "Saskatchewan" if SK == 1
*dropping special events
drop if trackid == "PMT" | trackid == "MTP" | trackid == "MOF" | trackid == "GCF" | trackid == "SJ" | trackid == "CHA"

save "$path/StateNames1.dta" , replace

clear
import excel using "$path/TaxRates_updated12-23.xlsx", firstrow
drop O stateis
rename statename StateName

save "$path/TaxRates.dta" , replace

use "$path/StateNames1.dta" , clear

merge m:1 StateName using "$path/TaxRates.dta"
drop _merge

gen StateRateWages = .

foreach i of numlist 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 2019{
replace StateRateWages = tr`i' if year == `i'
}

save "$path/StateNames2.dta" , replace

/*Merge Stakes*/
clear
import excel using "$path/grade.xlsx", firstrow
destring purse, replace
replace racetype = "STK" if racetype == ""
duplicates drop trackid date racetype runners distance, force
save "$path/graded.dta" , replace

use "$path/StateNames2.dta" , clear
merge m:1 trackid date racetype runners distance using "$path/graded.dta"
drop if _merge == 2
drop _merge
replace grade = 4 if grade == .

save "$path/StateNames3.dta" , replace


/*Main TESTING*/
use "$path/StateNames3.dta" , clear

drop if year == 2020
replace trackid = "SA" if trackid == "OSA"
replace trackid = "HOL" if trackid == "OTH"
replace trackid = "HOL" if trackid == "BHP"
replace trackid = "FAX" if trackid == "BSR"

keep if racetype == "STK" | racetype == "AOC" | racetype == "ALW" | racetype == "OCL"

gen stakes = 0 
replace stakes = 1 if racetype == "STK"
gen allo = 0 
replace allo = 1 if racetype != "STK"
gen n = 1

*drop if grade == 1

gen highrunners = 0
replace highrunners = runners if stakes == 1

gen c = 1
gen spurse = 0
replace spurse = purse if stakes == 1
gen apurse = 0
replace apurse = purse if stakes == 0

bys date trackid: egen highdayrunners = sum(highrunners)
bys date trackid: egen dayrunners = sum(runners)
bys date trackid: egen dayraces = sum(c)
bys date trackid: egen sdaypurse = sum(spurse)
bys date trackid: egen adaypurse = sum(apurse)
bys date trackid: egen daystake = sum(stakes)

gen stakeratio = daystake/(dayraces-daystake)
gen runnerratio = highdayrunners/dayrunners
gen spurseratio = sdaypurse/daystake
gen apurseratio = adaypurse/(dayraces - daystake)
gen purseratio = spurseratio/apurseratio

egen statenum=group(StateName)

gen weatherburn = 0
replace weatherburn = 1 if weather == "O" | weather == "R" | weather == "S"

bys date trackid: egen weatherbi = max(weatherburn)

duplicates drop date trackid, force

drop if runnerratio == 0
drop if runnerratio == .
drop if runnerratio == 1

winsor2 apurseratio spurseratio purseratio stakeratio, replace cuts(1 99) by(trackid)

save "$path/StateNames4.dta" , replace



/*Figure 3*/
use "$path/StateNames4.dta" , clear

foreach num of numlist 2009/2019{
	gen year`num' = 0
	replace year`num' = 1 if year == `num'
	gen USAxyear`num' = USA*year`num'
}

keep if year > 2012
gen t_treat = year - 2018
replace t_treat = . if USA == 0

reghdfe runnerratio USAxyear2013 USAxyear2014 USAxyear2015 USAxyear2016 USAxyear2018 USAxyear2019 purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackid)

cem purseratio stakeratio, treatment(USA) showbreaks
reghdfe runnerratio USAxyear2013 USAxyear2014 USAxyear2015 USAxyear2016 USAxyear2018 USAxyear2019 purseratio stakeratio weatherbi i.year i.dayofweeknum [weight=cem_weights], absorb(trackidnum) vce(cluster trackid)


keep if trackid == "DUN" | trackid == "YAV" | trackid == "GIL" | trackid == "ATH" | trackid == "YD" | trackid == "GF" | trackid == "RIL" | trackid == "BOI" | trackid == "BTP" | trackid == "TDN" | trackid == "DED" | trackid == "CBY" | trackid == "AP" | trackid == "AQU" | trackid == "MTH" | USA == 0

reghdfe runnerratio USAxyear2013 USAxyear2014 USAxyear2015 USAxyear2016 USAxyear2018 USAxyear2019 purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackid)


/*Descriptive Stats T1*/
use "$path/StateNames4.dta" , clear
keep if year > 2012
gen x = 1
bys trackidnum: egen Frequency = count(x)
keep if USA == 1
duplicates drop trackidnum, force
keep trackid StateName Frequency
sort StateName trackid

/*Descriptive Stats T2*/
use "$path/StateNames4.dta" , clear

keep if USA == 0
gen post_change = 0
replace post_change = 1 if year > 2017

keep if year > 2012
*keep if year < 2018 
keep if year > 2017

tabstat runnerratio highdayrunners dayrunners USA post_change purseratio stakeratio weatherbi, columns(statistics) statistics(n mean sd p25 median p75)


/*TCJA T3*/
use "$path/StateNames4.dta" , clear

gen post_change = 0
replace post_change = 1 if year > 2017

keep if year > 2012

gen interaction = post_change*USA

reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackid) vce(cluster trackid)

*Matched Samples T3
use "$path/StateNames4.dta" , clear

gen post_change = 0
replace post_change = 1 if year > 2017
keep if year > 2012

cem purseratio stakeratio, treatment(USA) showbreaks 

gen interaction = post_change*USA

reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum [weight=cem_weights], absorb(trackidnum) vce(cluster trackidnum)


keep if trackid == "DUN" | trackid == "YAV" | trackid == "GIL" | trackid == "ATH" | trackid == "YD" | trackid == "GF" | trackid == "RIL" | trackid == "BOI" | trackid == "BTP" | trackid == "TDN" | trackid == "DED" | trackid == "CBY" | trackid == "AP" | trackid == "AQU" | trackid == "MTH" | USA == 0

reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackidnum)

/*Table 4 California*/

use "$path/StateNames4.dta" , clear

keep if Canada == 0
gen increase = 0
replace increase = 1 if year > 2012 & StateName == "California"

drop if StateName == "North Carolina" & year > 2011
drop if StateName == "Kentucky" & year > 2016
drop if StateName == "Minnesota" & year > 2010
drop if StateName == "Illinois" & year > 2012
drop if StateName == "Oregon" & year > 2009
drop if StateName == "North Dakota" & year > 2009
drop if StateName == "Ohio" & year > 2011

keep if year < 2017

reghdfe runnerratio increase purseratio stakeratio weatherbi i.year i.dayofweek, absorb(trackidnum) cluster(StateName)

cem purseratio stakeratio, treatment(CA) showbreaks

reghdfe runnerratio increase purseratio stakeratio weatherbi i.year i.dayofweek [weight=cem_weights], absorb(trackidnum) cluster(StateName)

keep if trackid == "GV" | trackid == "EMT" | trackid == "ATH" | trackid == "FMT" | trackid == "FAI" | trackid == "UNI" | trackid == "MID" | trackid == "CBY" | trackid == "MNR" | trackid == "ZIA" | trackid == "SUN" | trackid == "CD" | trackid == "GP" | trackid == "BEL" | CA == 1

reghdfe runnerratio increase purseratio stakeratio weatherbi i.year i.dayofweek, absorb(trackidnum) cluster(StateName)


/*Table 5 Progressive States*/
use "$path/StateNames4.dta" , clear

*3% and 100k or higher
gen progressive = 0
replace progressive = 1 if AR == 1
replace progressive = 0 if AZ == 1
replace progressive = 1 if CA == 1
replace progressive = 0 if CO == 1
replace progressive = 0 if DE == 1
replace progressive = 0 if FL == 1
replace progressive = 0 if GA == 1
replace progressive = 0 if IA == 1
replace progressive = 0 if ID == 1
replace progressive = 0 if IL == 1
replace progressive = 0 if IN == 1
replace progressive = 0 if KS == 1
replace progressive = 0 if KY == 1
replace progressive = 1 if LA == 1
replace progressive = 0 if MA == 1
replace progressive = 1 if MD == 1
replace progressive = 0 if MT == 1
replace progressive = 0 if MI == 1
replace progressive = 1 if MN == 1
replace progressive = 0 if NE == 1
replace progressive = 0 if ND == 1
replace progressive = 0 if NM == 1
replace progressive = 0 if NV == 1
replace progressive = 1 if NJ == 1
replace progressive = 1 if NY == 1
replace progressive = 0 if NC == 1
replace progressive = 1 if OH == 1
replace progressive = 0 if OK == 1
replace progressive = 1 if OR == 1
replace progressive = 0 if PA == 1
replace progressive = 0 if SC == 1
replace progressive = 0 if TN == 1
replace progressive = 0 if TX == 1
replace progressive = 0 if VA == 1
replace progressive = 0 if WA == 1
replace progressive = 0 if WV == 1
replace progressive = 0 if WY == 1


keep if USA == 1


cem StateRateWages, treatment(progressive) showbreaks
gen StateRateWagesxprogressive = StateRateWages*progressive

keep if year < 2018

reghdfe runnerratio StateRateWages StateRateWagesxprogressive progressive purseratio stakeratio weatherbi i.year i.dayofweeknum [weight=cem_weights], noabsorb vce(cluster StateName)

test StateRateWages + StateRateWagesxprogressive = 0


use "$path/StateNames4.dta" , clear

*3% and 250k or higher
gen progressive = 0
replace progressive = 0 if AR == 1
replace progressive = 0 if AZ == 1
replace progressive = 1 if CA == 1
replace progressive = 0 if CO == 1
replace progressive = 0 if DE == 1
replace progressive = 0 if FL == 1
replace progressive = 0 if GA == 1
replace progressive = 0 if IA == 1
replace progressive = 0 if ID == 1
replace progressive = 0 if IL == 1
replace progressive = 0 if IN == 1
replace progressive = 0 if KS == 1
replace progressive = 0 if KY == 1
replace progressive = 0 if LA == 1
replace progressive = 0 if MA == 1
replace progressive = 1 if MD == 1
replace progressive = 0 if MT == 1
replace progressive = 0 if MI == 1
replace progressive = 1 if MN == 1
replace progressive = 0 if NE == 1
replace progressive = 0 if ND == 1
replace progressive = 0 if NM == 1
replace progressive = 0 if NV == 1
replace progressive = 1 if NJ == 1
replace progressive = 1 if NY == 1
replace progressive = 0 if NC == 1
replace progressive = 0 if OH == 1
replace progressive = 0 if OK == 1
replace progressive = 1 if OR == 1
replace progressive = 0 if PA == 1
replace progressive = 0 if SC == 1
replace progressive = 0 if TN == 1
replace progressive = 0 if TX == 1
replace progressive = 0 if VA == 1
replace progressive = 0 if WA == 1
replace progressive = 0 if WV == 1
replace progressive = 0 if WY == 1

keep if USA == 1

cem StateRateWages, treatment(progressive) showbreaks
gen StateRateWagesxprogressive = StateRateWages*progressive

keep if year < 2018

reghdfe runnerratio StateRateWages StateRateWagesxprogressive progressive purseratio stakeratio weatherbi i.year i.dayofweeknum [weight=cem_weights], noabsorb vce(cluster StateName)

test StateRateWages + StateRateWagesxprogressive = 0



/*Table 6 Alt DV*/
use "$path/StateNames4.dta" , clear

gen post_change = 0
replace post_change = 1 if year > 2017

keep if year > 2012
winsor2 highdayrunners, replace cuts (1 99) by(trackid)
gen interaction = post_change*USA

ppmlhdfe highdayrunners interaction weatherbi spurseratio daystake i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackid)

cem purseratio stakeratio, treatment(USA) showbreaks 

ppmlhdfe highdayrunners interaction weatherbi spurseratio daystake i.year i.dayofweeknum [weight=cem_weights], absorb(trackidnum) vce(cluster trackid)

keep if trackid == "DUN" | trackid == "YAV" | trackid == "GIL" | trackid == "ATH" | trackid == "YD" | trackid == "GF" | trackid == "RIL" | trackid == "BOI" | trackid == "BTP" | trackid == "TDN" | trackid == "DED" | trackid == "CBY" | trackid == "AP" | trackid == "AQU" | trackid == "MTH" | USA == 0

ppmlhdfe highdayrunners interaction weatherbi spurseratio daystake i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackid)




/*Table 7 Race Level*/

use "$path/StateNames3.dta" , clear

tab racetype
drop if year == 2020
replace trackid = "SA" if trackid == "OSA"
replace trackid = "HOL" if trackid == "OTH"
replace trackid = "HOL" if trackid == "BHP"
replace trackid = "FAX" if trackid == "BSR"
keep if year > 2012

keep if racetype == "STK" | racetype == "AOC" | racetype == "ALW" | racetype == "OCL" 

winsor2 runners purse, cuts(1 99) replace by(trackid)

gen stakes = 0 
replace stakes = 1 if racetype == "STK"

bys trackidnum: egen nstkTY = sum(stakes)

keep if (nstkTY) >= 70

gen lnpurse = ln(purse)

gen post_change = 0
replace post_change = 1 if year > 2017

gen weatherburn = 0
replace weatherburn = 1 if weather == "O" | weather == "R" | weather == "S"
bys date trackid: egen weatherbi = max(weatherburn)

gen post_changexUSA = post_change*USA
gen USAxstake = USA*stakes
gen post_changexstakexUSA = post_change*stakes*USA
gen post_changexstake = post_change*stakes

ppmlhdfe runners post_changexstakexUSA post_changexUSA post_changexstake USAxstake stakes lnpurse weatherbi i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackidnum)


/*Table 8 Droping High Stakes*/
use "$path/StateNames3.dta" , clear

drop if year == 2020
replace trackid = "SA" if trackid == "OSA"
replace trackid = "HOL" if trackid == "OTH"
replace trackid = "HOL" if trackid == "BHP"
replace trackid = "FAX" if trackid == "BSR"

keep if racetype == "STK" | racetype == "AOC" | racetype == "ALW" | racetype == "OCL"

gen stakes = 0 
replace stakes = 1 if racetype == "STK"
gen allo = 0 
replace allo = 1 if racetype != "STK"
gen n = 1

drop if grade == 1

gen highrunners = 0
replace highrunners = runners if stakes == 1

gen c = 1
gen spurse = 0
replace spurse = purse if stakes == 1
gen apurse = 0
replace apurse = purse if stakes == 0

bys date trackid: egen highdayrunners = sum(highrunners)
bys date trackid: egen dayrunners = sum(runners)
bys date trackid: egen dayraces = sum(c)
bys date trackid: egen sdaypurse = sum(spurse)
bys date trackid: egen adaypurse = sum(apurse)
bys date trackid: egen daystake = sum(stakes)

gen stakeratio = daystake/(dayraces-daystake)
gen runnerratio = highdayrunners/dayrunners
gen spurseratio = sdaypurse/daystake
gen apurseratio = adaypurse/(dayraces - daystake)
gen purseratio = spurseratio/apurseratio

egen statenum=group(StateName)

gen weatherburn = 0
replace weatherburn = 1 if weather == "O" | weather == "R" | weather == "S"

bys date trackid: egen weatherbi = max(weatherburn)

duplicates drop date trackid, force

drop if runnerratio == 0
drop if runnerratio == .
drop if runnerratio == 1

winsor2 apurseratio spurseratio purseratio stakeratio, replace cuts(1 99) by(trackid)

gen post_change = 0
replace post_change = 1 if year > 2017

keep if year > 2012

gen interaction = post_change*USA

reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackid) vce(cluster trackid)

cem purseratio stakeratio, treatment(USA) showbreaks 


reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum [weight=cem_weights], absorb(trackidnum) vce(cluster trackidnum)


keep if trackid == "DUN" | trackid == "YAV" | trackid == "GIL" | trackid == "ATH" | trackid == "YD" | trackid == "GF" | trackid == "RIL" | trackid == "BOI" | trackid == "BTP" | trackid == "TDN" | trackid == "DED" | trackid == "CBY" | trackid == "AP" | trackid == "AQU" | trackid == "MTH" | USA == 0

reghdfe runnerratio interaction purseratio stakeratio weatherbi i.year i.dayofweeknum, absorb(trackidnum) vce(cluster trackidnum)






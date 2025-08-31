%let pgm=utl-using-r-type-seven-quantiles-function-to-fill-a-sas-iml-gap;

%stop_submission;

Using r type seven quantiles function to fill a sas iml gap

Two solutions
  1 six input obs
  2 one input ob

    X
19967.95
19271.69
16525.20
 6885.50
 3442.75

quantiles<-quantile(have$X, probs =
  c(
    0.125
   ,0.25
   ,0.375
   ,0.5,
    0.625
   ,0.75
   ,0.875
   ,1.0), type = 7)

QUANTILE      VALUE
 12.5%       5164.13
 25%         6885.50
 37.5%      11705.35
 50%        16525.20
 62.5%      17898.45
 75%        19271.69
 87.5%      19619.82
 100%       19967.95

CONTENTS
  1 quantiles 5 obs
  2 quantiles 1 ob
  3 comments


github
https://tinyurl.com/4c9fjcd8
https://github.com/rogerjdeangelis/utl-using-r-type-seven-quantiles-function-to-fill-a-sas-iml-gap

sas communities
https://tinyurl.com/kw6npdbc
https://communities.sas.com/t5/Statistical-Procedures/Percentiles-with-PROC-UNIVARIATE/m-p/753595#M36664


/**************************************************************************************************************************/
/* INPUTS                        | PROCESS                                      | OUTPUT                                  */
/* =====                         | =======                                      | ======                                  */
/* WORK.HAVE5 | WORK.HAVE1       | 1 FIVE INPUT OBS                             | R                                       */
/*    X       |    X             | ================                             | QUANTILE     VALUE                      */
/* 19967.95   | 19967.95         |                                              |    12.5%  5164.125                      */
/* 19271.69   |                  | proc datasets lib=sd1                        |      25%  6885.500                      */
/* 16525.20   |                  | nolist nodetails;                            |    37.5% 11705.350                      */
/* 6885.50    |                  |  delete want;                                |      50% 16525.200                      */
/* 3442.75    |                  | run;quit;                                    |    62.5% 17898.445                      */
/*            |                  |                                              |      75% 19271.690                      */
/* options                       | %utl_rbeginx;                                |    87.5% 19619.820                      */
/* validvarname=upcase;          | parmcards4;                                  |     100% 19967.950                      */
/* libname sd1 "d:/sd1";         | library(haven)                               |                                         */
/* data sd1.have5;               |  library(sqldf)                              |                                         */
/*  input x;                     | source("c:/oto/fn_tosas9x.R")                | SAS                                     */
/* cards4;                       | have<-read_sas("d:/sd1/have5.sas7bdat")      |                                         */
/* 19967.95                      | print(have)                                  | QUANTILE   VALUE                        */
/* 19271.69                      | quantiles<-quantile(have$X, probs =          |                                         */
/* 16525.2                       |   c(0.125,0.25,0.375,0.5,                    |  12.5%    5164.13                       */
/* 6885.5                        |     0.625,0.75,0.875,1.0), type = 7)         |  25%      6885.50                       */
/* 3442.75                       | want <- data.frame(                          |  37.5%   11705.35                       */
/* ;;;;                          |   QUANTILE = names(quantiles),               |  50%     16525.20                       */
/* run;quit;                     |   VALUE = unname(quantiles),                 |  62.5%   17898.45                       */
/*                               |   row.names = NULL                           |  75%     19271.69                       */
/* data sd1.have1;               |  )                                           |  87.5%   19619.82                       */
/*  input x;                     | print(want)                                  |  100%    19967.95                       */
/* cards4;                       | fn_tosas9x(                                  |                                         */
/* 19967.95                      |       inp    = want                          |                                         */
/* ;;;;                          |      ,outlib ="d:/sd1/"                      |                                         */
/* run;quit;                     |      ,outdsn ="want"                         |                                         */
/*                               |      )                                       |                                         */
/*                               | ;;;;                                         |                                         */
/*                               | %utl_rendx;                                  |                                         */
/*                               |                                              |                                         */
/*                               | proc print data=sd1.want;                    |                                         */
/*                               | run;quit;                                    |                                         */
/*                               |                                              |                                         */
/*                               |----------------------------------------------------------------------------------------*/
/*                               | 2 ONE INPUT OB                               | R                                       */
/*                               | ===============                              | QUANTILE    VALUE                       */
/*                               | same as above with different input sas table |    12.5% 19967.95                       */
/*                               |                                              |      25% 19967.95                       */
/*                               |                                              |    37.5% 19967.95                       */
/*                               |                                              |      50% 19967.95                       */
/*                               |                                              |    62.5% 19967.95                       */
/*                               |                                              |      75% 19967.95                       */
/*                               |                                              |    87.5% 19967.95                       */
/*                               |                                              |     100% 19967.95                       */
/*                               |                                              |                                         */
/*                               |                                              |  SAS                                    */
/*                               |                                              |  QUANTILE   VALUE                       */
/*                               |                                              |                                         */
/*                               |                                              |   12.5%   19967.95                      */
/*                               |                                              |   25%     19967.95                      */
/*                               |                                              |   37.5%   19967.95                      */
/*                               |                                              |   50%     19967.95                      */
/*                               |                                              |   62.5%   19967.95                      */
/*                               |                                              |   75%     19967.95                      */
/*                               |                                              |   87.5%   19967.95                      */
/*                               |                                              |   100%    19967.95                      */
/**************************************************************************************************************************/

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options
validvarname=upcase;
libname sd1 "d:/sd1";
data sd1.have5;
 input x;
cards4;
19967.95
19271.69
16525.2
6885.5
3442.75
;;;;
run;quit;

data sd1.have1;
 input x;
cards4;
19967.95
;;;;
run;quit;

/**************************************************************************************************************************/
/*    X       |    X                                                                                                      */
/* 19967.95   | 19967.95                                                                                                  */
/* 19271.69   |                                                                                                           */
/* 16525.20   |                                                                                                           */
/* 6885.50    |                                                                                                           */
/* 3442.75    |
/*************************************************************************************************************************

/*                           _   _ _             ____          _
/ |   __ _ _   _  __ _ _ __ | |_(_) | ___  ___  | ___|    ___ | |__  ___
| |  / _` | | | |/ _` | `_ \| __| | |/ _ \/ __| |___ \   / _ \| `_ \/ __|
| | | (_| | |_| | (_| | | | | |_| | |  __/\__ \  ___) | | (_) | |_) \__ \
|_|  \__, |\__,_|\__,_|_| |_|\__|_|_|\___||___/ |____/   \___/|_.__/|___/
        |_|
*/

proc datasets lib=sd1
nolist nodetails;
 delete want;
run;quit;

%utl_rbeginx;
parmcards4;
library(haven)
 library(sqldf)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have5.sas7bdat")
print(have)
quantiles<-quantile(have$X, probs =
  c(0.125,0.25,0.375,0.5,
    0.625,0.75,0.875,1.0), type = 7)
want <- data.frame(
  QUANTILE = names(quantiles),
  VALUE = unname(quantiles),
  row.names = NULL
 )
print(want)
fn_tosas9x(
      inp    = want
     ,outlib ="d:/sd1/"
     ,outdsn ="want"
     )
;;;;
%utl_rendx;

proc print data=sd1.want;
run;quit;

/**************************************************************************************************************************/
/*  R                    | SAS                                                                                            */
/* QUANTILE     VALUE   | QUANTILE      VALUE                                                                             */
/*                      |                                                                                                 */
/*    12.5%  5164.125   |  12.5%       5164.13                                                                            */
/*      25%  6885.500   |  25%         6885.50                                                                            */
/*    37.5% 11705.350   |  37.5%      11705.35                                                                            */
/*      50% 16525.200   |  50%        16525.20                                                                            */
/*    62.5% 17898.445   |  62.5%      17898.45                                                                            */
/*      75% 19271.690   |  75%        19271.69                                                                            */
/*    87.5% 19619.820   |  87.5%      19619.82                                                                            */
/*     100% 19967.950   |  100%       19967.95                                                                            */
/**************************************************************************************************************************/

/*___                            _   _ _             _         _
|___ \    __ _ _   _  __ _ _ __ | |_(_) | ___  ___  / |   ___ | |__
  __) |  / _` | | | |/ _` | `_ \| __| | |/ _ \/ __| | |  / _ \| `_ \
 / __/  | (_| | |_| | (_| | | | | |_| | |  __/\__ \ | | | (_) | |_) |
|_____|  \__, |\__,_|\__,_|_| |_|\__|_|_|\___||___/ |_|  \___/|_.__/
                                              _
 ___  __ _ _ __ ___   ___    __ _ ___    __ _| |__   _____   _____
/ __|/ _` | `_ ` _ \ / _ \  / _` / __|  / _` | `_ \ / _ \ \ / / _ \
\__ \ (_| | | | | | |  __/ | (_| \__ \ | (_| | |_) | (_) \ V /  __/
|___/\__,_|_| |_| |_|\___|  \__,_|___/  \__,_|_.__/ \___/ \_/ \___|

*/

/*____                                            _
|___ /    ___ ___  _ __ ___  _ __ ___   ___ _ __ | |_ ___
  |_ \   / __/ _ \| `_ ` _ \| `_ ` _ \ / _ \ `_ \| __/ __|
 ___) | | (_| (_) | | | | | | | | | | |  __/ | | | |_\__ \
|____/   \___\___/|_| |_| |_|_| |_| |_|\___|_| |_|\__|___/

*/

SOAPBOX ON
  Isusue with R and more so with Python is interfacing with other languages.
  It fook me 5 minutes to create the 'named number' structure with the quantiles.
  After creating the 'named number' it took me about 30 minutes
  to figure out how to conver the named range to a r dataframe that I could send to other languages..
  R and Python need is a package that will help convert the many
  data types and data stucture to ODBC like compliant tables.
SOPABOX OFF

https://communities.sas.com/t5/Statistical-Procedures/Percentiles-with-PROC-UNIVARIATE/m-p/753595#M36664

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/

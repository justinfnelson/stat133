HW\_02 - Justin Nelson
================

``` r
dat <- read.csv(file="nba2017-player-statistics.csv")
colnames(dat)
```

    ##  [1] "Player"       "Team"         "Position"     "Experience"  
    ##  [5] "Salary"       "Rank"         "Age"          "GP"          
    ##  [9] "GS"           "MIN"          "FGM"          "FGA"         
    ## [13] "Points3"      "Points3_atts" "Points2"      "Points2_atts"
    ## [17] "FTM"          "FTA"          "OREB"         "DREB"        
    ## [21] "AST"          "STL"          "BLK"          "TO"

``` r
position <- factor(c('C', 'PF', 'PG', 'SF', 'SG'))
position
```

    ## [1] C  PF PG SF SG
    ## Levels: C PF PG SF SG

``` r
dat <- read.csv(file="nba2017-player-statistics.csv", colClasses = c('character', 'character', "factor", 'character', 'double', rep("integer", 19)))

str(dat)
```

    ## 'data.frame':    441 obs. of  24 variables:
    ##  $ Player      : chr  "Al Horford" "Amir Johnson" "Avery Bradley" "Demetrius Jackson" ...
    ##  $ Team        : chr  "BOS" "BOS" "BOS" "BOS" ...
    ##  $ Position    : Factor w/ 5 levels "C","PF","PG",..: 1 2 5 3 4 3 4 5 4 2 ...
    ##  $ Experience  : chr  "9" "11" "6" "R" ...
    ##  $ Salary      : num  26540100 12000000 8269663 1450000 1410598 ...
    ##  $ Rank        : int  4 6 5 15 11 1 3 13 8 10 ...
    ##  $ Age         : int  30 29 26 22 31 27 26 21 20 29 ...
    ##  $ GP          : int  68 80 55 5 47 76 72 29 78 78 ...
    ##  $ GS          : int  68 77 55 0 0 76 72 0 20 6 ...
    ##  $ MIN         : int  2193 1608 1835 17 538 2569 2335 220 1341 1232 ...
    ##  $ FGM         : int  379 213 359 3 95 682 333 25 192 114 ...
    ##  $ FGA         : int  801 370 775 4 232 1473 720 58 423 262 ...
    ##  $ Points3     : int  86 27 108 1 39 245 157 12 46 45 ...
    ##  $ Points3_atts: int  242 66 277 1 111 646 394 35 135 130 ...
    ##  $ Points2     : int  293 186 251 2 56 437 176 13 146 69 ...
    ##  $ Points2_atts: int  559 304 498 3 121 827 326 23 288 132 ...
    ##  $ FTM         : int  108 67 68 3 33 590 176 6 85 26 ...
    ##  $ FTA         : int  135 100 93 6 41 649 217 9 124 37 ...
    ##  $ OREB        : int  95 117 65 2 17 43 48 6 45 60 ...
    ##  $ DREB        : int  369 248 269 2 68 162 367 20 175 213 ...
    ##  $ AST         : int  337 140 121 3 33 449 155 4 64 71 ...
    ##  $ STL         : int  52 52 68 0 9 70 72 10 35 26 ...
    ##  $ BLK         : int  87 62 11 0 7 13 23 2 18 17 ...
    ##  $ TO          : int  116 77 88 0 25 210 79 4 68 39 ...

``` r
library(readr)
data <- read_csv(file="nba2017-player-statistics.csv", col_types = list(Position = col_factor(c('C', 'PF', 'PG', 'SG', 'SF'))))
str(data)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    441 obs. of  24 variables:
    ##  $ Player      : chr  "Al Horford" "Amir Johnson" "Avery Bradley" "Demetrius Jackson" ...
    ##  $ Team        : chr  "BOS" "BOS" "BOS" "BOS" ...
    ##  $ Position    : Factor w/ 5 levels "C","PF","PG",..: 1 2 4 3 5 3 5 4 5 2 ...
    ##  $ Experience  : chr  "9" "11" "6" "R" ...
    ##  $ Salary      : num  26540100 12000000 8269663 1450000 1410598 ...
    ##  $ Rank        : int  4 6 5 15 11 1 3 13 8 10 ...
    ##  $ Age         : int  30 29 26 22 31 27 26 21 20 29 ...
    ##  $ GP          : int  68 80 55 5 47 76 72 29 78 78 ...
    ##  $ GS          : int  68 77 55 0 0 76 72 0 20 6 ...
    ##  $ MIN         : int  2193 1608 1835 17 538 2569 2335 220 1341 1232 ...
    ##  $ FGM         : int  379 213 359 3 95 682 333 25 192 114 ...
    ##  $ FGA         : int  801 370 775 4 232 1473 720 58 423 262 ...
    ##  $ Points3     : int  86 27 108 1 39 245 157 12 46 45 ...
    ##  $ Points3_atts: int  242 66 277 1 111 646 394 35 135 130 ...
    ##  $ Points2     : int  293 186 251 2 56 437 176 13 146 69 ...
    ##  $ Points2_atts: int  559 304 498 3 121 827 326 23 288 132 ...
    ##  $ FTM         : int  108 67 68 3 33 590 176 6 85 26 ...
    ##  $ FTA         : int  135 100 93 6 41 649 217 9 124 37 ...
    ##  $ OREB        : int  95 117 65 2 17 43 48 6 45 60 ...
    ##  $ DREB        : int  369 248 269 2 68 162 367 20 175 213 ...
    ##  $ AST         : int  337 140 121 3 33 449 155 4 64 71 ...
    ##  $ STL         : int  52 52 68 0 9 70 72 10 35 26 ...
    ##  $ BLK         : int  87 62 11 0 7 13 23 2 18 17 ...
    ##  $ TO          : int  116 77 88 0 25 210 79 4 68 39 ...
    ##  - attr(*, "spec")=List of 2
    ##   ..$ cols   :List of 24
    ##   .. ..$ Player      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Team        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Position    :List of 3
    ##   .. .. ..$ levels    : chr  "C" "PF" "PG" "SG" ...
    ##   .. .. ..$ ordered   : logi FALSE
    ##   .. .. ..$ include_na: logi FALSE
    ##   .. .. ..- attr(*, "class")= chr  "collector_factor" "collector"
    ##   .. ..$ Experience  : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_character" "collector"
    ##   .. ..$ Salary      : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_double" "collector"
    ##   .. ..$ Rank        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Age         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ GP          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ GS          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ MIN         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FGM         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FGA         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points3     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points3_atts: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points2     : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ Points2_atts: list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FTM         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ FTA         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ OREB        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ DREB        : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ AST         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ STL         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ BLK         : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   .. ..$ TO          : list()
    ##   .. .. ..- attr(*, "class")= chr  "collector_integer" "collector"
    ##   ..$ default: list()
    ##   .. ..- attr(*, "class")= chr  "collector_guess" "collector"
    ##   ..- attr(*, "class")= chr "col_spec"

``` r
data$Experience <- gsub('R', 1, data$Experience)
data <- transform(data, Experience = as.integer(Experience))
str(data)
```

    ## 'data.frame':    441 obs. of  24 variables:
    ##  $ Player      : chr  "Al Horford" "Amir Johnson" "Avery Bradley" "Demetrius Jackson" ...
    ##  $ Team        : chr  "BOS" "BOS" "BOS" "BOS" ...
    ##  $ Position    : Factor w/ 5 levels "C","PF","PG",..: 1 2 4 3 5 3 5 4 5 2 ...
    ##  $ Experience  : int  9 11 6 1 9 5 4 2 1 6 ...
    ##  $ Salary      : num  26540100 12000000 8269663 1450000 1410598 ...
    ##  $ Rank        : int  4 6 5 15 11 1 3 13 8 10 ...
    ##  $ Age         : int  30 29 26 22 31 27 26 21 20 29 ...
    ##  $ GP          : int  68 80 55 5 47 76 72 29 78 78 ...
    ##  $ GS          : int  68 77 55 0 0 76 72 0 20 6 ...
    ##  $ MIN         : int  2193 1608 1835 17 538 2569 2335 220 1341 1232 ...
    ##  $ FGM         : int  379 213 359 3 95 682 333 25 192 114 ...
    ##  $ FGA         : int  801 370 775 4 232 1473 720 58 423 262 ...
    ##  $ Points3     : int  86 27 108 1 39 245 157 12 46 45 ...
    ##  $ Points3_atts: int  242 66 277 1 111 646 394 35 135 130 ...
    ##  $ Points2     : int  293 186 251 2 56 437 176 13 146 69 ...
    ##  $ Points2_atts: int  559 304 498 3 121 827 326 23 288 132 ...
    ##  $ FTM         : int  108 67 68 3 33 590 176 6 85 26 ...
    ##  $ FTA         : int  135 100 93 6 41 649 217 9 124 37 ...
    ##  $ OREB        : int  95 117 65 2 17 43 48 6 45 60 ...
    ##  $ DREB        : int  369 248 269 2 68 162 367 20 175 213 ...
    ##  $ AST         : int  337 140 121 3 33 449 155 4 64 71 ...
    ##  $ STL         : int  52 52 68 0 9 70 72 10 35 26 ...
    ##  $ BLK         : int  87 62 11 0 7 13 23 2 18 17 ...
    ##  $ TO          : int  116 77 88 0 25 210 79 4 68 39 ...

``` r
data$Missed_FG <- data$FGA - data$FGM
data$Missed_FT <- data$FTA - data$FTM
data$PTS <- (data$Points2 * 2) + (data$FTM * 1) + (data$Points3 * 3)
data$REB <- data$OREB + data$DREB
data$MPG <- data$MIN / data$GP
data$EFF <- (data$PTS + data$REB + data$AST + data$STL + data$BLK - data$Missed_FG - data$Missed_FT - data$TO) / data$GP
summary(data$EFF)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##  -0.600   5.452   9.090  10.140  13.250  33.840

``` r
hist(data$EFF)
```

![](HW_02__-_Justin_Nelson_files/figure-markdown_github/unnamed-chunk-4-1.png)

``` r
top_10 <- slice(arrange(select(data, Player, Team, Salary, EFF), desc(EFF)), 1:10)
top_10
```

    ##                   Player Team   Salary      EFF
    ## 1      Russell Westbrook  OKC 26540100 33.83951
    ## 2           James Harden  HOU 26540100 32.34568
    ## 3          Anthony Davis  NOP 22116750 31.16000
    ## 4           LeBron James  CLE 30963450 30.97297
    ## 5     Karl-Anthony Towns  MIN  5960160 30.32927
    ## 6           Kevin Durant  GSW 26540100 30.19355
    ## 7  Giannis Antetokounmpo  MIL  2995421 28.37500
    ## 8       DeMarcus Cousins  NOP 16957900 27.94118
    ## 9           Jimmy Butler  CHI 17552209 25.60526
    ## 10      Hassan Whiteside  MIA 22116750 25.36364

``` r
neg <- select(filter(data, EFF < 0), Player, EFF)
neg
```

    ##            Player  EFF
    ## 1 Patricio Garino -0.6

``` r
cpts <- cor(data$EFF, data$PTS)
creb <- cor(data$EFF, data$REB)
cast <- cor(data$EFF, data$AST)
cblk <- cor(data$EFF, data$BLK)
cmfg <- -cor(data$EFF, data$Missed_FG)
cmft <- -cor(data$EFF, data$Missed_FT)
cto <- -cor(data$EFF, data$TO)
cgp <- cor(data$EFF, data$GP)

cpts
```

    ## [1] 0.8588644

``` r
creb
```

    ## [1] 0.7634501

``` r
cast
```

    ## [1] 0.6689232

``` r
cblk
```

    ## [1] 0.5679571

``` r
cmfg
```

    ## [1] -0.7722477

``` r
cmft
```

    ## [1] -0.7271456

``` r
cto
```

    ## [1] -0.8003289

``` r
cgp
```

    ## [1] 0.4773648

``` r
correlations <- sort((c(cpts, creb, cast, cblk, cmfg, cmft, cto)), decreasing = TRUE)
correlations
```

    ## [1]  0.8588644  0.7634501  0.6689232  0.5679571 -0.7271456 -0.7722477
    ## [7] -0.8003289

``` r
barplot(correlations, names.arg = c('points', 'rebs', 'asst', 'blocks', 'mfg', 'mft', 'TO'))
```

![](HW_02__-_Justin_Nelson_files/figure-markdown_github/unnamed-chunk-4-2.png)

``` r
eff_salary_graph <- ggplot(data, aes(x = EFF, y = Salary)) + geom_point() + geom_smooth(method = "loess")
eff_salary_graph
```

![](HW_02__-_Justin_Nelson_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
eff_salary_corr <- cor(data$EFF, data$Salary)
eff_salary_corr
```

    ## [1] 0.655624

``` r
#This graph and the correlation tells us that there is a positive, and somewhat strong correlation between EFF and salary - aka, the better a player is as determined by the EFF metric, they get paid more.

players2 <- filter(data, MPG > 20)
players2_graph <- ggplot(players2, aes(x = EFF, y = Salary)) + geom_point() + geom_smooth(method = "loess")
players2_graph
```

![](HW_02__-_Justin_Nelson_files/figure-markdown_github/unnamed-chunk-5-2.png)

``` r
players2_cor <- cor(players2$EFF, players2$Salary)
players2_cor
```

    ## [1] 0.5367224

``` r
#To my surprise, there is actually a lower correlation between "established" players EFF and salary. Upon further thought, this makes sense because teams are likely willing to pay high-promising rookies a huge amount of money to lock them in, despite them not proving their worth in the NBA yet. Those who are more established have lower long-term potential due to their age, and also the "hype" around them has probably diminished.
```

Nothing was exceptionally hard.

Grasping ggplot was easy after doing today's lab.

Like homework 1, I referenced online internet forums like stackexchange a lot to help me out with syntax to complete problems in this homework.

About 2.5 hours.

It was all about equally distributed.

Nothing stumped me entirely.

Nothing frustrating in particular.

This analysis and the results that came out of them were actually pretty interesting and not something I expected. I genuinely enjoyed this assignment.

hw01-Justin-Nelson
================

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this

``` r
# load data file
load("data/nba2017-salary-points.RData")
# list the available objects
ls()
```

    ## [1] "experience" "player"     "points"     "points1"    "points2"   
    ## [6] "points3"    "position"   "salary"     "team"

``` r
salary_millions <- round(salary / 1000000, digits = 2)

experience <- gsub("R", 0, experience)
experience <- as.integer(experience)
class(experience)
```

    ## [1] "integer"

``` r
position <- as.factor(position)
class(position)
```

    ## [1] "factor"

``` r
library(plyr)
position <- revalue(position, c("C" = "center", "SF" = "small_fwd", "PF" = "power_fd", "SG" = "shoot_guard", "PG" = "point_guard"))
position
```

    ##   [1] center      power_fd    shoot_guard point_guard small_fwd  
    ##   [6] point_guard small_fwd   shoot_guard small_fwd   power_fd   
    ##  [11] power_fd    center      shoot_guard point_guard center     
    ##  [16] center      small_fwd   point_guard power_fd    center     
    ##  [21] shoot_guard shoot_guard small_fwd   point_guard power_fd   
    ##  [26] shoot_guard point_guard small_fwd   small_fwd   center     
    ##  [31] small_fwd   shoot_guard point_guard shoot_guard small_fwd  
    ##  [36] point_guard center      center      point_guard center     
    ##  [41] shoot_guard small_fwd   power_fd    power_fd    power_fd   
    ##  [46] small_fwd   shoot_guard point_guard power_fd    center     
    ##  [51] center      center      point_guard center      power_fd   
    ##  [56] small_fwd   shoot_guard shoot_guard point_guard small_fwd  
    ##  [61] point_guard center      power_fd    point_guard small_fwd  
    ##  [66] power_fd    point_guard small_fwd   center      power_fd   
    ##  [71] power_fd    small_fwd   shoot_guard small_fwd   center     
    ##  [76] power_fd    shoot_guard center      small_fwd   shoot_guard
    ##  [81] point_guard power_fd    power_fd    shoot_guard power_fd   
    ##  [86] center      shoot_guard point_guard center      small_fwd  
    ##  [91] power_fd    point_guard point_guard power_fd    shoot_guard
    ##  [96] power_fd    shoot_guard center      small_fwd   power_fd   
    ## [101] power_fd    shoot_guard power_fd    point_guard center     
    ## [106] shoot_guard shoot_guard shoot_guard point_guard small_fwd  
    ## [111] center      point_guard power_fd    small_fwd   point_guard
    ## [116] center      shoot_guard point_guard center      power_fd   
    ## [121] power_fd    shoot_guard small_fwd   small_fwd   power_fd   
    ## [126] shoot_guard point_guard center      shoot_guard center     
    ## [131] center      center      point_guard center      shoot_guard
    ## [136] power_fd    point_guard power_fd    shoot_guard small_fwd  
    ## [141] shoot_guard small_fwd   point_guard small_fwd   power_fd   
    ## [146] point_guard point_guard power_fd    power_fd    center     
    ## [151] shoot_guard power_fd    point_guard shoot_guard power_fd   
    ## [156] small_fwd   center      shoot_guard point_guard shoot_guard
    ## [161] small_fwd   point_guard shoot_guard point_guard center     
    ## [166] shoot_guard power_fd    center      power_fd    center     
    ## [171] power_fd    small_fwd   shoot_guard shoot_guard center     
    ## [176] small_fwd   center      point_guard point_guard small_fwd  
    ## [181] point_guard shoot_guard power_fd    shoot_guard shoot_guard
    ## [186] small_fwd   center      shoot_guard center      small_fwd  
    ## [191] power_fd    power_fd    shoot_guard center      point_guard
    ## [196] center      small_fwd   shoot_guard center      small_fwd  
    ## [201] point_guard center      point_guard center      small_fwd  
    ## [206] power_fd    shoot_guard center      small_fwd   point_guard
    ## [211] point_guard shoot_guard center      small_fwd   power_fd   
    ## [216] shoot_guard small_fwd   shoot_guard point_guard power_fd   
    ## [221] small_fwd   center      center      power_fd    shoot_guard
    ## [226] power_fd    center      small_fwd   center      shoot_guard
    ## [231] small_fwd   shoot_guard point_guard point_guard center     
    ## [236] shoot_guard shoot_guard power_fd    power_fd    point_guard
    ## [241] center      center      shoot_guard small_fwd   shoot_guard
    ## [246] power_fd    shoot_guard point_guard center      point_guard
    ## [251] point_guard center      center      shoot_guard point_guard
    ## [256] point_guard power_fd    shoot_guard center      shoot_guard
    ## [261] power_fd    small_fwd   small_fwd   small_fwd   small_fwd  
    ## [266] shoot_guard power_fd    power_fd    power_fd    point_guard
    ## [271] center      center      shoot_guard shoot_guard small_fwd  
    ## [276] center      small_fwd   point_guard small_fwd   shoot_guard
    ## [281] power_fd    point_guard power_fd    point_guard small_fwd  
    ## [286] center      small_fwd   small_fwd   power_fd    point_guard
    ## [291] shoot_guard center      point_guard power_fd    shoot_guard
    ## [296] small_fwd   power_fd    small_fwd   center      small_fwd  
    ## [301] power_fd    small_fwd   power_fd    point_guard point_guard
    ## [306] point_guard center      power_fd    shoot_guard point_guard
    ## [311] power_fd    small_fwd   center      small_fwd   power_fd   
    ## [316] power_fd    center      point_guard shoot_guard shoot_guard
    ## [321] small_fwd   point_guard shoot_guard power_fd    small_fwd  
    ## [326] shoot_guard shoot_guard point_guard power_fd    small_fwd  
    ## [331] small_fwd   center      small_fwd   power_fd    power_fd   
    ## [336] shoot_guard point_guard shoot_guard small_fwd   power_fd   
    ## [341] point_guard shoot_guard shoot_guard point_guard power_fd   
    ## [346] power_fd    shoot_guard center      small_fwd   center     
    ## [351] center      shoot_guard small_fwd   center      center     
    ## [356] small_fwd   power_fd    small_fwd   center      power_fd   
    ## [361] shoot_guard shoot_guard point_guard center      point_guard
    ## [366] small_fwd   point_guard center      shoot_guard point_guard
    ## [371] power_fd    power_fd    center      power_fd    point_guard
    ## [376] power_fd    center      small_fwd   center      point_guard
    ## [381] shoot_guard point_guard power_fd    shoot_guard shoot_guard
    ## [386] shoot_guard point_guard shoot_guard center      center     
    ## [391] point_guard shoot_guard small_fwd   power_fd    point_guard
    ## [396] small_fwd   center      power_fd    small_fwd   shoot_guard
    ## [401] center      power_fd    center      center      point_guard
    ## [406] power_fd    small_fwd   point_guard small_fwd   point_guard
    ## [411] shoot_guard small_fwd   small_fwd   point_guard shoot_guard
    ## [416] center      shoot_guard power_fd    power_fd    small_fwd  
    ## [421] small_fwd   shoot_guard center      power_fd    center     
    ## [426] point_guard center      center      shoot_guard small_fwd  
    ## [431] shoot_guard power_fd    shoot_guard point_guard power_fd   
    ## [436] shoot_guard power_fd    point_guard small_fwd   point_guard
    ## [441] center     
    ## Levels: center power_fd point_guard small_fwd shoot_guard

``` r
table(position)
```

    ## position
    ##      center    power_fd point_guard   small_fwd shoot_guard 
    ##          89          89          85          83          95

``` r
plot(points, salary_millions, main = "Scatter Plot of Points vs Salary", xlab = "Points", ylab = "Salary (in Millions)")
```

![](hw01-Justin-Nelson_files/figure-markdown_github/unnamed-chunk-1-1.png)

``` r
num_individuals <- length(player)
points_mean <- sum(points) / num_individuals
salary_mean <- sum(salary_millions) / num_individuals

points_var <-(1 / (num_individuals - 1)) * sum((points - points_mean) ** 2)


salary_var <-(1 / (num_individuals - 1)) * sum((salary_millions - salary_mean) ** 2)

points_sd <- sqrt(points_var)
salary_sd <- sqrt(salary_var)

cov <- (1 / (num_individuals - 1)) * sum((points - points_mean) * (salary_millions - salary_mean))

correlation <- cov / (points_sd * salary_sd)
correlation
```

    ## [1] 0.6367296

``` r
slope <- correlation * (salary_sd / points_sd)

intercept <- salary_mean - (slope * points_mean)
slope
```

    ## [1] 0.008557567

``` r
predicted_vals <- intercept + (slope * (points))
```

The regression equation is 9.6558805, 5.9590115, 9.1595416, 1.5946523, 3.7511592, 20.3271666, 10.0580861, 2.0909912, 5.9162237, 4.0677892, 1.8342642, 7.3111071, 8.6546451, 5.0176791, 3.0323236, 7.2939919, 1.5860947, 3.0408811, 2.8440571, 1.560422, 6.3612171, 4.5127827, 2.6386755, 2.9296328, 11.2818182, 4.7010491, 17.0496184, 18.2305626, 5.3428667, 6.9003439, 1.6288826, 7.8416762, 2.7927117, 18.7953621, 6.9688044, 2.4247363, 2.9210752, 9.7157834, 13.0104467, 3.6741411, 6.9516893, 2.6985784, 3.4687595, 5.317194, 4.307401, 4.3330737, 16.7329884, 2.2022396, 1.5176342, 1.7144582, 2.9895357, 5.1032548, 16.9554851, 9.0654083, 10.6057704, 10.7084612, 2.2792577, 2.8269419, 3.9479832, 2.3733909, 13.6094764, 10.0837588, 3.8196197, 2.0310882, 8.3636878, 3.7083714, 4.8550853, 2.9553055, 5.2316183, 12.1718052, 1.7230158, 5.3086364, 11.2903758, 17.1865395, 9.6473229, 10.2805828, 4.1362497, 4.8636429, 5.1546002, 8.0727305, 6.4467928, 6.027472, 5.3685394, 2.7242511, 2.2193547, 3.4430868, 7.3538949, 4.2646132, 6.087375, 8.4834938, 1.6887855, 12.2402657, 2.0909912, 3.4944322, 1.877052, 3.023766, 6.9003439, 11.5471028, 16.6987581, 2.0139731, 8.4749362, 1.8599369, 5.2487334, 1.9711852, 4.2132678, 3.9993286, 10.8881701, 3.0579963, 4.6753764, 17.0496184, 2.2707001, 4.050674, 7.8759065, 3.5628927, 6.1130477, 8.6888754, 7.747543, 14.1999486, 12.7109319, 9.8527045, 2.4247363, 6.1216053, 3.1863598, 4.2817283, 2.3477182, 5.7621874, 10.0837588, 1.7743612, 7.0543801, 4.7096067, 10.9651882, 4.6325886, 3.4516443, 3.1435719, 2.5958876, 2.0225306, 7.9957124, 8.0727305, 10.4688493, 10.9651882, 1.5433069, 2.7156936, 7.944367, 4.4100919, 12.8136227, 2.7242511, 1.936955, 1.8085915, 6.977362, 8.9883902, 6.6692896, 1.6631128, 17.1694243, 8.1839789, 8.774451, 7.8673489, 1.7743612, 11.4700847, 4.1790375, 1.9968579, 15.7060804, 2.3220455, 8.6546451, 11.384509, 3.4944322, 6.8917863, 11.7439268, 5.7536299, 3.8624076, 1.8513793, 2.3477182, 5.1460426, 3.3489535, 2.5702149, 6.5323685, 10.2292374, 5.6423815, 3.913753, 6.7805379, 2.2107971, 10.4602918, 11.4957574, 6.9688044, 4.307401, 1.6288826, 4.2218254, 10.8881701, 1.5090766, 1.7059007, 4.0677892, 2.0567609, 10.4089464, 7.174186, 6.5580412, 1.7914763, 6.8746712, 3.2462627, 7.9785973, 6.2927566, 8.9028146, 6.0445872, 2.7755965, 6.2670839, 1.8428217, 5.317194, 1.7658036, 2.3220455, 14.6791723, 5.514018, 6.1558355, 5.9846842, 5.1717153, 5.2915213, 2.5873301, 3.2976081, 4.5641281, 7.2854344, 9.3734807, 5.2059456, 7.5763917, 6.4211201, 1.6716704, 4.2132678, 8.1497487, 6.0189145, 2.767039, 5.5482483, 14.8160934, 2.6643482, 16.4163584, 2.4846393, 3.9223105, 4.8379702, 18.6156531, 5.1546002, 2.3134879, 5.7621874, 6.4382352, 4.1020194, 2.6215603, 4.8208551, 1.7230158, 5.6423815, 17.6657632, 3.6142381, 12.1461325, 5.9333388, 8.00427, 8.2866697, 6.9688044, 2.0396458, 1.6288826, 8.5091665, 11.9236357, 1.5347493, 21.6707046, 1.620325, 4.4443221, 6.0189145, 6.977362, 9.8869348, 5.8220904, 9.5189594, 2.0054155, 2.2450274, 9.1167537, 12.7708349, 4.0078862, 1.5433069, 10.9566306, 10.3148131, 1.5946523, 11.5471028, 10.1351042, 5.6509391, 7.5935068, 2.2022396, 6.1130477, 3.1007841, 3.9308681, 4.4015343, 5.0347942, 5.5824785, 8.6032997, 15.2097415, 2.7584814, 6.4810231, 7.6277371, 1.6973431, 2.3648333, 7.9101368, 11.2390304, 5.1888305, 5.2744061, 4.9834488, 5.9761266, 5.6081512, 2.7499238, 10.3490434, 5.1118123, 1.6288826, 2.2621425, 1.7914763, 1.877052, 23.3993331, 3.0751114, 9.2536748, 3.280493, 10.6400007, 5.1460426, 3.1264568, 3.3061657, 2.0054155, 5.1802729, 7.4052403, 2.9210752, 13.8833186, 13.618034, 7.0115922, 6.2242961, 6.5238109, 2.4161787, 1.9797428, 10.3062555, 6.0617023, 8.7402208, 17.2293273, 18.8295923, 3.22059, 6.5238109, 2.1765669, 4.110577, 8.1240759, 4.940661, 4.307401, 2.3477182, 3.3746262, 1.7743612, 11.3074909, 3.7511592, 6.6692896, 8.7915662, 8.4492635, 7.3881252, 4.1191346, 6.5323685, 2.2193547, 3.6056805, 1.7486885, 11.957866, 1.5433069, 8.5262816, 11.067879, 3.280493, 19.4714099, 1.6032099, 2.253585, 5.2316183, 5.0519094, 2.7927117, 7.4993736, 3.793947, 10.3148131, 2.2364698, 1.9540701, 6.3269869, 5.4797877, 1.9198398, 1.5775372, 5.2487334, 8.0898457, 4.5042251, 5.9247812, 14.4994634, 4.7695097, 1.8513793, 3.1178992, 2.7927117, 3.3318384, 9.1937718, 9.9468377, 5.000564, 5.454115, 5.9162237, 5.7450723, 4.743837, 9.210887, 5.8392055, 2.5702149, 5.5311331, 2.4846393, 2.1851244, 6.3184293, 3.9822135, 7.3367798, 2.9039601, 6.7377501, 2.0482033, 18.0508537, 3.1949173, 2.4076212, 8.4920513, 1.6117674, 19.1462223, 4.0164438, 4.9577761, 1.8941671, 8.6632027, 8.1155184, 3.2976081, 9.1167537, 7.8416762, 2.6130028, 9.9297226, 2.5359847, 3.9394257, 11.8209449, 9.8527045, 5.3514242, 5.1460426, 1.9968579, 8.2781122, 4.7866248, 3.5714503, 4.940661, 2.963863, 4.4699948, 6.7548652, 6.600829, 2.9467479, 16.2794373, 2.7584814, 1.5347493, 13.4040948, 5.2230607, 5.0946972, 7.9529246, 1.6288826, 9.6473229, 5.3086364, 4.9064307

``` r
#Write Up on Regression
summary(predicted_vals)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.509   2.844   5.206   6.187   8.184  23.400

``` r
#I interpet the slope of the coefficient to mean that for every additional point scored, we can expect salary to increase by the value of the slope, which, when adjusted back to its original scale, is 8556.68 (dollars).

#I interpet the intercept term as what the "base" salary is for a player if they were to score 0 points.

predic_0 <- intercept + (slope * (0))
predic_100 <- intercept + (slope * (100))
predic_500 <- intercept + (slope * (500))
predic_1000 <- intercept + (slope * (1000))
predic_2000 <- intercept + (slope * (2000))
predic_0
```

    ## [1] 1.509077

``` r
predic_100
```

    ## [1] 2.364833

``` r
predic_500
```

    ## [1] 5.78786

``` r
predic_1000
```

    ## [1] 10.06664

``` r
predic_2000
```

    ## [1] 18.62421

``` r
plot(points, salary_millions, main = "Scatter Plot of Points vs Salary", xlab = "Points", ylab = "Salary (in Millions)")
abline(intercept, slope, lwd = 2, col = "blue")
lines(lowess(points, salary_millions), col = "red", lwd = 2)
text(2300, 30, "lowess")
text(2300, 15, "regression")
```

![](hw01-Justin-Nelson_files/figure-markdown_github/unnamed-chunk-2-1.png)

``` r
#Residuals
residual <- predicted_vals - salary_millions
summary(residual)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ## -18.810  -2.556   1.095   0.000   2.792  14.190

``` r
rss <- sum((predicted_vals - salary_millions) ** 2)
tss <- sum((salary_millions - salary_mean) ** 2)
r_squared <- 1 - (rss / tss)
r_squared
```

    ## [1] 0.4054246

``` r
#Exploring Position Experience
plot(experience, salary_millions)
lines(lowess(experience, salary_millions), col = "red")
```

![](hw01-Justin-Nelson_files/figure-markdown_github/unnamed-chunk-2-2.png)

``` r
require("scatterplot3d")
```

    ## Loading required package: scatterplot3d

``` r
library("scatterplot3d")

#3d Scatterplot
scatterplot3d(points, experience, salary_millions)
```

![](hw01-Justin-Nelson_files/figure-markdown_github/unnamed-chunk-2-3.png)

``` r
#This 3d Scatterplot allows us to take a further look into players' salaries by looking at 3 variables at once. Instead of only looking at points and salary, we are also now able to compare the amount of experience a player has too, giving more granularity to the greater picture.

#Conditional Boxplot
boxplot(salary_millions ~ position)
```

![](hw01-Justin-Nelson_files/figure-markdown_github/unnamed-chunk-2-4.png)

``` r
#From this, we can see that Centers have the largest interquartile ranges of salaries in terms of
#salary, while power forwards, point guards, and shooting guards all have about the same. Additionally, centers hold the largest majority of the highest paid positions.

#Experience does seem to be related to salary - While it somewhat hard to read a 3d graph on a 2d screen, it appears that as experience increases, salary (generally) does as well.

#Positions does seem to be related to salary, whether it be where the upper quartiles lay, lower quartiles lay, the size of the interquartile range (u,e, center vs power_fd), or where salaries cap out at.

##Reflections / comments
```

1.Nothing was exceptionally hard that we've covered class. 2. Creating scatter plots. 3. Git seems very usable once you learn it, but as of right now I'm still learning the reigns. 4. GitHub is a pretty cool and unique service. Big fan. 5. I needed a lot of help. I spent most of my time on the itnernet this homework on stack exchange looking at how to tackle these problems. 6. A bit over 3 hours. 7. Learning how to use graphing packages and using the proper syntax. 8. No. 9. Yes, some syntax on the graphing commands are so minute, yet the graphs fail unless its perfect. 10. Data analysis is always fun.

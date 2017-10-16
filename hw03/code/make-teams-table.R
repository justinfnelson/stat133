#Title: Data Preparation - Creating consolidated csv file
#Description:
#Input: nba2017-roster.csv, nba2017-stats.csv
#Output: nba2017-teams.csv
library(dplyr)
library(ggplot2)

setwd('Desktop/Junior Fall/Stat 133/stat133-hws-fall17/hw03/code')
getwd()
roster <- read.csv(file = '../data/nba2017-roster.csv', stringsAsFactors = FALSE)
stats <- read.csv(file = '../data/nba2017-stats.csv', stringsAsFactors = FALSE)
colnames(stats)

stats <- stats %>%
  mutate(missed_fg = field_goals_atts - field_goals_made)

stats <- stats %>%
  mutate(missed_ft = points1_atts - points1_made)

stats <- stats %>%
  mutate(points = (points3_made* 3) + (points2_made * 2) + (points1_made * 1))

stats <- stats %>%
  mutate(rebounds = off_rebounds + def_rebounds)

stats <- stats %>% 
  mutate(efficiency = (points + rebounds + assists + steals + blocks - missed_fg - missed_ft - turnovers) / games_played)
colnames(stats)
sink(file = '../output/efficiency-summary.txt')
summary(stats$efficiency)
sink()

dat <- merge(stats, roster)
dat
colnames(dat)

teams <- dat %>%
  group_by(team) %>%
  summarise(
    experience = round(sum(experience), 2),
    salary = round(sum(salary) / 1000000, 2),
    points3 = sum(points3_made),
    points2 = sum(points2_made),
    free_throws = sum(points1_made),
    off_rebounds = sum(off_rebounds),
    def_rebounds = sum(def_rebounds),
    assists = sum(assists),
    steals = sum(steals),
    blocks = sum(blocks),
    turnovers = sum(turnovers),
    fouls = sum(fouls),
    efficiency = sum(efficiency),
    points_total = sum(points3 + points2 + free_throws)
  )

sink(file = '../data/teams-summary.txt')
summary(teams)
sink()
help(write.csv)
write.csv(teams, file = '../data/nba2017-teams.csv')

stars(teams[ ,-1], labels = teams$team)

pdf(file = '../images/teams_star_plot.pdf')
stars(teams[ ,-1], labels = teams$team)
dev.off()

pdf(file = '../images/experience_salary.pdf')
ggplot(teams, aes(x=teams$experience, y=teams$salary)) + geom_point() + geom_text(aes(label = teams$team))
dev.off()



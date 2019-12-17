#Team PRJ

setwd("C:/workR/learnR/project/FinalTeamPRJ/인구")
pop <- read.csv("전출입지 , 나이 별 이동자수 13-18.csv",as.is = T,header = F)
pop
str(pop)
View(pop)
colnames(pop) <- c("전출지","전입지","성별",
                                     "연령별","항목","단위","2013년","2014년","2015년","2016년","2017년","2018년")
dim(pop)
pop <- pop[-1,-13]
pop <- subset(pop,전입지=="제주특별자치도")
pop <- pop[,-1]; pop <- pop[,-2] ; pop <- subset(pop,)
View(pop)
str(pop)
pop <- as.numeric(pop[-1,c(5:10)])
pop
#s1 <- c("0 - 4세","10 - 14세","15 - 19세","20 - 24세","25 - 29세",
#       "30 - 34세","35 - 39세","40 - 44세","45 - 49세","5 - 9세","50 - 54세",
#       "55 - 59세",'60 - 64세','65 - 69세','70 - 74세','75 - 79세','80세이상')
#s2 <- c("이동자수","순이동자수")

pop.s <- pop %>% 
    group_by("연령별","항목") %>% 
    sum(5:10)

View(pop.s)

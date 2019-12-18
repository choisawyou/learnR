#Team PRJ
library(dplyr)
library(ggplot2)
setwd("C:/Bigdata Maestro/learnR/project/FinalTeamPRJ/인구")
pop <- read.csv("시도 각 세별 이동자수 13-18.csv",header = F,as.is = T)
pop
str(pop)
View(pop)
colnames(pop) <- c("행정구역","나이","항목","단위","2013년","2014년","2015년","2016년","2017년","2018년",'na')
dim(pop)
<<<<<<< HEAD
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
=======
pop <- pop[,-11];pop <- pop[-1,-4]
pop.j <- subset(pop,행정구역=="제주특별자치도")
pop.jj <- subset(pop.j,항목=="총전입"|항목 =="시군구간전입") #제주자치도 총전입과 시군구간 전입
View(pop.jj)
 #숫자변환 
str(pop.jj)
pop.jj$`2013년` <- as.numeric(pop.jj$`2013년`);pop.jj$`2014년` <- as.numeric(pop.jj$`2014년`)
pop.jj$`2015년` <- as.numeric(pop.jj$`2015년`);pop.jj$`2016년`<- as.numeric(pop.jj$`2016년`)
pop.jj$`2017년`<- as.numeric(pop.jj$`2017년`);pop.jj$`2018년`<- as.numeric(pop.jj$`2018년`);str(pop.jj)

pop.t <- subset(pop.jj,항목 == "총전입");View(pop.t);dim(pop.t)
pop.c <- subset(pop.jj,항목 == "시군구간전입");View(pop.c);dim(pop.c)
str(pop.t)

total <- pop.t[,c(4:9)];city <- pop.c[,c(4:9)]
net <- total-city
View(net)
#c결합 _ 순수 전입 ( 시도간 제외)
name <- pop.t[,c(1:2)];final <- cbind(name,net);final 
View(final)

#18-34세 청년 인구 전입 
young <- final[c(20:36),];View(young)
sum(young[,3]);sum(young[,4]);sum(young[,5]);sum(young[,6]);sum(young[,7]);sum(young[,8])
row <- c("제주특별자치도","합",23547,24767,25512,27553,27607,27635) #합계
age.1834 <- rbind(young,row) ; dim(age.1834) 
View(age.1834)

#시각화

year <- 2013:2018 ;cnt <- c(23547,24767,25512,27553,27607,27635)
df <- data.frame(year,cnt)
View(df)
>>>>>>> 2ff41f57d6ab9a69e7bded8e7e4edc45fec8a584

ggplot(df,aes(x=year, y = cnt))+
  geom_line(col = "orange", lwd =2)+
  ggtitle("제주 청년층(18~34세) 전입 인구 ") +
  theme( plot.title = element_text(size = 24,
                                   face = "bold",
                                   colour = "Orange"))+
  labs(x = '년도' , y = '전입 청년인구 수')


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

ggplot(df,aes(x=year, y = cnt))+
  geom_line(col = "orange", lwd =2)+
  ggtitle("제주 청년층(18~34세) 전입 인구 ") +theme_void()+
  theme( plot.title = element_text(size = 25,
                                   face = "bold",
                                   colour = "Orange"))+
  labs(x = '년도' , y = '전입 청년인구 수')


#제주 산업별 매출액 16-17

setwd("C:/Bigdata Maestro/learnR/project/FinalTeamPRJ")
income <- read.csv("제주산업별 매출액16-17.csv",header = F,as.is = T)
View(income)
colnames(income) <- c('지역','산업','2016','2017')

#숫자변환
income <- income[-c(1:2),]
income$`2016` <- as.numeric(income$`2016`)
income$`2017` <- as.numeric(income$`2017`)


#========================================================================
#lbl <- c('농업, 임업 및 어업','광업','제조업',' 전기, 가스, 증기 및 공기조절 공급업',
#                     '수도, 하수 및 폐기물 처리, 원료 재생업','건설업','도매 및 소매업', '운수 및 창고업',
#                     '숙박 및 음식점업','정보통신업','금융 및 보험업','부동산업','전문, 과학 및 기술 서비스업',
#                     '사업시설 관리, 사업 지원 및 임대 서비스업','공공행정, 국방 및 사회보장 행정','교육 서비스업',

#========================================================================
#매출액 2-16 2017 / 증가율 
str(income)

inc <- income %>% 
  mutate(ratio =  income$'2017'/income$`2016` )
View(inc)

inc <- inc %>% arrange(ratio) #오름차순 
View(inc)
inc <- inc[-12,]

library(tidyverse)

inc$`2016` <- as.numeric(inc$`2016`)
inc$`2017` <- as.numeric(inc$`2017`)
#숫자 줄이기 
inc$`2016` <- inc$`2016`/ 10000
inc$`2017` <- inc$`2017`/ 10000
View(inc)
str(inc)


a <- inc$'2016'
b <- inc$'2017'
c <- inc$산업

#2016 그래프

df.6 <- data.frame(c,a);df

ggplot(df.6,aes(x = c, y = a ))+
  geom_bar(stat = "identity" ,  fill = 'orange') + 
  ylim(-100,1150)+
  ggtitle('제주 2016산업별 매출액')+
  theme(plot.title = element_text( size =25,
                                   face = 'bold',
                                   color ='orange'))+
  theme_classic() +
  theme(plot.margin = unit(rep(-2,4), "cm"))+
  coord_polar(start = 0) 

#2017그래프
a <- inc$'2016'
b <- inc$'2017'
c <- inc$산업

df.7 <- data.frame(c,b);df

ggplot(df.7,aes(x = c, y = b ))+
  geom_bar(stat = "identity" , fill = 'orange') + 
  ylim(-50,1200)+
  ggtitle('제주 2017산업별 매출액')+
  theme(plot.title = element_text( size =25,
                                   face = 'bold',
                                   color ='orange'))+
  theme_classic() +
  theme(plot.margin = unit(rep(-2,4), "cm"))+
  coord_polar(start = 0) 

#ratio 증가 비율_ 막대그래프 
r <- inc$ratio
ratio <- data.frame(c,r) ; ratio
View(ratio)
library(dplyr)
ggplot(ratio,aes(x = reorder(c,r) , y = r)) +
  geom_bar(stat = "identity")+ 
  
             coord_cartesian(ylim=c(0.6, 1.4))+
  geom_col(fill = ifelse(ratio$c %in% c('숙박 및 음식점업','도매 및 소매업' ,'부동산업','운수 및 창고업'),
                                        'grey','orange'))+ theme_void() +
   ggtitle('산업별 매출 증가 비율')+
    theme(plot.title = element_text(size =25,
                                  face = "bold",
                                  colour = "orange"))+ 
  labs(x = '',y = '증가율')+
  geom_hline(yintercept = mean( ratio$r),color = 'navy',size = 1) 
 # geom_text(hjust=-.1, check_overlap=TRUE) 


#손익분기점 초과 시점

setwd("C:/Bigdata Maestro/learnR/project/FinalTeamPRJ")
bep <- read.csv("손익분기점15-18.csv",header = F,as.is = T)
View(bep)
bep <- bep[,c(1:5)]
colnames(bep) <- c('손익분기점 초과시점','15년','16년','17년','18년')
bep <- bep[-1,]
bep <- bep[-19,]
str(bep)
#bep$`15년` <- as.character(bep$`15년`)
#bep$`16년` <- as.character(bep$`16년`)
#bep$`17년` <- as.character(bep$`17년`)
#bep$`18년` <- as.character(bep$`18년`)
#bep$`15년` <- as.numeric(bep$`15년`)
#bep$`16년` <- as.numeric(bep$`16년`)
#bep$`17년` <- as.numeric(bep$`17년`)
#bep$`18년` <- as.numeric(bep$`18년`)


#b <- b[-1,]
#colnames(b) <- c('제조업','광업','건설업','운수업','출판,영상,방송통신 및 정보서비스업','사업시설 관리 및 사업 지원 및 임대 서비스업',
#                 '전문, 과학 및 기술 서비스업','보건업 및 사회복지 서비스업', '농업, 임업 및 어업',
#                 '전기, 가스, 증기 및 수도사업','도매 및 소매업','숙박 및 음식점업','금융 및 보험업',
#                 '예술, 스포츠 및 여가관련 서비스업','하수폐기물 처리, 원료재생 및 환경복원업','교육서비스업',
#                 '수리 및 기타개인서비스업','임대업')
#str(b)
#b <- data.frame(b)


#t5 <- c(9.2,9.8,10.7,9.0)#출판,영상,방송통신 및 정보서비스업
#t12 <- c(7.5,8.4,8.6,8.4) #숙박 및 음식
#t13 <- c(8.3,7.7,8.0,7.8) #금융 및 보험업
#t15 <- c(8.1,8.3,9.3,7.9)#하수폐기물 처리, 원료재생 및 환경복원업
#t16 <- c(8.1,8.6,8.8,8.1)#교육서비스업

t1 <- c(7,6.4,6,5.9)# 운수업
t2 <- c(8.2,7.7,7.8,7.8) #도소매
t3 <- c(7.5,8.4,8.6,8.4)#숙박 및 음식
t4 <- c(9.3,8.3,8.6,8.7) #임대(부동산)
t6 <- c(9.9,9.8,10,10.5) #전문, 과학 및 기술 서비스업
t7 <- c(10.3,11.8,14.6,10.8) #농업


year <- c(2015:2018)
df <- data.frame(year,t1,t2,t3,t4,t6,t7)
head(df)

colnames(df) <- c('year','운수업','도매 및 소매업','숙박 및 음식점업','예술, 스포츠 및 여가관련 서비스업',
                  '하수폐기물 처리, 원료재생 및 환경복원업')

str(df)
View(df)

g <- ggplot(df)
g + 
  geom_line(aes(x = year,y = t1),color = 'brown',lwd =2)+ #운수 
geom_line(aes(x = year,y = t2),color = 'orange',lwd =2)+ #도소매
geom_line(aes(x = year,y = t3),color = 'yellow',lwd =2)+ #숙박
geom_line(aes(x = year,y = t4),color = 'green',lwd =2)+ #임대
geom_line(aes(x = year,y = t6),color = 'blue',lwd =2) + #전문과학
  geom_line(aes(x = year,y = t7),color = 'purple',lwd =2)+ #농업
  theme_void()+
  ggtitle("산업별 손익분기점 달성기간")+
  theme(plot.title = element_text( size =25,
                                   face = 'bold',
                                   color ='orange'))+ labs( y = '손익분기점 달성 기간 (개월)', x = '년도')
  
                           
str(df)                        
#운수업 파랑색 #도소매 주황 #숙박및 음식 노랑 #임대부동산 초록 # 전문 과학 및 기술 서비스 업 은 파랑색
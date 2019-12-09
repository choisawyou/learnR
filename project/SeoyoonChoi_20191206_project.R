#최서윤
#작성일20191205 ~ 20191206
#제출일 20191206
#개인 프로젝트 
#제주 대중교통 현황 분석

install.packages("xlsx")
install.packages("rJava")

library(xlsx)
library(rJava)


#교통사고 발생현황 

getwd()
setwd("C:/prjdata")
getwd()
car.acc <- read.csv(file ="제주교통사고발생현황 (20181231).csv")
head(car.acc)

year <- car.acc$연도별
year

mon.acc <- car.acc[,2]
mon.acc


plot(year,mon.acc, main = "제주 교통사고 발생 현황", type = "b",lty = 1 , 
     lwd = 2, las = 1,xlab = '연도', ylab = "월별 사고건 수")



#서울과 제주 자동차 등록 현황

setwd("C:/prjdata")
seoul.car <- read.csv(file ="자동차등록대수현황_강남송파제주.csv" )
seoul.car[-1 & -2 , ]


year <- c(2011:2019)
gangnam <- c(253751,246630,237561,235435,241178,244925,243194,238211,234824) ; min(gangnam) ;max(gangnam)
songpa <- c(214254,215869,214059,215259,216652,219246,223617,232272,237696);min(songpa) ;max(gangnam)
jeju <- c(181794,186531,225241,262959,308955,351280,375225,404366,453235);min(jeju) ; max(jeju)
seoguipo <- c(70010,71551,73231,75969,80041,87003,94167,100018,103895) ;min(seoguipo) ; max(seoguipo)
                                                                                            

plot(year,gangnam, main = " 자동차 등록대수 ", xlab = "연도" , ylab = "자동차 등록대 수 ",type = "b",lwd = 1, col ="red", las = 1,ylim =c(60000,500000))

lines(year,songpa, type = "b", col = "pink")
lines(year,jeju, type = "b", col = "blue")
lines(year,seoguipo, type = "b", col = "purple")

   
#*****지역별 대중교통 이용 만족도 
stf <- read.csv(file = "한국교통안전공단_지역별 대중교통 서비스별 만족도 현황 (2017년).csv")


head(stf)
class(stf)

stf.c <- stf[ 2:28,c("서울","제주")]

stf.c

for( i in 1:ncol(stf.c)){             #1부터 변수(col)수_5 번 반복
  this.na <-  is.na(stf.c[ , i ])
  cat( colnames(stf.c)[i],
       "\t", sum( this.na),       #sum ( 결측치 True/false )
       "\n")
}

#서울 0 제주 3
library(dplyr)

stf.na <- stf.c[ complete.cases(stf.c), ]
stf.na

rowname(subset(stf, 서울 == max.s))


max.s <- stf.na %>% 
  select(서울) %>% 
  max 
max.s

rownames(subset(stf, 서울 == max.s)) #15

stf[15,1] #서울 정보제공체계 max


min.s <- stf.na %>% 
  select(서울) %>% 
  min

min.s
rownames(subset(stf, 서울 == min.s)) # 12 # 25

stf[12,c(1:2)]  #서울 만족도 min 쾌적환경서비스 #혼잡도

stf[25,c(1:2)]  #서울 만족도 min  안전환경서비스 #약자 안전확인 

max.j <- stf.na %>% 
  select(제주) %>% 
  max
max.j

rownames(subset(stf, 제주 == max.j))

stf[22,c(1:2)] #제주 만족도 max  환승 서비스 #환승요금

min.j <- stf.na %>% 
  select(제주) %>% 
  min
min.j

rownames(subset(stf, 제주 == min.j))
max.j <- stf.na %>% 
  select(제주) %>% 
  max
max.j

rownames(subset(stf, 제주 == max.j))

stf[22,c(1:2)] #제주 만족도 max  환승 서비스 #환승요금

min.j <- stf.na %>% 
  select(제주) %>% 
  min
min.j

rownames(subset(stf, 제주 == min.j))

stf[9,c(1:2)]         #제주 만족도 min 차량내부 이용편리



city <- c("제주","서울")

sf <- data.frame(dv = c("정보제공체계","혼잡도","약자 안전 확인","환승 요금", "이용 편리"), 
                 seoul= c(5.12,3.74,3.74,4.88,4.58),jeju=c(5.32,4.91,5.01,5.66,4.82))

par( mfrow = c ( 5,2))

sf

stf[9,c(1:2)]         #제주 만족도 min 차량내부 이용편리



city <- c("제주","서울")

sf <- data.frame(dv = c("정보제공체계","혼잡도","약자 안전 확인","환승 요금", "이용 편리"), 
                 seoul= c(5.12,3.74,3.74,4.88,4.58),jeju=c(5.32,4.91,5.01,5.66,4.82))

par( mfrow = c ( 5,2))

sf

stf.na

#=================================================



par( mfrow = c ( 1, 2))  #2x3 그래프 가상화면 
for( i in 1:2) {
  boxplot ( stf.na[ , i ],ylim = c(3.7,5.6),
            main = colnames ( stf.na )[ i ])
}



#제주시 차량 등록 수 와 교통사고 상관분석 

#전

par( mfrow = c ( 1,2))
jeju.car1 <- c(181794,186531,225241,262959,308955,351280)

jeju.acc1 <- c(3459,3872,4302,4484,4645,4434)

res <- data.frame(jeju.acc1,jeju.car1)

plot(jeju.acc1~jeju.car1,data = res,xlab = "제주시 등록 차량" ,ylab ="제주교통사고 " , main = "2011년 - 2016년")

bef <- lm(jeju.acc1~jeju.car1,data = res)
abline(bef)

cor (res[ , 1:2])
#cor = 0.8046863

#후

plot(jeju.acc1~jeju.car1,data = res,xlab = "제주시 등록 차량" ,ylab ="제주교통사고 " , main = "2011년 - 2018년" )

jeju.car <- c(181794,186531,225241,262959,308955,351280,375225,404366)


jeju.acc <- c(mon.acc)

rel <- data.frame(jeju.acc,jeju.car)

aft <- lm(jeju.acc~jeju.car, data = rel)
abline(aft)
cor (rel[ , 1:2])

plot(jeju.acc~jeju.car,data = rel,xlab = "제주시 등록 차량" ,ylab ="제주교통사고 " )


#cor = 0.6195434
#====================
#대중교통 통행시간 (2016~2018)

getwd()
setwd("C:/prjdata")

t.16 <- read.csv(file ="한국교통안전공단_대중교통 통행시간(2016년).csv")
t.17 <- read.csv(file ="한국교통안전공단_대중교통 통행시간(2017년).csv")
t.18 <- read.csv(file ="한국교통안전공단_대중교통 통행시간(2018년).csv")
t.16

j.16 <- t.16 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 

a <- j.16[17,5]
a

j.17 <- t.17 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 

b <- j.17[17,5]
b

j.18 <- t.18 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 

c <- j.18[17,5]
c
year <- 2016:2018
time <- c(a,b,c)
time

d <- j.16[1,5]
d
e <- j.17[1,5]
e
f <- j.18[1,5]
f
time2 <- c(d,e,f)

g <- j.16[10,5]
g
h <- j.17[10,5]
h
i <- j.18[10,5]
i
time3 <- c(g,h,i)

plot( year,time , main = "대중교통 통행시간", type = "l",lty = 1 , lwd = 1,col ="green",
     xlab = '년도', ylab = "통행시간",ylim = c(15,25))

lines( year,time2, type = "b", col = "blue") 
lines( year,time3, type = "b", col = "red") 

#대중교통 1회 이용요금 

mon.15 <- read.csv(file ="대중교통 1회 이용요금(2015년).csv")

mon.16 <- read.csv(file ="한국교통안전공단_대중교통 1회 이용요금(2016년).csv")

mon.17 <- read.csv(file ="한국교통안전공단_대중 교통 1회 이용요금 현황 (2017년).csv" )

mon.18 <- read.csv(file ="한국교통안전공단_대중 교통 1회 이용요금 현황 (2018년).csv" )

m.15 <- mon.15 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 
m.15

a.1 <- m.15[1,7] #서울 2015
a.1
a.2 <- m.15[17,7] #제주 2015
a.2

m.16 <- mon.16 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 
m.16
a.3 <- m.16[1,7] #서울 2016
a.3
a.4 <- m.16[17,7] #제주 2016
a.4
m.17 <- mon.17 %>% 
  mutate ( average =(평일 + 토요일 + 일요일)/3 ) 
m.17

a.5 <- m.17[1,5] #서울 2017
a.5
a.6<- m.17[17,5] #제주 2017
a.6

m.18 <- mon.18 %>% 
  mutate ( average =(평일 + 토요일 + 일요일 )/3 ) 
m.18

a.7 <- m.18[1,5] #서울 2018
a.7
a.8 <- m.18[17,5] #제주 2018
a.8
fare <- c(a.2,a.4,a.6,a.8) #제주
fare

fare1 <- c(a.1,a.3,a.5,a.7) #서울

year1 <- 2015:2018
  
  plot( year1,fare , main = "대중교통 1회 이용요금", type = "l",lty = 1 , lwd = 1,col ="green",
        xlab = '년도', ylab = "통행요금(원)",ylim = c(1150,1450))
  
  
  lines(year1,fare1,col = "blue")


#최서윤
#20191205 ~ 20191206
#개인 프로젝트 
#제주 대중교통 현황 분석

install.packages("xlsx")
install.packages("rJava")

library(xlsx)
library(rJava)


## 제주의 혼잡한 교통 상황 제시 

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


#대중교통 환승 소요 시간 (2016 ~ 2018)

getwd()
tt.16 <- read.csv(file ="한국교통안전공단_대중교통 환승소요시간(2016년).csv")
tt.17 <- read.csv(file ="한국교통안전공단_대중교통 환승소요시간(2017년).csv")
tt.18 <- read.csv(file ="한국교통안전공단_대중교통 환승소요시간(2018년).csv")
class(tt.16)
tt.16[ ,]
tt.16install.packages("dplyr")
library(dplyr)

par(mfrow=c(1,3))



jj.16 <- tt.16 %>% 
  filter( 구분 == "제주") 


jj.16
jj.17 <- tt.17 %>% 
  filter( 구분 == "제주") %>% 
  select(평일)

jj.18 <-  tt.18 %>% 
  filter( 구분 == "제주") %>% 
  select(평일)



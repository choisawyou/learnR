library(tidyverse)
library(dplyr)
library(ggplot2)
#
#5.1 제주 청년 희망직종
#    제주 청년 직종 현황
#    전출 상위 지역 직종별  취업 현황

setwd("C:/Bigdata Maestro/learnR/project/teamprj/doc")

wish.15 <- read.csv(file = "5.1만1834세_비_미_취업자_취업희망_직종_2015.csv")
wish.18<- read.csv(file = "5.1만1834세_비_미_취업자_취업희망_직종_2018.csv")
hired <- read.csv(file = "5.1행정구역_시도__직업별_취업자_2015_2018.csv",head = F)
head(wish.15)
dim(wish.15)
w.15 <- wish.15[1:2, 1:9 ] 



b <- c(35.4,39.9,9.8,4.8,5,2.6,2.5)


names(b) <-  c("전문가 및 관련종사자","사무종사자",
               "서비스종사자","판매종사자","기능 · 기계 조작종사자",
               "단순노무종사자","그외")
b
c <- data.frame(b,row.names = c("1","2","3","4","5","6","7"))

c

index(c,1,2,3,4,5,6,7)

ggplot(c,aes(x = c$a,y= c$b ))+
    geom_bar(stat = "identity",
             width = 0.7 ,
             fill = " steelblue ")+
    ggtitle("2018년 미/비 취업 제주도민 취업희망 직종")+
    theme(plot.title = element_text(size =25, face = "bold", color = "steelblue")) +
    labs( x= "직종", y ="소계")



#벡터 원소값에 이름지정
#names 는 이름을 지정할 때 사용
# 이름 지정할 갯수와 벡터함수내 갯수 일치해야함
#score <-  c ( 90, 85, 70 )  
#names ( score )  #결과 : NULL
#names ( score ) <- c ( "Hong", "Kim", "Lee" )  
#names ( score ) #결과 : "Hong" "Kim"  "Lee"
#score #결과 : Hong  Kim  Lee 
#barplot


                                      
# 제주 청년 직종 현황

head(hired)
View(hired)
    
hrd <- subset(hired,V1 == '제주도')
jh <- hrd[c(2,5,6,9,10),];jh
View(jh)
year <- 2015:2018
r1 <-c(53,57,55,48) #관리자 전문가 #회색
r2 <- c(40,50,62,66) #사무종사자 #파란색
r3 <- c(94,93,97,97) #서비스판매종사자 #초록색 
r4 <- c(45,47,46,51) #농림어업 숙련종사자 #오렌지
r5 <- c(108,109,114,110) #기능 · 기계 조작종사자 #레드


df1 <- data.frame(year,r1)
df2 <- data.frame(year,r2)
df3 <- data.frame(year,r3)
df4 <- data.frame(year,r4)
df5 <- data.frame(year,r5)

plot(year,r1,main = "제주내  직종별  취업  현황",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c ( 40, 150),col = "gray")
lines( year, r2, type = "b",lwd = 2, col = "blue")
lines( year, r3, type = "b",lwd = 2, col = "green")
lines( year, r4, type = "b",lwd = 2, col = "orange")
lines( year, r5, type = "b",lwd = 2, col = "red")

legend("topleft",c("관리자", "사무", "서비스판매",
                    "농림어업 ", "기능 · 기계 조작"),cex =0.9,
       fill = c("gray", "blue", "green", "orange", "red"))

#서울  #부산 #인천 

head(hired)
View(hired)

hrd.s <- subset(hired,V1 == '서울특별시');hrd.s
hrd.b <- subset(hired,V1 == '부산광역시');hrd.b
hrd.i <- subset(hired,V1 == '인천광역시');hrd.i

jh.s <- hrd.s[c(2,5,6,9,10),];jh.s
jh.b <- hrd.b[c(2,5,6,9,10),];jh.b
jh.i <- hrd.i[c(2,5,6,9,10),];jh.i

View(jh.s)
View(jh.b)
View(jh.i)

year <- 2015:2018

#업종별 취업자 수 변화 추이 _제주도
r1 <-c(53,57,55,48) #관리자 전문가 
r2 <- c(40,50,62,66) #사무종사자 
r3 <- c(94,93,97,97) #서비스판매종사자  
r4 <- c(45,47,46,51) #농림어업 숙련종사자 
r5 <- c(108,109,114,110) #기능 · 기계 조작종사자 

df1 <- data.frame(year,r1)
df2 <- data.frame(year,r2)
df3 <- data.frame(year,r3)
df4 <- data.frame(year,r4)
df5 <- data.frame(year,r5)

##업종별 취업자 수 변화 추이 _서울
s1 <- c(1433,1434,1475,1482)
s2 <- c(1044,1045,1071,1114)
s3 <- c(1302,1263,1222,1201)
s4 <- c(8,8,11,9)
s5 <- c(1379,1396,1375,1274)
  

ds1 <- data.frame(year,s1)
ds1
ds2 <- data.frame(year,s2)
ds3 <- data.frame(year,s3)
ds4 <- data.frame(year,s4)
ds5 <- data.frame(year,s5)


#업종별 취업자 수 변화 추이_부산

b1 <- c(332,346,357,371)
b2 <- c(282,289,288,293)
b3 <- c(419,415,397,392)
b4 <- c(4,8,10,9)
b5 <- c(648,628,633,592)


db1 <- data.frame(year,b1)
db2 <- data.frame(year,b2)
db3 <- data.frame(year,b3)
db4 <- data.frame(year,b4)
db5 <- data.frame(year,b5)


#업종별 취업자 수 변화 추이_인천

i1 <- c(280,281,294,300)
i2 <- c(264,265,279,296)
i3 <- c(356,353,350,374)
i4 <- c(21,7,5,8)
i5 <- c(566,615,605,597)


di1 <- data.frame(year,i1)
di2 <- data.frame(year,i2)
di3 <- data.frame(year,i3)
di4 <- data.frame(year,i4)
di5 <- data.frame(year,i5)



#관리자 / 전문가 지역별 취업자수 추이
par(mfrow = c(3,2))

plot(year,r1,main = "'전문직' 취업자수",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c (0, 1500),col = "green")
lines( year, s1, type = "b",lwd = 2, col = "red")
lines( year, b1, type = "b",lwd = 2, col = "blue")
lines( year, i1, type = "b",lwd = 2, col = "gray")


legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))



#사무직 / 전문가 지역별 취업자수 추이
plot(year,r2,main = " '사무직' 취업자수",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c (0, 1100),col = "green")
lines( year, s2, type = "b",lwd = 2, col = "red")
lines( year, b2, type = "b",lwd = 2, col = "blue")
lines( year, i2, type = "b",lwd = 2, col = "gray")


legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))




#서비스 판매직 지역별 취업자수 추이
plot(year,r3,main = " '서비스, 판매직 ' 취업자수",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c (0, 1500),col = "green")
lines( year, s3, type = "b",lwd = 2, col = "red")
lines( year, b3, type = "b",lwd = 2, col = "blue")
lines( year, i3, type = "b",lwd = 2, col = "gray")



legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))



#농림어업 지역별 취업자수 추이
plot(year,r4,main = "'농림어업 ' 취업자수",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c (0, 50),col = "green")
lines( year, s4, type = "b",lwd = 2, col = "red")
lines( year, b4, type = "b",lwd = 2, col = "blue")
lines( year, i4, type = "b",lwd = 2, col = "gray")

legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))



#기능·기계조작·조립·단순노무 종사자(7~9)	

plot(year,r5,main = " '기능.기계 조작 조립 및 단순노무'  취업자수",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 취업자 수 (천명)",ylim = c (0, 1500),col = "green")
lines( year, s5, type = "b",lwd = 2, col = "red")
lines( year, b5, type = "b",lwd = 2, col = "blue")
lines( year, i5, type = "b",lwd = 2, col = "gray")


legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))


#희망연봉과 월평균임금 / 다른 시도 비교 

mon <- read.csv(file = "5.2  만1834세_비_미_취업자_취업_시_희망_월평균_임금_2018.csv",
                header = T)


mf <- read.csv(file = "5.2  만1834세_비_미_취업자_취업_시_희망_월평균_임금_2018.csv",
                header = F)



View(mof)
mf <- mof[c(2:3),c(3:9)]
View(mf)
ft <- t(mf)
df <- data.frame(ft)

rownames(ft) <-  c(1,2,3,4,5,6,7)
colnames(ft) <- c("range","par")
View(ft)
range <- c("100만원 미만","100~150만원","150~200만원","200~300만원","300~400만원","400~500만원",
           "500만원 이상")
pi <- c(1.9,2,9.9,66.8,16.3,1.2,1.8)
View(df)

ggplot(data = df,mapping = aes(x=df$range,y = df$par))+
  geom_bar(stat = "identity", 
           width = 0.7 ,      
           fill = "steelblue")+
  ggtitle("제주 청년 희망 임금 ") +
  theme(plot.title = element_text(size =25,
                                  face = "bold",
                                 colour = "steelblue")) +
  labs( x= "희망 임금 ", y =" %") + coord_flip()


# 주요 도시별  월평균임금

sal <- read.csv(file = "5.2  2015-2018 시도별 월평균 임금.csv",
                header = T)
View(sal)

sa <- t(sal)
sa$X

#제주
year <- 2015:2018
jeju <- c(2293505,2389239,2456978,2584690)
jj <- data.frame(year,jeju)

#부산
busan <- c(2620611,2694140,2786616,2962069)
bs <- data.frame(year,busan)

#인천
inch <- c(2723424,2839944,2913439,3013149)
ic <- data.frame(year,inch)

#서울
seoul <- c(3261561,3364470,3445867,3563940)
se <- data.frame(year,seoul)


  
plot(year,jeju,main = "월 평균 임금",type = "b",lty =1, lwd = 2, 
     xlab = " 년도", ylab = " 월평균 임금 (원)",ylim = c ( 2000000, 4000000),col = "green")
lines( year, busan, type = "b",lwd = 2, col = "blue")
lines( year, inch, type = "b",lwd = 2, col = "grey")
lines( year, seoul, type = "b",lwd = 2, col = "red")


legend("topleft",c("제주", "부산", "인천",
                   "서울 "), cex =1.0,
       fill = c("green", "blue", "grey", "red"))



#############################################
jg <- ggplot(jj,aes( x = year, y = jeju)) 
bg <- ggplot(bs,aes( x = year, y = busan))
ig <- ggplot(ic,aes( x = year, y = inch))
sg <- ggplot(ic,aes( x = year, y = se))

jg+
  geom_line(col = "green")+ 
  geom_line(col = "blue")

a <- jg+
  geom_line(col = "green")

b <-   bg+
  geom_line(col = "blue")
  c <- ig+
  geom_line(col = "grey")
 
    d <-  sg+
  geom_line(col = "red")

a+b+c+d

  ggtitle("도시별 월 평균 임금 ") +
  theme(plot.title = element_text(size =25,
                                  face = "bold",
                                  colour = "black")) +
  labs( x= "년도 ", y =" 월평균 임금") 
###############################################################
  

  #제주도민 취업희망지역
  
  
  ar <- read.csv(file = "7. 만1834세_비_미_취업자_취_창_업_희망_지역_2018.csv")
View(ar)  

wa<- table(ar)

wa

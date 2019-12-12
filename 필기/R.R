library(tidyverse)
library(dplyr)
library(ggplot2)
#
#5.1 제주 청년 희망직종
#    제주 청년 직종 현황
#    전출 상위 지역 직종별  취업 현황

setwd("C:/learnR/project/teamprj")

wish.15 <- read.csv(file = "5.1만1834세_비_미_취업자_취업희망_직종_2015.csv")
wish.18<- read.csv(file = "5.1만1834세_비_미_취업자_취업희망_직종_2018.csv")
hired <- read.csv(file = "5.1행정구역_시도__직업별_취업자_2015_2018.csv",head = F)
head(wish.15)
dim(wish.15)
w.15 <- wish.15[1:2, 1:9 ] 

a <- c("전문가 및 관련종사자","사무종사자","서비스종사자","판매종사자","기능 · 기계 조작종사자","단순노무종사자","그외")
b <- c(35.4,39.9,9.8,4.8,5,2.6,2.5)
b.1 <- round(b)
b.1
str(a)
c <- table(a,b.1)
c

ggplot(c,aes(x = a, y = b.1 ))+
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
                    "농림어업 ", "기능 · 기계 조작"), 
       col = c("gray", "blue", "green", "orange", "red"))

#서울  #부산 #인천 

head(hired)
View(hired)

hrd.s <- subset(hired,V1 == '서울특별시');hrd.s
hrd.b <- subset(hired,V1 == '부산광역시');hrd.b
hrd.i <- subset(hired,V1 == '인천광역시');hrd.i

jh.s <- hrd.s[c(2,5,6,9,10),];jh.s
View(jh.s)
year <- 2015:2018

#w
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
                   "농림어업 ", "기능 · 기계 조작"), 
       col = c("gray", "blue", "green", "orange", "red"))

      


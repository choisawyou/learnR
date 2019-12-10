#최서윤
#작성일 : 20191210 ~ 20191211
#제출일 : 20191211

#문1)
#R에서 제공하는 state.x77 데이터셋을 차원 축소하여 2차원 산점도와 3
#차원 산점도를 작성하시오. (state.x77은 매트릭스 타입이기 때문에 데이터프레임
# 으로 변환하여 실습한다.)

library(tidyverse)

class(state.x77)
st <- data.frame(state.x77)
install.packages("Rtsne")
library(Rtsne)

dim(st)
str(st)
View(st)
dup = which(duplicated(st))
dup #중복값 0 

tsne.2 <- Rtsne(st,dim = 2, perplexity = 15) ;tsne.2
tsne.3 <- Rtsne(st,dim = 3, perplexity = 15) ;tsne.3

df.2 <- data.frame(tsne.2$Y)
df.2

df.3 <-  data.frame(tsne.3$Y)
df.3

install.packages(c("rgl", "car"))
library(car)
library(rgl)
library(mgcv)

ggplot(df.2,aes(x = X1 , y = X2, color ="red"))+
    geom_point(size =2)

scatter3d( x = df.3$X1, y = df.3$X2,z = df.3$X3)

#문2)
#R에서 제공하는 swiss 데이터셋을 차원 축소하여 2차원 산점도와 3차원
#산점도를 작성하시오.

class(swiss)
dim(swiss)
str(swiss)
View(swiss)
 which(duplicated(swiss))


sw.2 <- Rtsne(swiss,dim =2 , perplexity = 15 )#2차원 산점도
sw.3 <- Rtsne(swiss,dim =3 , perplexity = 15 )#3차원 산점도 

df.2 <- data.frame(sw.2$Y)
df.2
ggplot(df.2,aes(x=X1,y=X2))+
    geom_point(size = 3)

df.3 <- data.frame(sw.3$Y)
df.3

scatter3d(x = df.3$X1, y = df.3$X2, z = df.3$X3)



#문3) 
#R을 이용하여 지도를 출력하시오.
library(ggmap)
register_google(key = "AIzaSyBW1-gQiLvNeJ3_pTZnF_rhU3sxbIPHC9c")

#(1) 서울시청을 중심으로 지도 크기는 600x600, 지도 유형은 roadmap인 지도를 출력
#하시오.
cityhall <- geocode(enc2utf8("서울시청"))
cityhall
ch <- as.numeric(cityhall)
ch
ch.map <- get_googlemap(center = ch,
                        zoom = 16,
                        size = c(600,600),
                        maptype = "roadmap")

ggmap(ch.map)

#(2) 금강산 지역을 근방으로 지도 크기는 500x500, 지도 유형은 hybrid, zoom은 8
#인 지도를 출력하시오.
kkmt <- geocode(enc2utf8("금강산"))
kkmt

km <- as.numeric(kkmt)
km

km.map <- get_googlemap(center = km ,
                        zoom = 8,
                        size = c(500,500),
                        maptype = "hybrid")


ggmap(km.map)

#(3) 강남역 근방으로 지도 크기는 640x640, 지도 유형은 roadmap, zoom은 16인 지
#도를 출력하시오.
gnst <- geocode(enc2utf8("강남역"))

gs <- as.numeric(gnst)
gs

gs.map <- get_googlemap(center = gs,
                        zoom = 16,
                        size = c(640,640),
                        maptype = "roadmap")
ggmap(gs.map)

#(4) 지도 유형은 roadmap, zoom은 9인 경도 127.397692, 위도 36.337058 지역의 지
#도를 출력하시오.

map.4 <- get_googlemap(center = c(127.397692,36.337058),
                     zoom = 9 ,
                     size = c(640,640),
                     maptype = "roadmap")

ggmap(map.4)

#(5) 지도 유형은 roadmap, zoom은 10인 경도 135.502330, 위도 34.693594 지역의
#지도를 출력하시오.

map.5 <-  get_googlemap( center = c(135.502330,34.693594),
                       zoom = 10 ,
                       maptype = "roadmap")


ggmap(map.5)

#문4)
#R을 이용하여 서울시 한강 이남의 구청들의 위치에 마커와 구청 이름을
#지도 위에 표시하시오.

names <- c("강서구청","양천구청","구로구청","영등포구청","동작구청","관악구청",
           "서초구청","강남구청","송파구청","강동구청","금천구청")

add <- c("서울특별시 강서구 화곡6동 화곡로 302",
         "서울특별시 양천구 신정동 목동동로 105",
         "서울특별시 구로구 구로동 가마산로 245",
         "서울특별시 영등포구 당산동3가 당산로 123",
         "서울특별시 동작구 노량진2동 장승배기로 161",
         "서울특별시 관악구 관악로 145",
         "서울특별시 서초구 서초2동 남부순환로 2584",
         "서울특별시 강남구 삼성2동 학동로 426",
         "서울특별시 송파구 잠실6동 올림픽로 326",
         "서울특별시 강동구 성내동 성내로 25",
         "서울특별시 시흥1동")

gc <- geocode(enc2utf8(add))
gc

df <- data.frame(name = names , lon = gc$lon , lat = gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat))

map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 11,
                     size = c(640,640),
                     marker = gc)

gmap.4 <- ggmap(map)

gmap.4 +
    geom_text(data = df, 
              aes(x=lon, y =lat),
              size=4,
              label= df$name)

#문5)
#R을 이용하여 대한민국의 광역시를 지도 위에 출력하시오. 단, 마커와 광
#역시 이름을 함께 표시하시오.
names <- c("부산광역시",'대구광역시','인천광역시','광주광역시',
           '대전광역시','울산광역시')


gc <- geocode(enc2utf8(c("부산광역시",'대구광역시','인천광역시','광주광역시',
                         '대전광역시','울산광역시')))
gc

df.5 <- data.frame(name = names,lon =gc$lon, lat = gc$lat)
df.5
cen <- c(mean(gc$lon),mean(gc$lat))
map <- get_googlemap(center = cen , 
                     maptype = "roadmap",
                     zoom = 6,
                     marker = gc)
gmap.5
gmap.5 <- ggmap(map)
gmap.5 +
    geom_text(data = df.5,
              aes(x = df.5$lon , y = df.5$lat),
              size =4 ,
              label = df.5$name)

#문6)
#R을 이용하여 서울, 경기, 강원 지역의 국립공원 위치를 지도 상에 마커로
#시하되 국립공원의 이름을 함께 표시하시오._ 국립공원 관리공단

names <- c("북한산국립공원","설악산국립공원","오대산국립공원","치악산국립공원")
gc <- geocode(enc2utf8(names))
gc
df <- data.frame(name = names , lon = gc$lon , lat = gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat))
cen

map <- get_googlemap(center = cen ,
                     maptype = "roadmap",
                     zoom = 7,
                     size = c(800,800),
                     marker =gc)
ggmap(map)
gmap <- ggmap(map)
gmap +
    geom_text(data = df, 
              aes(x= gc$lon, y = gc$lat),
                  size =4,
                  label = df$name)


#문7) 
#‘2018년도 시군구별 월별 교통사고 자료’로부터 서울시의 각 구별 1년 교
#통사고 발생건수를 지도상에 원의 크기로 나타내시오._공공데이터 포털

library(xlsx)
library(dplyr)
library(psych)
require(descr)
library(ggmap)
register_google(key = "AIzaSyBW1-gQiLvNeJ3_pTZnF_rhU3sxbIPHC9c")


getwd()
setwd("C:/Bigdata Maestro/learnR")
acc <- read.csv(file ="도로교통공단_시도_시군구별_월별_교통사고(2018).csv")
head(acc)
View(acc)

ac <- subset(acc, 시도 == "서울" , select = c(시군구,월,발생건수))
ac

nrow(ac)
ac.1 <- ac %>% 
    group_by(시군구) %>%
    filter(시군구 == "종로구")
     
ac.1


    head(ac.1)
table(ac.1)

df %>% 
    group_by( class ) %>% 
    summarise( mean_math = mean ( math ),
               mean_english = mean (english),
               mean_science = mean ( science),
               n = n () )  # n = n (인수없음) => 빈도수 계산하는 함수 








#문8)
#7번과 동일한 자료를 이용하여 제주시 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.

head(acc)

ja <- subset(acc,시도 == "제주", select = c(시군구,월,발생건수))
ja
cnt <- ja$발생건수
cnt
ja.jj <- sum(cnt[1:12])
ja.sg <- sum(cnt[13:24])

names <- c("제주시","서귀포시")
cnt.j <- c(ja.jj,ja.sg)

jac <- data.frame(name = names, acc.cnt = cnt.j)
jac

gc <- geocode(enc2utf8(names))
cen <- c(mean(gc$lon),mean(gc$lat))
cen

map <- get_googlemap(center = cen,maptype = "roadmap",
                     zoom = 11,
                     marker =gc)
gmap <- ggmap(map)

gmap+
    geom_point(data = jac ,
               aes( x = 126.54563 , y = 33.37687, size = jac$acc.cnt),
               alpha = 0.4 , col = "red")+
    scale_size_continuous(range = c(1,10)) 

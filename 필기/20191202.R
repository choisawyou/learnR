#20191202 5일차
#

setwd("C:/workR")
df <- read.table( file = "airquality.txt ", header = T)
df
str(df)

#패키지 설치 함수 _ 교재 98pg

install.packages("xlsx")
install.packages("rJava")


# 설치 후 내가 사용하겠다 라는 함수 ( 매접속 시 )
#java개발환경이 구성이 안되어있으면 에러발생
#쓰는 순서 중요 rjava -> xlsx
#csv와 엑셀을 읽었을 때 차이점 : xlsx로 읽었을 때 factor로 변경되는 경우 ㅇ

library( rJava )
library( xlsx )

df.xlsx <-  read.xlsx ( file  = "airquality.xlsx", sheetIndex = 1 ,
                        encoding = "UTF-8")

df.xlsx
class( df.xlsx)
str(df.xlsx)
head( df.xlsx, 3)
tail( df.xlsx, 3)

#which _ 위치값 찾는 함수 _몇번째에 위치하는가

score <- c( 76,84,69,50,95,6,82,71,88,84)
which( score == 69 )
which( score >= 85 )
max(score)
which.max(score)     #최대값이 있는  index
min( score )
which.min( score )

idx <-  which( score >= 60 )  #60보다 큰 변수
score[ idx ] <- 61  # 이 변수들을 일괄 61로 변경
score

head(iris)

idx <- which( iris [ , 1:4 ] > 5.0, arr.ind = TRUE )  #조건에 만족하는 행과 열의 인덱스 값_ vector일 때 불가능/ matrix o
idx #arr.ind를 써야 좌표값이 주어짐

#단일변수 ( 일변량 ) 범주형 자료 탐색

favorite <- c("WINTER","SUMMER","SPRING","SUMMER","SUMMER",
              "FALL","FALL","SUMMER","SPRING","SPRING")

favorite
class( favorite)
table( favorite)
table(favorite)/ length ( favorite)

ds <-  table(favorite)
ds
barplot(ds,main = "favorite season")  

ds.new <- ds[ c(2, 3, 1, 4)] #계절이름이 index의 이름 1 2 3 4 
ds.new
barplot( ds.new, main = "favorite season")
#barplot(벡터(table)이름, 그래프 제목 )

#pie는 원형 그래프
pie( ds, main = "favorite season")
pie( ds.new, main = "favorite season")

#숫자로 된 범주형 데이터 
favorite.color <-  c(2,3,2,1,1,2,2,1,3,2,1,3,2,1,2)

ds <-  table ( favorite.color) ; ds
barplot( ds, main = "favorite season" )
colors <- c("red", "orange" , " yellow")
names ( ds ) <-  colors ; ds
barplot(ds, main = "favorite season", col = colors )  #col = 색상부여 함수
pie ( ds, main = "favorite season", col = colors)


#단일변수(일변량) 연속형 자료

weight <- c(60,62,64,65,68,69) ; weight
weight.heavy <- c(weight,120) ; weight.heavy

#평균
mean ( weight ); mean ( weight.heavy)
#중앙값
median(weight) ; median ( weight.heavy)
#절사평균_ trim :하위/ 상위 x %만큼 제외하고 평균
mean( weight, trim = 0.2 )
mean( weight.heavy, trim = 0.2 )
#상위 두 자료형의 경우 평균값은 왜곡이 있다고 볼 수 있으며,  
#중앙값이나 절사평균은 의미가 있는값이라 할 수 있다..


#사분위수-데이터를 4등분 나눠서 범위별 값 추출 
#cf_2사분위(50%) 값은 중앙값과 동일
# 0% : 최소값 , 100% : 최대값
quantile( weight.heavy)
quantile( weight.heavy, (0:10 ) / 10 )

# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 출력 함수 
summary( weight.heavy)  

## 산포 ( distrubution )_ 값이 퍼져있는 정도 파악

#분산_ 변수의 흩어진 정도
var(weright)
#표준편차_자료가 평균을 중심으로 얼마나 퍼져 있는지/
#표준편차가 0에 가까우면 자료 값들이 평균 근처에 집중
sd(weight)
#값의 범위 ( 최소값과 최대값)
range(weight)
#최대값과 최소값의 차이
diff( range ( weight ) )

##histogram : 연속형 자료의 분포를 시각화_막대와 막대사이가 붙어있음 
#연속형 자료에서는 구간을 나누고 구간에 속한
#값들의 개수를 세는 방법으로 사용
cars
str ( cars )
dist <-  cars[ , 2 ]
dist
hist( dist, main = "Histogram for 제동거리", xlab = "제동거리", ylab = "빈도수",
          border = "black", col = "yellow", las = 2, breaks =5 )
#border:테두리 색 ,  las:xlabel의 출력 방향, break:막대수 



##상자그림 ( boxplot, 상자 수염 그림)
#사분위수를 시각화 하여 그래프 형태로 표시 
#상자 그림은 하나의 그래프로 데이터의 분포 
#형태를 포함한 다양한 정보를 전달
#자료의 전반적인 분포를 이해하는데 도움 
#구체적인 최소/최대/중앙값을 알기는 어렵다 

boxplot( dist, main = "자동차 제동거리 ")

boxplot.stats(dist)
boxplot.stats(dist)$stats # 정상범위 사분위수 
boxplot.stats(dist)$n     #관측치(row) 개수
boxplot.stats(dist)$conf  #중앙값 신뢰구간
boxplot.stats(dist)$out   # 이상치 (특이값)목록


##일변량 중 그룹으로 구성된 자료의 상자그림
#boxplot(물결 뒤쪽에 그룹으로 묶을 것들이 입력, 데이터셋 , 제목  )
iris
boxplot( Petal.Length~Species,
         data = iris, main = " 품종별 꽃잎의 길이" )

boxplot( iris$Petal.Length~iris$Species, main = " 품종별 꽃잎의 길이" )


##한 화면에 여러 그래프 작성 
par(mfrow = c(1,3))   # 1x3 가상화면 분할
barplot( table (mtcars$carb), main = "C",
         xlab =  "carburetors", ylab = "freq",
         col = "blue")

barplot(table ( mtcars$cyl ), main = "cyl",
        xlab = "cyl" , ylab = "freq",
        col = "red")

barplot ( table ( mtcars$gear ), main = "g",
          xlab = "gear", ylab = "freq",
          col = "green")


par(mfrow = c (1,1))  #가상화면 분할 해제

    
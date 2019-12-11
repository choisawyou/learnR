#20191203 6회차

#boxplot에서 중앙값 기준으로 위,아래값이 더 넓고 좁음 또한 알 수 있다. 

#다중변수 자료 탐색
#두 변수 사이의 산점도
#산점도 (scatter plot) -2변수로 구성된 자료의 분포를 알아보는 그래프 /
#                      -관측값들의 분포를 통해 2변수 사이의 관계 파악

par(mfrow = c (1,1))

##Data 종류
 # 범주형 + 일변량 => vector
 # 연속형 + 일변량 => vector_ 주로 histogram/상자수염 사용

# 다변량 , 이변량 =>  Matrix / Data frame

# 연속형 + 다변량 => 1. 상관분석_ 산점도 사용
#                    2. 시계열 data분석 ( x축 : 시간) _ 선그래프 

##중량과 연비의 관계(이변량) _ 중량이 무거우면 연비가 내려갈까? 
wt <- mtcars$wt
mpg <- mtcars$mpg
plot( wt,mpg , main = " 중량 - 연비 그래프" , xlab = "중량 ", 
        ylab = "연비" ,col ="red" , pch = 19, las = 1)
#pch: 점의 모양 ( 0부터 25까지 )

## 여러 변수들간의 산점도 (다변량)
#pairs _ 산점도는 대각선 모양으로 나왔을 때 상관관계가 높다

vars <-  c( "mpg","disp","drat","wt") #_벡터 생성 변수 4개
target <- mtcars[ , vars]             # matrix생성 (변수형이 동일해서 )
head( target )                  
pairs( target, main = "multi plots")  #대각선을 중심으로 대칭관계 _ x,y축이 변경된 상태 

#산점도 만드는 4가지 방법 _ 이변량
y축~x축
wt <- mtcars$wt
mpg <- mtcars$mpg
plot( wt,mpg , main = " 중량 - 연비 그래프" , xlab = "중량 ", 
      ylab = "연비" ,col ="red" , pch = 19 )

plot(mtcars$wt,mtcars$mpg, main = " 중량 - 연비 그래프" , xlab = "중량 ", 
      ylab = "연비" ,col ="red" , pch = 19)

plot( mtcars [, c("wt", "mpg")], main = " 중량 - 연비 그래프" , xlab = "중량 ", 
      ylab = "연비",col ="red" , pch = 19 )

plot( mpg~wt, data = mtcars , main = " 중량 - 연비 그래프" , xlab = "중량 ", 
      ylab = "연비" ,col ="red" , pch = 19 )


#그룹(factor)정보가 있는 두변수의 산점도
iris.2 <-  iris [,3:4]
iris.2
point <- as.numeric( iris$Species)  #문자열인 품종(Species)을 그룹화하기 위하여 숫자로 변환
point
color <- c("red" , " green" , "blue") #품종1 red /품종2 green / 품종 3 blue
plot(iris.2 , main = "Iris plot" ,
     pch = c( point), col = color [ point ] )

##상관분석 : 연속형	변수로	측정된	두	변수	간의	선형적(회귀선)	관계를	분석
#-1 <= 기본적인 상관계수(r) <= 1
#-1 음의 상관 : xy 반비례  _일반적으로 기준은 -0.5
#+1 양의 상관 : xy 비례    _ 일반적으로 기준은 +0.5

##맥주에 따른 혈중 알콜 농도 
beers <- c(5,2,9,8,3,7,3,5,3,5) 
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
tbl <- data.frame(beers ,bal )
tbl

plot(bal~beers, data = tbl)           # 산점도 

#회귀식을 구하는 식 lm : y = xw + b _ 연속값에대한 예측값 구하는 식
#y : 종속변수 , x : 독립변수 , w: weight , b : bias

 res <-  lm(bal~beers, data = tbl )   #회귀식
 res  #w와 b가 나옴 
abline ( res )                        #회귀선: 최적의 예측선 


# 상관관계가 강하냐 아니냐를 따져주는 상관계수 = r  _ cor 함수 

cor(tbl[ ,  1:2 ]) #이변량 상관계수_0.5 이상이므로 강한 상관관계로 볼 수 있다 (맥주/혈중알콜농도)
cor(iris[ , 1:4 ]) #다변량 상관계수 


#상관분석 순서 _ 절대적인 순서는 아님 
#1.상관분석 대상 변수선정
#2.산점도 작성( 관측값 분포 확인 ) : plot()
#3.회귀식 도출 :lm()   [lm: linear model]
#(회귀식 : 두 변수의 선형관계를 가장 잘 나타낼 수 있는 선의식)
#   (y= xw + b )
#4.회귀선을 산점도에 표시 : abline()
#(회귀선 : 관측값들의 추세를 가장 잘 나타낼수 있는 선 )
#5.상관계수 계산 ; cor()
#6.상관분석 결과 해석 



##시계열  Data - 선그래프 _ x축에 시간정보가 들어가는 data
month <-  1:12
late <- c(5,8,7,9,4,6,12,13,8,6,6,4)

#type : 선그래프의 모양/lty(line type): 선의 모양 / lwd : 선의 두께

plot( month,late, main = "지각생 통계", type = "l",lty = 1 , lwd = 1,
      xlab = 'Month', ylab = "late cnt")

plot( month,late, main = "지각생 통계", type = "b",lty = 1 , lwd = 1,
      xlab = 'Month', ylab = " late cnt")

plot( month,late, main = "지각생 통계", type = "o",lty = 1 , lwd = 1,
      xlab = 'Month', ylab = " late cnt")

plot( month,late, main = "지각생 통계", type = "s",lty = 1 , lwd = 1,
      xlab = "Month', ylab = " late cnt")'


# 복수의 선 그래프 

late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)

late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)

#ylim(최소값,최대값) 축 범위 설정 

  plot(month,late1, main = "지각생 통계", type = "b",lty = 1 , col = "red",
      xlab = "Month", ylab = " late cnt", ylim = c ( 1, 15)) 
lines( month, late2, type = "b", col = "blue")   #lines 함수를 이용하여 선그래프 추가 


##자료 탐색 실습 - 탐색적 데이터 분석

##0단계 : 문제정의
##1단계 : 분석 대상 데이터셋 준비
#BostonHousing  데이터셋 (mlbench pac.)

install.packages("mlbench")
library (mlbench)
data("BostonHousing")

#crim : 1인당 범죄율
#rm : 주택 1가구당 방 수
#dis: 보스턴 5개 지역센터까지의 거리
#tax : 재산세율
#medv: 주택가격
class (BostonHousing)
dim (BostonHousing)
str (BostonHousing)
head (BostonHousing)
tail (BostonHousing)
myds <- BostonHousing [ , c( "crim", "rm","dis","tax" ,"medv" ) ]
myds

BostonHousing

##2 단계 : 파생변수 추가  : grp 변수 추가 ( 주택 가격 상중하)
# myds$medv의 i 번째 요소에 있는 값이 25.0 이상이면 grp 에 H/ 17 이하 L / 나머지는 M
grp <- c()
for( i in 1:nrow ( myds)){ 
  if( myds$medv [i] >= 25.0 ){
    grp [i] <- "H"
  } else if ( myds$medv [ i ] <= 17.0 ){
    grp [i] <- "L"
  } else {
    grp [i] <- "M"
      }
  }
  
grp <- factor (grp)
grp <-  factor( grp, levels =c( "H", "M", "L")) #레벨순서  ★★★★★★★★★★★★★★★★★★★

myds <-  data.frame ( myds, grp)
head ( myds)

##3단계 : 데이터셋의 형태와 기본적인 내용 파악 

str(myds)
head(myds)
table(myds$grp)


##4단계  : 히스토그램에 의한 관측값의 분포 확인

par( mfrow = c ( 2, 3))  #2x3 그래프 가상화면 
for( i in 1:5) {
  hist( myds[ , i ],
        main = colnames ( myds )[ i ],
        col = "yellow")
}

par( mfrow = c ( 1,1)) #가상화면 복귀 


##5단계  : 상자그림에 의한 관측값의 분포 확인 


par( mfrow = c ( 2, 3))  #2x3 그래프 가상화면 
for( i in 1:5) {
  boxplot ( myds[ , i ],
        main = colnames ( myds )[ i ])
}
par( mfrow = c ( 1,1)) #가상화면 복귀 

##6단계 : 그룹별 관측값 분포 확인 
boxplot(myds$crim~myds$grp, main = " 1인당 범죄율 ")   #grp 가 그룹화 ( factor형 )

boxplot(myds$rm~myds$grp, main = " 방의 개수 ")

##7단계 :  다중 산점도를 통한 변수간 상관관계 확인

pairs( myds [ , -6] ) #6번째 변수는 제외하고 보기 (Factor형 grp 제외)

##8단계 : 그룹 정보를 포함한 변수 간 상관관계 확인 

point <- as.integer(myds$grp)

color <-  c( "red", "green", "blue" )
pairs( myds[ , -6 ], pch = point, col = color [ point ]) #pch 점의모양 


##9단계: 변수간 상관계수 확인 
cor ( myds[ , -6 ] )

# > rm과 medv가  상관관계가 있음을 확인가능


#Data 이해
#1.Data set에 대한 이해
#2.문제 정의 검증
#3.문제 정의에 대한 1차 결과 파악 

#20191204 7회차 
#복습할 것 

#1 . cor 표현방법 
#cor(iris[ , 1:4 ])
#cor( income, period )
#plot 과 pairs

#==============================
  
##Data 분석 절차 _ 현상을 분석하고 이면을 찾는 과정
#1.문제 정의
#2.Data 수집
#3.Data 정제/ 전처리_불필요한 값을 제거
#4.Data 탐색_탐색적 Data 분석
# =>기본분석(변수들의 특성 , 평균, 최대값,최소값 등등)
#5.Data 분석_ Data model구축(Machine Learning)
#6.보고서

##Data preprocessing (데이터 전처리)
#원시 자료에 대하여  Data 정제/가공을 수행하여 분석에 적합한 형태로 만드는 과정

##Data 정제 ##

#1.결측치에 대한 처리(Missing value)
 #NA 값이 없는것_ 데이터를 읽을 수 없다
 #NA가 있으면 산술 연산 불가능

#2.이상치에 대한 처리
 #들어가면 안되는 값이 포함
 #eg. 나이에 마이너스값 등 

#↓↓↓↓↓

##Data 가공 ##
#정렬
#추가 
#필터링
#집계  
#병합

#==========================================
  
#결측치에 대한 처리_ 결측치가 해당 데이터셋에 어떠한 의미인지 파악 必 
#1. rational approach 
 #계산 공식을 알 때 결측치를 채워주는 방법
 #자주사용됨

#2. listwise deletion
 #결측치가 들어가 row를 삭제 
 #처리방법은 쉬우나 분석가능한 데이터의 양이 줄어듬 _ 분석결과에 영향을 미칠 수 있다
 #자주사용됨

#3. pairwise deletion
 # A B 의 상관관계를 따져서 임의로 값을 넣거나 삭제
 # 분석결과에 왜곡이 있을 수 있음 

#4. 단순 대입법
 # NA값에 변수를 대표할 수 있는 값 대입 (평균 값 / 중앙값) 
 # 자주사용됨

#5. 다중 대입법
 #결측치에 대표값을 바꿔가며 대입 =>  5~10번이상
 # 그 결과 값들을 다시 하나의 자료로 만듬
 # 데이터의 왜곡을 줄일 수 있다 

#========================================

##결측치 처리

# vector의 결측치 처리 

z <- c(1,2,3,NA,5,NA,8)
sum( z )       #결측치가 있는지 확인하는 과정 _ 결측치가 포함된 변수는 산술연산 불가능 결과 무조건 NA
is.na(z)       #is 함수는 결과값이 논리값 #TRUE = NA
sum( is.na(z)) #결측치 개수  (TRUE = 1 ,FALSE = 0 으로 자동 변경)
sum(z,na.rm = TRUE) 
#모든 산술연산은 na.rm 함수를 모두 갖고 있다.
# na.rm =>결측치 제외 유무 ( TRUE = 제외 , FALSE = 포함)


##결측치 대체 및 제거

#단순대입법
z1 <- z
z2 <- c(5,8,1,NA,3,NA,7) 
z1[ is.na(z1)] <- 0      #[ ]와 ()의 우선순위는 동일 / 
z1                       #안쪽부터 계산해서 ()먼저 계산
z1

# Listwise deletion
z3 <- as.vector(na.omit(z2))  #na.omit = >결측치 데이터 삭제 함수 
z3                         

###Matrix / Data Frame 결측치 처리###

x <- iris
x[1,2] <- NA
x[1,3] <- NA
x[2,3] <- NA
x[3,4] <- NA
head(x)

## Matrix / Data Frame 열별 결측치 확인

#1.for문 이용 

for( i in 1:ncol(x)){             #1부터 변수(col)수_5 번 반복
  this.na <-  is.na(x[ , i ])
  cat( colnames(x)[i],
       "\t", sum( this.na),       #sum ( 결측치 True/false )
       "\n")
}


#2.apply() 이용.1 _ apply(dataframe,행/열,함수)  행:1 / 열:2

col_na <- function( y ){         
  return ( sum ( is.na(y)))
}
na_count <- apply(x,2,col_na)   #열방향(2)으로 
na_count


#2.apply() 이용.2

na_count <- apply(x,2,
                  function(y) sum( is.na ( y)))   #funtion(y) sum( is.na )(y) : 익명함수 
na_count  #각변수의 결측치 수 

##_ 교재에 없는 부분 참고용##

barplot(na_count[ na_count > 0])

install.packages("VIM")
require( VIM)

#결측치 자료 조합 확인용 시각화 도구
aggr(x, prop = FALSE , numbers = TRUE)

x
#두개의 변수간의 결측치 관계 확인 시각화 도구
marginplot( x[c("Sepal.Width","Petal.Width")],
            pch = 20 , col =c ("darkgray","red","blue"),las = 1)  #빨간점이 결측치 

#=========================================================


#Matrix/ Data Frame 의 행 (data)별 결측치 확인
rowSums( is.na(x))
sum(rowSums (is.na(x)) > 0) #결측치가 포함되어있는 행의 수 

sum(is.na(x)) #행 열 구분 없이 전체 결측치 4 


#결측치를 제외한 새로운 데이터셋 생성

head(x)
x[ !complete.cases(x), ]  #NA가 포함된 행출력
y <- x[ complete.cases(x), ]  #complete.cases () =결측치가 포함된 행 제외 

head ( y )


#이상치(outlier)
#1.논리적으로 성립되지않는 값_눈으로 직접 찾아야함 
#2.상식적으로 용인되지않는 값_상자수염을 통해 이상치를 찾을 수 있다

# 특이값, 이상치 ( outlier )

st <- data.frame(state.x77)
st
summary(st$Income)
boxplot(st$Income)
boxplot.stats(st$Income)$out
                 
# 특이값 처리  : NA로 변환 후 결측치 처리 방법 이용
out.val <- boxplot.stats(st$Income)$out
st$Income[ st$Income %in% out.val] <- NA  #  %in% 연산자 : 포함되어있다면 
head(st)
newdata <- st[complete.cases(st), ]
head(newdata)

##Data 가공
 #정렬
 #추가 
 #필터링
 #집계  
 #병합
 
#데이터 가공
#
#데이터 정렬
#Vector

v1 <- c(1,7,6,8,4,2,3)
order(v1)
v1 <- sort(v1)
v1
v2 <- sort(v1,decreasing = T)  #decreasing = True:내림차순  / 설정안하면 오름차순
v2


#Matrix / Data Frame 정렬

head( iris)
order (iris$Sepal.Length) #결과값은 vector_첫번째행이 정렬했을때 14번째
iris[ order(iris$Sepal.Length), ] #Ascending
iris[ order ( iris $ Sepal.Length,decreasing = T), ] #Des
iris.new <- iris[ order ( iris$Sepal.Length), ]
head( iris.new)
iris[ order ( iris$Species, decreasing = T ,
      iris$Sepal.Length) , ]  #정렬기준을 2개 설정



#데이터 분리
iris
sp <-  split( iris, iris$Species) #iris 함수를 Species별로 분류 
sp
summary( sp )

sp$setosa
summary( sp$setosa )

#데이터 선택
subset( iris , Species == "setosa")
subset( iris , Sepal.Length > 7.5 )
subset( iris , Sepal.Length > 5.1 & Sepal.Width > 3.9 )
subset( iris , Sepal.Length > 7.6, 
        select = c ( Petal.Length, Petal.Width))

##데이터 Sampling

#1.비복원 추출
#한번 추출한 샘플데이터를 다음 샘플링할 때 제외시킴
#2.복원 추출
#한번 추출된 샘플데이터라도 다음 샘플시 다시 포함시킴 _ 같은 데이터가  샘플링 될 수 있음


#_숫자를 임의로 추출(Vector)
x <- 1:100
y <- sample( x, size = 10 , replace = FALSE)   # replace = FALSE (비복원)  TRUE(복원)
y

# dataframe에서 행을 임의로 추출
idx <-  sample ( 1: nrow ( iris ) , size = 50 , replace = FALSE)
idx
iris.50 <- iris [ idx, ]
iris.50
dim( iris.50 )
head( iris.50)


sample( 1:20, size = 5)
sample( 1:20, size = 5)
sample( 1:20, size = 5)

#set.seed (100)_ 100은 임의값  동일한 값을 샘플로 사용하고 싶을 때 
set.seed(100)  
sample( 1:20, size = 5)
set.seed(100)
sample( 1:20, size = 5)

##데이터 조합

#combn : combination (조합할 수의 범위 , 조합할 수의 범위)
combn( 1:5,3)   #1부터 5까지 3개를 뽑겠다 그 조합을 출력 
#10개만 출력되지만 조합이 더 많을 수 있따 


x = c ("red", "green", "blue", "black", "white")
com <- combn( x,2)
com


for( i in 1:ncol( com )) {
  cat( com[ ,i], "\n")
}


#데이터 집계    _ aggreagate는 집계함수_(집계할 대상 , 집계하는 기준 , 함수 ) 
agg <-  aggregate( iris[ , -5],
                   by = list ( iris$Species),
                   FUN = mean) ; agg

agg <-  aggregate( iris[ , -5],
                   by = list ( iris$Species),
                   FUN = sd) ;agg


head( mtcars)                                                           
agg <- aggregate(mtcars, by = list ( cyl= mtcars$cyl,         #_ by = 그룹으로 묶어라 그중에서 최고값을 구해라라
                                     vs = mtcars$vs),FUN = max)
agg


##데이터 병합 
x <- data.frame(name = c( "a","b","c"),
                mat = c (90, 80 , 40)) ;x


y <- data.frame( name = c( "a", "b", "d"),
                 korean = c(75,60,90));y

z <- merge(x,y,by = c("name"))  #공통변수일 경우 BY 생략 가능 
z            #이름이 같은 변수만 출력 
   

merge(x,y)
merge(x,y,all.x = T)  # x내용은 다 들어옴 _변수 추가 
merge(x,y,all.y = T)  # y내용은 다 들어옴 _변수 추가 
merge(x,y,all= T)     #단순 merge 

#두개의 다른 데이터프레임에 같은 변수명이 하나도 없을 때( name != sname)
  
x <- data.frame(name = c( "a","b","c"),     
                  mat = c (90, 80 , 40)) ;x


y <- data.frame( sname = c( "a", "b", "d"),
                 korean = c(75,60,90));y

merge( x, y, by.x = c ("name"),by.y = c("sname"))


#
###dplyr package_데이터 가공시 가장 자주 사용
#

install.packages("dplyr")
library(dplyr)

 #   %>% :pipe 연산자_단축키 ( 왼쪽 ctrl+ 왼쪽 shift +  M)
 #  A %>% B : A에 입력된것을 출력해서 그것을 다시 B에 입력  

df <- data.frame( var1 = c (1,2,1),
                  var2 = c(2,3,2))

df

#rename() : 이름변경  (함수, 바꿀이름 = 기존이름)

df <- rename ( df, v1 = var1, v2 = var2) 
df

#파생변수 추가 
df$sum <- df$v1 + df$v2
df

df[2,1] <- 5
df

df <- data.frame( id = c (1,2,3,4,5,6),
                  class = c(1,1,1,1,2,2),
                  math = c( 50,60,45,30,25,50),
                  english = c(98,97,86,98,80,89),
                  science = c(50,60,78,58,65,98))
df


#filter(): 행 추출

df %>% filter(class == 1 )
df %>% filter(class == 2 )
df %>% filter(class != 2 )
df %>% filter(class != 2 )

df %>% filter(science > 70)
df %>% filter(math < 50 )

df %>% filter( class ==1 & math >= 50 )
df %>% filter( math >= 50 | english >= 90 )
df %>% filter( class %in% c(1,3,5))

class1 <- df %>% filter( class == 1 )
class2 <- df %>% filter( class == 2 )
class1
class2

#select() : 변수 추출

df %>% select ( math )
df %>% select( science )

df %>% select ( class, math , science)

df %>% select( -math)

#dplyr 함수 조합

df %>% 
  filter( class == 1) %>% 
  select ( science )

df %>% 
  select( id, science ) %>% 
  head

df %>% 
  select( id, science ) %>% 
  max

#arrange() : 정렬

df %>% arrange ( science )  #오름차순
 
df %>% arrange(desc(science)) #내림차순 

#mutate() : 파생변수 추가
df %>% 
  mutate ( total = math + english +science) %>% 
  head
library(dplyr)

df %>% 
  mutate(total = math + english + science, 
         average = (math + english + science)/3) %>% 
  head

df %>% 
  mutate( grade = ifelse( science >= 60, "pass", 'fail')) %>% 
  head

df %>% 
  mutate(total = math + english + science, 
         average = (math + english + science)/3) %>% 
  mutate( grade = ifelse(average >= 90, "pass",ifelse(average<60,"fail","normal"))) %>% 
  head

df %>%
  mutate(total = math + english + science, 
         average = (math + english + science)/3) %>% 
  arrange(desc(average)) %>% 
  head

# 원 함수의 값을 계속 바꾼다면 초기의 입력순서를 알 수 없으므로 새 함수로 치환 #

#eg_)
df.sort <- df %>%
  mutate(total = math + english + science, 
         average = (math + english + science)/3) %>% 
  arrange(desc(average)) %>% 
  head
df.sort

#summarise() : 집단별 요약
#group_by() : 집단별 나누기 

df %>%  summarise( mean_math = mean ( math ))

  df %>% 
  group_by( class ) %>% 
  summarise( mean_math = mean ( math ),
             mean_english = mean (english),
             mean_science = mean ( science),
             n = n () )  # n = n (인수없음) => 빈도수 계산하는 함수 
  
  ## A tibble: 2 x 5  2행5열 
  ##<dbl>  :double 숫자형
  ##summarise함수를 할 때에는 보통 그룹화를 한다 
  
 
  str(mpg) install.packages( "ggplot2")
  str( ggplot2:: mpg)   # A:: => A가  가지고있는_LIBRARY를 통한 패키지 로드없이 사용  (패키지명::데이터셋이름 )
  mpg <- data.frame(ggplot2::mpg)
  mpg
  dim(mpg)
  head(mpg)
  View(mpg) #_대문자
  
mpg %>% 
  group_by( manufacturer, drv ) %>% 
  summarise( mean_cty = mean( cty ) ) %>% 
  head( 10 )
   
  mpg %>% 
    group_by( manufacturer) %>% 
    filter( class == "suv") %>% 
    mutate(tot = ( cty +hwy )/ 2) %>% 
    summarise( mean_tot = mean( tot)) %>% 
    arrange(desc(mean_tot)) %>% 
    head(5)
    
    
###데이터 합치기
    
# left_join(): 가로로 합치기( 변수 추가 )
#inner_join ():가로로 합치기(변수 추가) 
#full_join():가로로 합치기(변수 추가)
#bind_rows(): 세로로 합치기( data 추가)
  
df1 <- data.frame( id = c( 1,2,3,4,5),
                     midterm= c(60,80,70,90,85)) ; df1
df2 <- data.frame(  id = c( 1,2,3,4,5),
                       final = c(60,80,70,90,85)) ; df2

total <- left_join(df1,df2,by = "id") ; total
    

df1 <- data.frame( id = c ( 1,2,3),
                   address = c ( "서울","부산","제주"),
                   stringsFactors = F)  # 해당 문자열을 factor로 바꾸지마라 _ stringsFactors = F

df2 <- data.frame(id =c (1,2,4), gender = c ("남","여","남")) #둘중 왼쪽 df1 기준 추가 

df_left <- left_join(df1,df2,by = "id" )
df_left

df_inner <-  inner_join ( df1,df2, by = "id")  #둘중 공통된것만 추가 (merge와 동일)
df_inner

df_full <-  full_join(df1,df2,by = "id")   #  둘다 출력 
df_full




df1 <- data.frame( id = c( 1,2,3,4,5),
                   test= c(60,80,70,90,85)) ; df1
df2 <- data.frame(  id = c( 1,2,3,4,5),
                    test = c(60,80,70,90,85)) ; df2

df_all <-bind_rows(df1, df2)
df_all


install.packages("psych")
library(psych)


summary(mtcars)
describe(mtcars)  #n 관측치_ summary 보다 더많은 요약정보  

install.packages("descr")
require(descr)

df <- data.frame( id = c( 1,2,4 ),
                  
                  gender = c ("남","여","남"))
                  
                  table = (df$gender) #TABLE은 도수분포표
                  
                  freq( df$gender) #도수분포표 + 막대그래프까지 동시에 실행 //DESCR 패키지에 있다
                  freq(df$gener, plot = F) #PLOT = F 하면 막대그래프 안나옴 
                  
#
#break/next
#
sum <- 0
for ( i in 1:10) {
  sum <- sum +  i
  if ( i >= 5) {
    break          # 반복을 빠져나가라
      }
}
sum #15



sum<-0 
for ( i in 1:10){
  if ( i %% 2 == 0) {
    next     #다시 반복 제어문으로 올라가기
  }
  sum <- sum + i
}
sum #25

#2의배수를 제외하고 합계



#
#산술 내장 함수

log ( 10 ) + 5        #로그함수
log ( 10, base = 2)   #제곱급
sqrt( 25)             #가장 큰 수
max(5,3, 2)           #가장 작은 수
abs( -10)             #절대값
factorial(5)          #팩토리얼
sin ( pi / 2 )        #삼각함수

#
#사용자 정의 함수

mymax <- function (x,y){            #함수정의
  num.max <- x
  if ( y > num.max ) {
    num.max <- y
  }
  return ( num.max )
}

mymax( 10,15)                        #함수 호출
a <- 10
b <- 5
c <- 8
max <- mymax ( a,b)
max <- mymax ( max,c)
max
  

#사용자 정의 함수 매개변수 초기값 설정
#나눗셈 함수

mydiv <- function ( x,y = 2){
  result <- x/y
  
  return ( result)
}

mydiv ( x = 10 , y = 3 )    #[1] 3.333333
mydiv ( 10,3 )              #[1] 3.333333
mydiv ( 10 )                #[1] 5





#외부 파일에 있는 함수 호출
#함수 정의한 스크립트 생성 후 실행하기 

setwd( "C:/workR")           #경로 지정
source ( "mylib.R")          #lib파일(함수정의 script)지정_사용할파일

#함수 호출
my_max(10,5)
my_div(10,2)


#
#vector
#

#scalar 변수 사용
a <-10
b <- 5
c <- 8
d <- 4
e <- 45
f <- 75
g <- 24
h <- 64
i <- 12
j <- 123

max <- a
if ( b> max )  { max <- b }
if ( c > max ) { max <- c}
if ( d > max ) { max <- d}
if ( e > max ) { max <- e}
if ( f > max ) { max <- f}
if ( g > max ) { max <- g}
if ( i > max ) { max <- i}
if ( j > max ) { max <- j}

max


#vector 사용

v <- c (10, 5, 8 , 3, 5, 2,34, 24, 103)
max <- v [ 1 ]
for ( i in 2:length (v) ) {
  if ( v [ i ] > max  ) {
    max <- v [ i]
      }
}

max



#vector 생성 _ c 함수
 
x <- c ( 1,2,3 )               #[1] 1 2 3
y <- c ( " a ", " b ", " c " ) #[1] " a " " b " " c "
z <- c ( TRUE, TRUE , FALSE , TRUE ) #[1]  TRUE  TRUE FALSE  TRUE
x;y;z
      
#class는 자료의 속성을 알려줌

class ( x )  #[1] "numeric"
class ( y )  #[1] "character"
class ( z )  #[1] "logical"

w <- c( 1, 2, 3, 'a','b','c')
w
class (w)       #[1] "character" #vector는 무조건 동일 자료형 !

#vector 생성 방법  : 

v1 <- 50:90
v1
v2 <-  c(1, 2, 3, 50:90)
v2

class ( v1 ) 
class ( v2 )

#vector 생성 방법seq (시작값, 끝값, 간격)

  v3 <- seq (1, 101, 3 )     
  v3
  v4 <- seq ( 0.1,1.0,0.1)
  v4
  
#vector 생성방법ep (1 , times = 반복횟수)  
  
  v5 <- rep ( 1, times = 5 )
  v5
  v6 <- rep ( 1:5, times =3 )
  v6
  v7 <- rep ( c ( 1 ,5 ,9), times =3 ) 
  v7
  
  
  
  
  #벡터 원소값에 이름지정
  #names 는 이름을 지정할 때 사용
  # 이름 지정할 갯수와 벡터함수내 갯수 일치해야함
  score <-  c ( 90, 85, 70 )  
  names ( score )  #결과 : NULL
  names ( score ) <- c ( "Hong", "Kim", "Lee" )  
  names ( score ) #결과 : "Hong" "Kim"  "Lee"
  score #결과 : Hong  Kim  Lee 
  
  
  
  
  
  
  #벡터 원소 접근
  score [ 1 ]
  score [ 2 ]
  score [ 3 ]
  score ["Hong"]
  score [ "Kim"]
  score [ "Lee"]
  
  d <- c (1,4,3,7,8)
  d[1]
  d[2]
  d[3]
  d[4]
  d[5]
  d[6]
  
  for ( i in 1:length ( score ) ) {
    print ( score [i])
  }
  
  score_names <- c ( "Hong", "Kim","Lee")
  for ( i in 1 :length ( score ) ) {
    print (score [ score_names [ i ]  ])
  }
  
  

#벡터에서 여러 개의 값을 한번에 추출
  
  d <- c( 1,4,3,7,8 )
  d[ c ( 1,3,5 ) ] #1번 3번 5번 인덱스 값 1 3 8
  d[1:3] # 1~3까지의 인덱스 값 1 4 3
  d[ seq(1,5,2)] # 1번 3번 5번 인덱스 값 1 3 8
  d[-2]  #"-"는 제외의 의미  1 3 7 8
  d[-c(3:5)] # 3번4번5번 제외 1 4
    
  
  
GNP <- c( 2090, 2450 , 960 )
GNP

names ( GNP) <- c ( "Korea", "Japan" , "Nepal" )
GNP

GNP[1]
GNP["Korea"]
GNP[ c ( "Korea" , "Nepal" ) ]


#백터 요소값 변경
v1 <- c(1, 5, 7, 8, 9 )   
v1 #1 5 7 8 9

v1[ 2 ]  <- 3
v1 #1 3 7 8 9

v1[ c (1,5) ] <- c(10,20)
v1 # 10  3  7  8 20


#벡터간 연산_동일 인덱스에 있는 값끼리 연산 
# 두 벡터간 요소의 갯수가 같아야함

x <- c (1,2,3)
y <- c (4,5,6)
x + y
x * y
z <- x+y
z


#벡터에 적용가능한 함수

d <- c(1,2,3,4,5,6,7,8,9,10)
sum ( d )  # 합계
sum( 2 * d )
length ( d)            #벡터의 요소 개수(길이)
mean( d [1:5])         #평균
mean( d )
median(d[1:5])                 #중앙값
median ( d )
max( d )                        #최대값
min( d )                        #최소값
sort( d )                       #정렬
sort( d, decreasing = FALSE)
sort( d, decreasing = TRUE )
range(d)                       #값의 범위 (최소값~ 최대값)
var( d )                      #분산
sd ( d )                      #표준편차

v <- sum( d ) / length( d )  #평균 구하는 방법
v

#벡터에 논리 연산 적용

d>= 5
d[ d>5] 
sum ( d > 5)   #갯수
sum( d [ d>5]) #합계
d == 5

cond <- d > 5 & d < 8 
cond
d[cond]


 all ( d > 5 ) #false _전체가 5보다 크냐 
 any ( d > 5 ) #true_하나라도 5보다 크냐
 
 
 head ( d )   # 1 2 3 4 5 6  #default 값은 기본 6개 
 tail ( d )   #5  6  7  8  9 10
 head (d,3)   #1 2 3  # 갯수 지정
 tail (d,2)   #9 10   # 갯수 지정 
 
 x <- c ( 1,2,3)
 y <- c (4,5,6)
 z <- c (3,1,2)

 w <- c(x,y)   # 벡터x와 벡터y 결합 
 W
 union(x,y) #합집합
 intersect(x,y)#교집합
 setdiff(x,y)#차집합
 setequal(x,y)#x,y에 동일한 요소가 있는지 확인
 setequal(x,z)
 
 
 #LiST_ Key(변수명)와 index로 접근 모두 가능
 
 ds <- c(90,85,70,84) #얘는 벡터
 my.info <- list( name = 'Hong', age = 30 , status = TRUE, Score = ds)  
 
 #name,age,status,score 가 KEY
 # 각 값이 value
 my.info         
 my.info[ 1]              # 대괄호 1개는 인덱스 전체 
 my.info [[1]]            #대괄호 2개는 value 값 도출
 my.info$name             # Key이름 앞 $ 붙이기
 my.info[[4]]             # 벡터 내용 전체
 my.info[[4]] [1]         # 벡터 1번째 index
 
 
 #Factor형(범주형)
bt <- c ( 'A', 'B', 'B','O','AB' ,'A') #bt는 벡터
bt.new <- factor( bt )   #factor 형 벡터
bt
bt.new   # Levels: A AB B O _ Levels 는 가질 수 있는 값의 범위 
bt [5]   #"AB"
bt.new [5] #AB
levels ( bt.new ) #Level의 범위 값이 보고싶을 때 사용하는 함수 
as.integer ( bt.new )  #정수로 변환해라 _as는 변환함수 _Level에 맞춰 숫자 변환
bt.new [7] <- "B" 
bt.new [8] <- "c" #C는 Levels에 포함되지않기 때문에 에러 but 값이 생성됨
bt.new
         

#
#4일차
#
#함수 반환값(return 값)이 여러 개일 때 의 처리

myfunc <- function ( x, y){
  val.sum <- x + y 
  val.mul <- x * y
  
  return ( list ( sum = val.sum , mul = val.mul ) )
  }

result <-  myfunc ( 5, 8)
s <- result$sum
m <- result$mul
cat ( '5 + 8 = ', s,'\n')
cat ( '5 * 8 = ', m, '\n')

  

#Matrix 생성
#cloumn -> 행(관측치)_가로 row->열(변수)_세로
#R은 열 우선방식이 default
#matrix가 다 채워질 수 있도록 설정한 열|행의 배수로 숫자 설정


z <- matrix( 1:20, nrow = 4) # R은 default : 열 우선 방식 
z

z <- matrix( 1:20, ncol = 4 )
z

z <- matrix( 1:20, nrow = 4, ncol = 5)
z

#byrow 행우선  방식
z <-  matrix( 1:20, nrow = 4 , ncol = 5 , byrow = T ) 
z

x <- 1:4
x
y <- 5:8
y
z <- matrix(1:20,nrow = 4,ncol = 5 )
z
m1 <- cbind(x,y) #cbind 열로 결합
m1
m2 <- rbind(x,y) #rbind 행으로 결합
m2
m3 <- rbind(m2,x)
m3
m4 <- cbind(z,x)
m4
          
#Matrix에서 cell 값 추출
z <- matrix(1:20,nrow = 4,ncol = 5 )
z

z[2 , 3] #2행3열
z[1 , 4] #1행4열
z[2,]    #2행 
z[,4]    #4열 

z[2 , 1:3]       #2행의 1열부터3열
z[1, c(1,2,4)]   #1행의 1열2열4열
z[1:2,] 
z[ ,c (1,4)]     #1열과 4열전체

#Matrix에서 행/열 이름 지정
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,70),
                nrow = 4 , ncol = 3)
score
rownames(score) <- c( "Hong" , "Kim", "Lee", "Yoo") #관측치
colnames(score) <- c("English", "Math", "Science") #변수
score

score[ 'Hong', 'Math']
score[ 'Kim',c('Math', 'Science')]
score[ 'Lee']
score[ ,'English']
rownames( score )
colnames (score)
colnames (score) [2]


#Data Frame 생성_변수가 중요 ! 

city <-  c( "Seoul", "Tokyo" , "Washington")        #변수이름이 별도의 설정없이 들어가 있다.
rank <-  c(1,3,2)
city.info <-  data.frame ( city, rank )      #함수이름은 data.frame
city.info
                  
name <- c("Hong","Kim", "Lee")
age <-  c(22,20,25)
gender = factor( c ("M","F","M"))
blood.type =factor(c ( "A", "O" , "B"))
person.info <- data.frame( name, age, gender, blood.type)
person.info

person2.info <- data.frame( name = c( "Hong","Kim","Lee"),age = c( 22, 20, 25),
                             gender = factor(c("M","F",'M')),
                                             blood.type = factor( c ( "A","O","B")))
 person2.info
                             
                            
                            
city.info[1,1]
city.info[1,]
city.info[,1]
city.info[ city.info$city, ]
city.info[ , "rank"]

person.info$name
person.info[ person.info$name == "Hong", ]
person.info[ person.info$name == "Hong", c( "name", "age")]

data()

iris

iris[ , c(1:2)]
iris[ , c(1, 3, 5)]
iris[ , c( "Sepal.Length", "Species")]
iris[ 1:5]
iris[ 1:5, c (1,3)]

#Matrix 와 Data Frame 에서 사용하는 함수

name <- c("Hong","Kim", "Lee")
age <-  c(22,20,25)
gender = factor( c ("M","F","M"))
blood.type =factor(c ( "A", "O" , "B"))
person.info <- data.frame( name, age, gender, blood.type)
person.info 


dim( person.info)    #★관측치,변수 갯수 
dim ( iris) 
nrow( person.info)
nrow(m3)
ncol(person.info)
ncol(m3)
head( iris)           #앞부분 일부
tail( iris)           #뒷부분 일부
str( iris)            #★데이터의 형태,관측치 수obs, 변수의수 variables :
str( city.info )      #★변수이름($blah)과 자료형(num) 
str( person.info )    #★factor형으로 자동 변경이 되는 경우가 있음 
iris[ , 5]
unique(   iris[,5])   #중복된 데이터 하나씩 뽑아서 factor로 나열
table(iris[,"Species"])              #★종류별 카운트_Factor type일 때 가능 
table( person.info[ , "blood.type"]) 
table( person.info[ , "gender"] )


#Matrix/Data Frame 사용 함수
#행별/ 열별 합계와 평균계산

colSums( iris[ , -5] )           #변수의 합계 / 5번째 column(factor type 제외 )
apply( iris[ , 1:4 ] , 2 , sum)  # apply(범위, 1: row방향/2:column방향,내가하려는 동작)

colMeans( iris[ , -5 ] ) 
apply( iris[ , 1:4 ] , 2 , mean)

rowSums( iris[ ,-5 ] )  
apply( iris[ , -5 ] , 1 , sum)

rowMeans( iris[ , -5 ] )  
apply( iris[ , -5 ] , 1 , mean)

apply( iris[ , -5 ] , 2 , median) #중앙값



#행/열 방향 전환
z <- matrix( 1:20 , nrow = 4 , ncol = 5)
z
t( z )

#조건에 맞는 행과 열의 값 추출 (Data Frame만 가능)
IR.1 <- subset( iris , Species == "setosa")
IR.1

IR.2 <- subset( iris, Sepal.Length > 5.0 & Sepal.Length > 4.0)
IR.2
IR.2[ , c(2,4)]
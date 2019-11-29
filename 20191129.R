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
IR.1 <- subset( iris , Species == "setosa")  #subset 조건에 맞는 관측치 출력 
IR.1

IR.2 <- subset( iris, Sepal.Length > 5.0 & Sepal.Width > 4.0)
IR.2
IR.2[ , c(2,4)]

#Matrix / Data Frame 산술연산

a <-  matrix ( 1:20 , 4,5)
a

b <- matrix ( 21:40, 4, 5)
b

2 * a 
b - 5
2 * a + 3 * b

a+b
b-a
b / a
a * b

#Matrix/Data frame 자료구조 확인/변환

class ( iris )   #자료형이 matrix or data.frame인지
str(iris)

class ( state.x77 )  # 자료형에 따라 str의 결과가 다르게 나옴 
str( state.x77 )   #matrix 경우 str : 자료형, 행과열 정보, 데이터 내용


is.matrix ( iris)    #is 함수는 결과값 항상 논리값
is.data.frame ( iris)
is.matrix(state.x77)
is.data.frame( state.x77)

st <- data.frame ( state.x77)  
str(st)         # 매트릭스에서 데이터프레임으로 변환
head(st)        
class(st)
dim( st )       #관측치 50개 변수 8개 


iris.m <- as.matrix(iris[ , 1:4])  #데이터프레임의 1부터 4까지를 매트릭스로 변환 
head( iris.m)                      #as함수는 변환
class ( iris.m)
str( iris.m ) #150행 4열 

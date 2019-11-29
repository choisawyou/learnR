#
# R 프로그래밍 1일차
#
#first.R
#
#seoyoon
#
#최초작성일 : 2019.11.26
#
#
print("Hello, World!!!")

number <- 10
number2 = 100

number3 <- number

numberValue <- 1      #camel 표기법
str_value <- "R Language" #snake
booleanvalue <- TRUE


numberValue <- "R script"
numberValue <- 1

print( numberValue)
print( str_value)
print( booleanvalue)


cat( "Numeric number : ", numberValue, "\n")
cat( "String : ", str_value,"\n" )
cat( "Blooean value : ",booleanvalue, "\n")

numberValue <- scan()
cat( "Numeric number :", numberValue, "\n")

numverValue <- scan()



numverValue <- scan()

print( numberValue )

print( numberValue )


number1 <- 10
number2 <- 20
resultAdd <- number1 + number2
resultSub <- number1 - number2
resultMul <- number1 * number2
resultDiv <- number1 / number2
resultRem <- number2%% number1
resultSec <- number2 ^ 5

print( resultAdd )
print( resultSub)
print( resultMul)
print( resultDiv)
print( resultRem)
print( resultSec)

number1 <- 0
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1
number1 <- number1 + 10
number1



number2 <- 100
number1 <- number2 + 10
number1
number2






print ( (number1 + 10) * number2 / 2 )

number300 = 10


number300 <- number300 + 10
number300



number301 <- number300 * 2
number301

number1 <- 10.5
number2 <- 10
print ( number1 > number2 )
print ( number1 >= number2 )
print ( number1 < number2 )
print ( number1 <= number2 )
print ( number1 == number2 )
print ( number1 != number2 )


print ( number1 > 10 & number2 >10 )     #AND
print ( number1 > 10 | number2 > 10 )    #OR
print ( !( number1 > 10 ) )              #NOT




number <- "100"
str <- "R Language"
result = number + str
print ( result )







#
#제어구조 - 선택구조
#

job.type <- 'A'

if ( job.type == 'b') {
  bonus <- 200      #참일때
  } else {             #거짓일때
   bonus <- 100 
}
cat ( "job type :", job.type, "\t\tbonus : ", bonus )




job.type <- 'B'
if  ( job.type == 'A') {
  bonus <- 200
}
cat ( "job type : ", job.type, "\t\tbonus :", bonus )


score <- 85
if (score >= 90 ) {
  grade = 'A' 
}  else if ( score >= 80 ) {
  grade <- 'B'
} else if ( score >= 70 ){
grade <- 'C'
} else if ( score >= 60 ) {
   grade <- 'D'
} else {
  grade <- 'F'
}
cat ( "score : ", score, "\t\tgrade :" , grade)



number <- 15
#remainder <- number %% 2
#if ( remainder == 0)

if ( number %% 2 == 0 ) {
  result <- "짝수"
} else {
  result <- "홀수"
  } 

cat ( "Number : ", number, "는 " , result ,"이다" )


number <- 20
remainder <- number %% 2

if ( remainder == 0){
  result<- "짝수"
} else {"홀수"}

 cat ( result, "이다")
 
 
 a <- 10
 b <- 20
 
 if ( a > 5 & b > 5 ) {
   cat ( a, " > 5 and ", b, "> 5 " )
} else {
 cat( a, " <= 5 or " , b, " <= 5 " )
}
 
 
 a <- 10
 b <- 20
 
 
 if ( a > b ) {
   c <- a
 } else {
   c <- b
 }
 cat("a = ", a, "\tb = ", b, "\tc = ", c )
 
 
 c <- ifelse( a > b, a, b )
 cat( "a = ", a, "\tb = ", b, "\tc = ", c )
 
 
 
 #제일 큰 수를 max에 저장 후 max를 출력
 
 a <- 10
 b <- 5
 c <- 8
max <- a

if ( b > max ) {
  max = b
} 

if ( c > max ) {
  max = c 
}

cat( " a = ", a, " b = ", b, " c = ", c, " max = ", max )


a <- 3
b <- 9
c <- 8

max <-a

if (b>max) {
  max = b
}
if ( c > max) {
   max = c
}

cat( "a ='", a, "  b = ", b, "c=", c, "max = ", max) 
 
 
 
#반복구조
#for 문_범위가 명확할 때 사용

for ( i in 2:8 ) {
  print( i )
}




#while문_ 반복 제어변수(i) 반드시 설정_ 범위가 애매할때 
i <- 1
while ( i <= 10 ) {
  print ( i )
  i <- i + 1
}


multiple <- 2
i <- 2
while ( i <= 9 )  {
  cat( multiple, 'X', i, ' = ', multiple * i, '\n' )
  i <- i + 1
}



#1-100까지 한줄에 10개씩 출력 
#1
for (s in 1:100) {
  cat( s,' ' )
  if ( s %% 10 == 0 ) {
    print( '\n' )
  }   
}

#2
lineCount <- 1
for ( i in 1:100 ){
  cat(i, ' ')
  lineCount <- lineCount + 1
  if ( lineCount > 10 ) {
    print( '\n')
    lineCount <-1
  }
}  


linecount<-1
count<-1

for ( i in 1:1000){
   if( i %% 3 == 0 | i %% 5 == 0 )
        cat(i , " ")
   count <- count + 1 
   linecount <- linecount +1
    if ( linecount > 21 ) {
      print("\n")
        linecount <- 1 
    }
}

cat ("총 갯수 : ", count , "개")
  
  

#1~1000까지 3의 배수와 5의 배수를 한줄에
#10개씩 출력하고 마지막에 개수를 출력

i <-1
count <- 0
linecount <- 1
multiple3 <- NULL
multiple5 <- NULL
while( i <= 1000 ) {
  multiple3 <- i %% 3
  multiple5 <- i %% 5
  if( multiple3 == 0 | multiple5 == 0 ) {
    count <- count + 1
    cat ( i , " ")
    linecount <- linecount + 1
    if (linecount > 10 ) {
      linecount <- 1
      print( "\n" )
    }
  }
  i <- i + 1
}
print( "\n" )

cat ( "1 ~ 1000 사이의 3의 배수와 5의 배수의 개수 : " , count, "\n")
    

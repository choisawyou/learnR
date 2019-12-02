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

library( rJava )
library( xlsx )

df.xlsx <-  read.xlsx ( file  = "airquality.xlsx", sheetIndex = 1 ,
                        encoding = "UTF-8")

df.xlsx
class( df.xlsx)
str(df.xlsx)
head( df.xlsx, 3)
tail( df.xlsx, 3)

#csv와 엑셀을 읽었을 때 차이점 : xlsx로 읽었을 때 factor로 변경되는 경우 ㅇ
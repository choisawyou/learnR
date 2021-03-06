#최서윤
#작성일 : 2019 12 04
#제출일 : 2019 12 05

#문1)
#다음과 같이 결측값이 포함된 데이터셋 ds를 생성한 후, 다음 문제를 해결
#하기 위한 R 코드를 작성하시오.

ds <- state.x77
ds[2,3] <- NA
ds[3,1] <- NA
ds[2,4] <- NA
ds[4,3] <- NA

#(1) 각 열별로 결측값이 몇 개인지 출력하시오.
class(ds)
colSums(is.na(ds))

#(2) 결측값이 포함된 행들의 데이터를 출력하시오.★
head(ds)
ds[!complete.cases(ds)] #NA가 포함된 행출력



#(3) 결측값이 포함된 행은 몇 개인지 출력하시오.
sum(rowSums(is.na(ds))>0)  #3개

#(4) 결측값이 포함된 행들을 제외하고 새로운 데이터셋 ds.new를 만들어보시오.
dim(ds)
ds.new <- ds[complete.cases(ds), ]
dim(ds.new)

#문2)
#다음과 같이 state.x77 데이터셋을 st에 저장한 후 다음 문제를 해결하기
#위한 R 코드를 작성하시오.

st <- data.frame(state.x77)

#(1) st의 각 변수(열)들에 대해 특이값이 존재하는지 상자그림을 그려 확인하시오.
str(st)
boxplot(st$Population) #존재 ; 
boxplot(st$Income) #존재
boxplot(st$Illiteracy) #없음
boxplot(st$Life.Exp)#없음
boxplot(st$Murder)#없음
boxplot(st$HS.Grad)#없음
boxplot(st$Frost)#없음
boxplot(st$Area)#존재 ;


#(2) 특이값이 존재하는 경우 이상치를 NA로 대체하여 저장하시오.
out.p <- boxplot.stats(st$Population)$out
st$Population[st$Population %in% out.p] <- NA
st$Population

st$Area
out.a <- boxplot.stats(st$Area)$out
st$Area[st$Area %in% out.a] <- NA
st$Area

#(3) st에서 NA가 존재하는 행들을 제거하여 st2에 저장하시오.

head(st)
st2 <- st[complete.cases(st), ]
st2

#문3) 
#R에서 제공하는 airquality 데이터셋에 대해 다음의 문제를 해결하기 위한
#R 코드를 작성하시오.
class(airquality)
#(1) airquality를 AQ에 저장하시오.
AQ <- airquality
AQ

#(2) AQ에서 열별로 NA의 개수를 출력하시오.
colSums(is.na(AQ))

#(3) AQ에서 행별로 NA의 개수를 출력하시오.
rowSums(is.na(AQ))

#(4) AQ에서 NA를 포함하지 않은 행들만 출력하시오.
AQ[complete.cases(AQ),]

#(5) AQ에서 NA를 NA가 속한 열의 평균값으로 치환하여 AQ2로 저장하고, AQ2의 내용을
#출력하시오.		★★★★★★★★★★★★★★★★★★
class(AQ)
AQ2 <- AQ[ , AQ %in% NA] <- mean(AQ %in% NA)

AQ2

AQ[ ,AQ %in% NA] <- AQ

#문4)
#R에서 제공하는 state.x77 데이터셋에 대하여 다음 문제를 해결하기 위한
#R 코드를 작성하시오.
class(state.x77)
st <- data.frame(state.x77)

class(st)
#(1) state.x77 데이터셋을 Population(인구수)를 기준으로 오름차순 정렬하시오.
<<<<<<< HEAD
class(state.x77)

state.x77[order(state.x77$Population), ]

#(2) state.x77 데이터셋을 Income(소득)을 기준으로 내림차순 정렬하시오.
=======
  
  }
state.x77[order(st$Population),] #matrix를 dataframe으로 바꾼 후 실행

# 매트릭스를 정렬하는 방법이 있을까?

#(2) state.x77 데이터셋을 Income(소득)을 기준으로 내림차순 정렬하시오.

#(3) Illiteracy(문맹률)가 낮은 상위 10개 주의 이름과 문맹률을 출력하시오.	

x <- state.x77[order(st$Illiteracy),]
class(x) #matrix
x.1 <- data.frame(x)
x.1

#문5)
#R에서 제공하는 mtcars 데이터셋에 대하여 다음 문제를 해결하기 위한 R
#코드를 작성하시오.

#(1) mtcars 데이터셋을 gear(기어)의 개수에 따라 그룹을 나누어 mt.gear에 저장하
#시오.(단, split() 함수를 사용)
class(mtcars)

mt.gear <- split(mtcars,mtcars$gear)
mt.gear
class(mt.gear)

#2) mt.gear에서 gear(기어)의 개수가 4인 그룹의 데이터를 출력하시오.
mt.gear$"4"

#(3) mt.gear에서 gear(기어)의 개수가 3인 그룹과 5인 그룹의 데이터를 합쳐서
#mt.gear.35에 저장하고 내용을 출력하시오.

mt.3 <- mt.gear$"3"
mt.3                                          

mt.5 <- mt.gear$"5"

mt.gear.35 <- merge(mt.3,mt.5,all = T)

mt.gear.35

#(4) mtcars 데이터셋에서 wt(중량)가 1.5~3.0 사이인 행들을 추출하여 출력하시오.

mtcars %>% filter(wt>= 1.5 & wt < 3.0)

#문6)
#다음의 문제를 해결하기 위한 R코드를 작성하시오.

#다음과 같이 데이터프레임 authors와 books를 생성하고 authors와 books의 내
#용을 출력하시오.	

authors <- data.frame( surname = c( "Twein", "Venables", "Tierney", "Ripley", "McNeil" ),
                       nationality = c( "US", "Australia", "US", "UK", "Australia" ),
                       retired = c( "yes", rep( "no", 4 ) ) )

class(authors)

books <- data.frame( name = c( "Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil" ),
                     title = c( "Exploratory Data Analysis", 
                                "Modern Applied Statistics ...",
                                "LISP-STAT",
                                "Spatial Statistics", "Stochastic Simulation",
                                "Interactive Data Analysis" ),
                     other.author = c( NA, "Ripley", NA, NA, NA, NA ) )

books
authors

#(1) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하시오(두						   
#데이터프레임에서 공통 열의 값이 일치하는 것들만 병합).

merge(authors,books,by.x = c("surname"),by.y = c("name"))

#(2) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되
#authors의 행들이 모두 표시되도록 하시오.
merge(authors,books,all.x = T)
#(3) surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되 books
#의 행들은 모두 표시되도록 하시오.
merge(authors,books,all.y = T)
#(4) surname과 other.author를 공통 열로 하여 yauthors와 books를 병합하여 출력하
#시오.	
merge(authors,books,by.x = c("surname"),by.y = c("other.author"))

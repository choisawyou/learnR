# 최서윤
# 작성일 : 2019 12 17
# 제출일 : 2019 12 17

#문1)
#trees 데이터셋에 대해 다음의 문제를 해결하는 R 코드를 작성하시오.
str(trees)
head(trees)

#(1) 나무 둘레(Girth)와 나무의 키(Height)로 나무의 볼륨을 예측하는 다중선형 회귀
#모델을 만드시오.
#y = Volume
#x = girth,height
model.tree <- lm(Volume~Girth + Height , data = trees)
coef(model.tree)

#(2) 다중선형 회귀모델을 이용하여 trees 데이터셋의 나무 둘레(Girth)와 나무의 키
#(Height)로 나무의 볼륨을 예측하시오.
fitted(model.tree)
#(3) (2)에서 예측한 볼륨과 실제 trees 데이터셋의 볼륨(Volume)이 얼마나 차이가
#나는지 보이시오. (예측값, 실제값, 예측값-실제값을 나타낸다.)
residuals(model.tree)

#문2)
#mtcars 데이터셋에서 다른 변수들을 이용하여 연비(mpg)를 예측하는 다중 회귀모델을 만드시오.

#(1) 전체 변수를 이용하여 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타
#내시오.

model.mt <- lm(mpg~.,data = mtcars) ; model.mt

mtcars$mpg =  12.30337 + (-0.11144 * mtcars$cyl) +
    ( 0.01334 * mtcars$disp) + 
    (-0.02148 * mtcars$hp )  + 
    ( 0.78711 * mtcars$drat) +
    (-3.71530 * mtcars$wt)   + 
    ( 0.82104 * mtcars$qsec) + 
    (0.31776  * mtcars$vs)   +
    ( 2.52023 * mtcars$am)   + 
    (0.65541  * mtcars$gear) + 
    (-0.19942 * mtcars$carb)

summary(model.mt)

#(2) 연비(mpg)를 예측하는 데 도움이 되는 변수들만 사용하여 예측하는 회귀모델을
#만들고 회귀식을 나타내시오.
summary(model.mt)
coef(model.mt)
md.mt <- stepAIC(model.mt)
summary(md.mt)

#(3) (1), (2)에서 만든 예측모델의 설명력(Adjusted R-squared)을 비교하시오.

#모든 변수 대상 설명력 : 0.8066 
# 연비에 영향주는 변수들만 대상 설명력 : 0.8336 

#문3) 
#UCLA 대학원의 입학 데이터를 불러와서 mydata에 저장한 후 다음 물음에 답하시오.

mydata <- read.csv( "https://stats.idre.ucla.edu/stat/data/binary.csv" )

str(mydata)

#(1) gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는
#로지스틱 모델을 만드시오(0: 불합격, 1:합격).

mydata.n <- mydata
mydata.n$admit <- as.integer(mydata$admit)
data_model <- glm(admit~gre + gpa + rank,data = mydata.n)
data_model
coef(data_model)
summary(data_model)

#(2) mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여
#(1)에서 만든 모델에 입력하여 합격 여부를 예측하고 실제값과 예측값을 나타내시오.

head(mydata)
data <- mydata[,c(2:4)]

testing <- predict(data_model,data)
testing
test.round <- round(testing,0)

table(test.round)

#실제값 standard 
#예측값 test.round
standard <- as.integer(mydata$admit)
a <- standard == test.round
table(standard)
table(a)

#실제합격자수 127명
#예측합격자수 43명

#(3) 만들어진 모델의 예측 정확도를 나타내시오.
ratio <- mean(standard == test.round)
ratio #70.5%

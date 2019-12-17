#20191217 15회차
#회귀식 
#훈련 Data _ x,y값 _w,b를 구하기위해
#Test Data _ x값만 필요

####다중선형 회귀분석 ( multiple linear regression anlysis)####

##다중선행 회귀모델 : 여러개의 독립변수를 다루는 회귀모델##
#                     연속형 data에 대한 예측

#회귀식
#y= B0 + B1X1 + B2X2 + B3X3 + ...... + BnXn
#B0가 절편 , B1~Bn이 기울기

#독립변수가n개인 다중선형회귀에서 주어진 자료를 이용해
#B0, B1, B2, B3, ..., Bn의값을 알아내는 회귀모델

library(tidyverse)
library(car)

str(Prestige)
head(Prestige)

#종속변수
# y = income
#독립변수
# x = education,Prestige(평판),women(여성비율)

newdata <- Prestige[ , c( 1:4 )]
head(newdata)

plot(newdata,pch = 16, col ='pink',
     main = "Matrix Scatterplot")

model <- lm(income~education + prestige + women,
            data = newdata)
model
coef(model)
#> coef(model)
#(Intercept)   education    prestige       women 
#-253.8497      177.1990    141.4354     -50.8957 
#B0:기울기     B1:edu계수    B2:pre계수   B3: wom계수

#회귀식 
#income = (-253.8497) + (177.1990 * newdata$education ) +
#                       (141.4354 * newadata$prestige ) +
#                       (-50.8957 * newdata$women  )

fitted(model) #예측값
residuals(model) #예측값과의 차이 
deviance(model) #잔차
deviance(model) / length(newdata$education) #평균제곱오차

summary(model)

#선형회귀분석
#1.model 결정
#2.계수 결정 _훈련 data(  x,y값 )를 통해 회귀식 완성 /가설 검정 
#3.예측 _text data( x값 )_예측 정확도 판단 必
#4.실제값으로 예측

    #Call:
    # lm(formula = income ~ education + prestige + women, data = newdata)

    #Residuals:
    #    Min      1Q  Median      3Q     Max 
    #-7715.3  -929.7  -231.2   689.7 14391.8 

    #Coefficients:
    #           Estimate Std.  Error   t value   Pr(>|t|)    
    #(Intercept)  -253.850   1086.157  -0.234    0.816    
    #education    177.199    187.632   0.944    0.347   #education은 income에 영향적다
    #prestige     141.435     29.910   4.729   7.58e-06 ***
    #women        -50.896      8.556  -5.948   4.19e-08 ***
    #---
    #Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

    #Residual standard error: 2575 on 98 degrees of freedom
    #Multiple R-squared:  0.6432,	Adjusted R-squared:  0.6323 
    #F-statistic: 58.89 on 3 and 98 DF,  p-value: < 2.2e-16
    
    ##Adjusted R-squared##
    # 0 ~ 1사이값 1에 가까워질수록 현실 설명력이 높다_
    # = 예측값이 실제값과의 차이가 적을 확률이 높다 


newdata2 <- Prestige[, c( 1:5)]
model2 <- lm(income~.,data=newdata2) #이하전체다 : y~.
summary (model2)

library(MASS)
model3 <- stepAIC(model2) ###y값과 영향력이 적은 x값 자동 제거###

summary(model3)  #model2보다 model3의  Adjusted R-squared값(설명력)이 더 높다


####Logistic Regression : 범주형 Data에대한 예측 _결과값을 범주형태로 변환####
#One-hot-encoding _ 0과 1로 바꿔주는 함수 

#Logistic Regression(로지스틱 회귀분석)
#
#회귀모델에서 종속 변수의 값의 형태가 범주형인 경우 
#예측모델
#
#주어진 data로부터 어떤 범주를 에측하는 분야를
#회귀와 구분하여 분류(classification)이라고 한다. 

# 로지스틱 회귀도 기본적으로 회귀기법이기 때문에 
# 종속변수는 숫자로 표현되어야한다. 
# eg) YES와 NO는 0과 1로 setosa,versicolor,virginica는 1,2,3과
# 같이 숫자로 바꾼 후에 로지스틱 회귀적용


iris.new <- iris
iris.new$Species <- as.integer(iris.new$Species) #범주형을 숫자형으로 변환 
head(iris.new)

iris_model <- glm(Species~.,data = iris.new) #logistic regression 은 glm함수 
iris_model
coef(iris_model)
summary(iris_model)

unknown <- data.frame(rbind(c(5.1,3.5,1.4,0.2))) #이 값에 대한 species를 찾는 과정
names(unknown) <- names(iris)[1:4]
unknown

pred <- predict( iris_model, unknown)
pred  #결과 0.9174506      #품종을 123으로 변경했듯이 이 결과값 변환 必_onehotencoding
pred <- round(pred,0)     #반올림함수

levels(iris$Species)[pred]  #반올림한 후 해당값을 넣어서 품종확인 

test <- iris[,1:4]  #iris 함수로 test
test
pred <-  predict(iris_model, test) ;pred
pred <- round( pred, 0)
pred
answer <- as.integer(iris$Species)
pred == answer
acc <- mean( pred ==  answer)
acc      #예측 성공률

#20191216  14일차

#문제정의 
#   ↓
#자료수집
#   ↓
#자료전처리
#   ↓
#탐색적data 분석 (data이해)   →  분석보고서 or 
#   ↓
#data model →   →   →   →   →   →     ↑   
# - 예측
# - 분류
# - 군집화 

#data model은 꼭 해야되는 과정은 아니지만
#이를 통해 data를 예측/분류/군집화를 하는데 도움을 줄 수 있음 

#Modeling : Model을 만들어 내는 과정
#Data Modeling => 현실 세계를 표현하는 수식을 도출하는 과정 
#수식 _data model _ 통계적 관점
#대표적 수식 : y= wx + b   _ x에의해서 도출되는 y의 값을 예측
# y : 반응변수 ( Lable , 정답) 
# x : 독립변수 ( 특성 )
# w,b : 계수 , 매개변수 _Data modeling은 이 계수를 찾는 과정 
# w(weight) : 기울기 b(bias) : 경향_둘다 상수 
#회귀 → 연속형 data

#Model 과정
#1.Model 선택 : 수식 결정 eg) y=wx+b :Regression expression = 회귀식_ 예측에 사용  
#2.실제 data(x,y)를 이용하여 w,b 값을 결정 / 훈련하는 과정 
#3.실제 data를 통한 예측 
#4.Model 평가 _오차가 적을수록 model의 성공률 ↑

#모여있는 데이터를 가장 잘 설명할 수 있는 선을 찾는 과정 

#단순선형회귀분석 : y=wx+b :설명변수가 하나인 경우 
#다중선형회귀분석 : 설명변수가 여러개인 경우 
#==============================================================

#Modeling : 현실 세계에서 일어나는 현상을 수학식으로 표현하는 행위

#데이터 과학에서
#독립변수 x를 설명변수(explanatory vatiable), 특징 (feature)
#종속변수 y를 반응변수(response variable), 레이블 ( lable)
#x가 입력되면 y를 맞추어야 하는 문제 , y를 ground truth로 간주

# 데이터 과학에서 Modeling이란 수집한 data(훈련 data)를 이용하여 최적의 
#모델을 찾아내는 과정

#최적의 모델을 찾는 과정
#모델: y = Wx+b (매개변수)
#
#1.모델 선택 -> 선형 방정식 선택
#2.주어진 data(훈련data)를 적용하여 매개변수결정 #lm함수
#3.예측은 훈련 data에 없는 새로운 data로 모델이 레이블을 추정하는 과정 #predict()함수 
#4.완성된 모델에 대한 품질 평가  #summary() 함수 결과이해 


#cf)) #예측(평가)을 할 때에는 훈련했을 떄 사용한 데이터가 아닌 다른데이터 사용

####회귀분석 (Regression Analysis)####
#  관찰된 연속형 변수에 대해 두 변수 사이의 모형을 구한 뒤 
#  적합도를 측정해 내는 분석방법
# 시간에 따라 변화하는 데이터나 어떤 영향, 가설적 실험,
# 인과 관계의 모델링등의 통계적 예측에 이용될 수 있다.


####단순선형 회귀분석 ( simple linear regression analysis )####
#  독립변수와 종속변수와의 관계가 선형으로 표현
#  하나의 독립변수를 다루는 분석방법
#단순 선형 회귀모델의 회귀식 : y = Wx+b ( w,b는 상수)
# w,b는 어떻게 찾을 수 있을까?
# x,y로 구성된 data를 이용하여 w,b를 찾아내는 모델 




####단순선형회귀분석- 예측모델####
# 어떤 변수가 반응변수이고 설명변수인지 정해야함 
#설명(x)에따라 반응(y)이 결정
y= Wx+b #회귀식
y=distance
x=speed
###주행거리와 제동거리 사이의 회귀모델
str(cars)
head(cars)

#산점도를 통한 선형 관계 확인
plot(dist~speed, data = cars)
plot(cars)

#회귀모델 구하기,
#종속 (반응=y)변수~독립(설명=x)변수 순서로 지정
model <- lm(dist~speed,cars)   #lm(종속변수(y)~설명변수(x))
model   #cars라는데이터셋을 통해 w와 b를 찾아라 _ cars는 훈련하는 데이터셋
#model은 회귀식

#Call:
#    lm(formula = dist ~ speed, data = cars)
#
#Coefficients:  -> 매개변수, 계수
#(Intercept)     speed  
# -17.579         3.932   #설명변수(=x) 밑에 나오는 값이 기울기(w) 
#   b값            w값
# y = 3.932 * x - 17.579

abline(model)

##매개변수 (계수) - w,b값 출력
coef(model)
cars

##훈련 data에 있는 샘플에 대한 예측값_회귀식에 따라 계산한 예측값
fitted(model)

##잔차: 회귀식으로 추정되 값과의 차이 (오차)
residuals(model)

##잔차 제곱합을 평균제곱오차(MES_mean squared error)로 변환
deviance(model) / length ( cars$speed )

b <- coef(model)[1]
w <- coef(model)[2]

speed <- 21.5
dist <- w*speed +b
dist

#
df <- data.frame( speed = c(21.5,25.0,25.5,26.0,26.5,27.0,27.5,28.0))

predict( model , df) #예측수행함수 predict(lm으로 도출한 회귀식,x값)

plot(df$speed, predict(model, df), col = "red",cex = 2, pch = 20)
abline(model)

#
speed <- cars[ ,1]  #1열만 출력_ speed값
speed
pred <- w * speed + b
pred
compare <- data.frame(pred,cars[ , 2], pred-cars[,2] )

compare

colnames(compare) <- c('예상','실제','오차')

head(fitted(model),3) #예측
head(residuals(model),3)#추정된 값과의 차이
head(compare,3) 

#

#평균은 클수록, 분산은 작을수록, 데이터 크기가 클수록 #세가지를 t라고 함 
#믿음이 커진다. -> t-통계량 (t - statistics) / t-값 ( t-value)
#t-값이 크면 대립가설에대한 믿음이 강해진다.
#t-값이 작으면 대립가설에 대한 믿음이 약해진다 
#  데이터를 통해 ' 대립가설이 통계학적으로 유의미하다'라는 것을
#  증명하고 확인하는 작업을 t-검정(t-test)라 한다
#
#'귀무가설이 참이라고 가정했을 때, 표본으로 부터 얻어지는
#통계치가 나타날( 관측될) 확률' 을 계산하는데 이 때 계산된 
#확률값을 p값이라 한다


#p값의 통상적 기준은 0.05  
#p값이 매우 낮으면(0.05 이하 ), 이러한 표본 통계값은 우연히 나타나기 
#어려운 케이스이기 때문에 , 우리는 귀무가설을 채택하지 않고 (기각하고)
#대안적인 가설인 가설, 즉 대립가설을 채택한다. 

summary(model)

#Call:
#    lm(formula = dist ~ speed, data = cars)
#
#Residuals:
#    Min      1Q  Median      3Q     Max 
#-29.069  -9.525  -2.272   9.215  43.201 
#
#Coefficients:
#    Estimate Std.         Error  t value  Pr(>|t|)    
#(Intercept) -17.5791     6.7584  -2.601   0.0123 *  
#    speed    3.9324      0.4155   9.464   1.49e-12 ***  #x가 y에 미치는 정도에 따라 ' *' 갯수
#    ---
#    Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
#
#Residual standard error: 15.38 on 48 degrees of freedom
#Multiple R-squared:  0.6511,	Adjusted R-squared:  0.6438 
#F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12

#스피드가 제동거리에 영향을 미친다 
str(cars)
head(cars)
car_model <- lm(dist~speed, data = cars) ; car_model
coef(car_model)
plot(car_model)
abline(car_model,col = 'red')
summary(car_model)

#키가 크면 몸무게가 많이 나간다 
str(women)
head(women)
women_model <- lm(weight~height, data = women);women_model
coef(women_model)
plot(women_model)
abline(women_model,col = 'red')
summary(women_model)


#CARS
#Coefficients:
#    Estimate Std.         Error  t value  Pr(>|t|)    
#(Intercept) -17.5791     6.7584  -2.601   0.0123 *    
#    speed    3.9324      0.4155   9.464   1.49e-12 ***  #x가 y에 미치는 정도에 따라' *' 갯수

#0.0123 회귀선 기준 데이터 분산 정도 _값이 작을수록 회귀선 기준으로 모여있는 것

#WOMEN
#Coefficients:
#              Estimate Std.   Error     t value          Pr(>|t|)    
#(Intercept)     -87.51667    5.93694    -14.74           1.71e-09 ***  #1.71e-09 회귀선 기준 데이터 분산 정도 회귀선 기준 데이터 분산 정도 _값이 작을수록 회귀선 기준으로 모여있는 것
#    height        3.45000    0.09114     37.85           1.09e-14 ***

#1.71e-09 회귀선 기준 데이터 분산 정도 회귀선 기준 데이터 분산 정도 _값이 작을수록 회귀선 기준으로 모여있는 것



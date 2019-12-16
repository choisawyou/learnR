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
#대표적 수식 : y= wx + b   _ x에의해서 y의 값을 예측
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


#단순선형 회귀분석 ( simple linear regression analysis )

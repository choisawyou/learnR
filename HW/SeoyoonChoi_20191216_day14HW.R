#최서윤
#작성일 20191216
#제출일 20191216

#문1)
#state.x77 데이터셋에서 문맹률(Illiteracy)을 이용해 범죄율(Murder)을 예측
#하는 단순선형 회귀모델을 만드시오. 그리고 문맹률이 0.5, 1.0, 1.5일 때 범
#죄율을 예측하여 보시오.
str(state.x77)
head(state.x77)
Il <- c(state.x77$Illiteracy)
Ill <- state.x77[,3]
Mur <- state.x77[,5]
im <- data.frame(Ill,Mur)
im
# y=wx+b
# x= state.x77$Illiteracy 설명변수
# y= state.x77$Murder  반응
plot(Mur~Ill,data=im)
model <- lm(Mur~Ill,data=im)
model
coef(model)
b <- coef(model)[1]
w <- coef(model)[2]
ratio.m <- w*Ill+b  #predict를 쓰면 이식은 필요없나
df <- data.frame( Ill = c(0.5,1.0,1.5))
predict(model,df)
#     1        2         3 
# 4.525504  6.654232  8.782961 

#문2)
#trees 데이터셋에서 나무둘레(Girth)로 나무의 볼륨(Volume)을 예측하는 단
#선형 회귀모델을 만드시오. 그리고 나무 둘레가 8.5, 9.0, 9.5일 때, 나무의
#볼륨(Volume)을 예측하여 보시오.

str(trees)
head(trees)
# x = girth
# y = volume
plot(Volume~Girth,data=trees)
model.2 <- lm(Volume~Girth,data = trees)
abline(model.2)
df.2 <- data.frame(Girth = c(8.5,9.0,9.5))
df.2
predict(model.2,df.2)
#      1         2         3 
#6.116320  8.649249 11.182177 

#문3) 
#pressure 데이터셋에서 온도(temperature)로 기압(pressure)을 예측하는 단
#순선형 회귀모델을 만드시오. 그리고 온도가 65, 95, 155일 때 기압을 예측
#하여 보시오.

#x =temp
#y = pressure

plot(pressure~temperature, data = pressure)
model.3 <- lm(pressure~temperature,data = pressure)
abline(model.3)
df.3 <- data.frame(temperature = c(65,95,155))
predict(model.3,df.3)
#         1          2          3 
#-49.591581  -4.218984  86.526208 

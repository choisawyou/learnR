#최서윤 
#제출일 2019 12 18
#작성일 2019 12 18

#문1)
#R에서 제공하는 state.x77 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

#• 군집의 수는 5로 한다.
#• state.x77은 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화를 실시한 후 군집화를 실행한다.
head(state.x77)

#표준화
standard <- function(x){
    return((x - min( x ))/max(x)-min(x))
}
st <- apply(state.x77,2,standard)
st

fit <- kmeans(x = st,center = 5)
fit

clusplot( st, fit$cluster, color = TRUE, shade = TRUE, labels = 2, lines = 0 )

#문2)
#mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-평균 군집화를 실시하고 결과를 그래프로 출력하시오.

#• 군집의 수는 2로 한다.
#• Sonar 데이터셋에서 마지막에 있는 Class 열은 제외하고 군집화를 실행한다.

library( mlbench )
data( "Sonar" ) 			# 데이터셋 불러오기
dim(Sonar)
sn <- Sonar[,-61]

group_sn <- kmeans( x= sn , center = 2)
group_sn

library(cluster)

clusplot(sn,
         group_sn$cluster,
         color = T,
         shade = T,
         labels= 2,
         lines = 1)


#문3) 
#mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 
#이용하여 모델을 만들고 예측 정확도를 측정하시오.
#. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
#. Sonar 데이터셋에서 홀수 번째 데이터(관측값)를 훈련용 데이터로 하고,
# 짝수번째 데이터(관측값)를 테스트용 데이터로 한다.
#. k-최근접 이웃에서 k를 3, 5, 7로 다르게 하여 예측 정확도를 비교한다.

library(class)
dim(Sonar)
str(Sonar)
odd.n <- seq(1,nrow(Sonar),2) #훈련용 인덱스 
doub.n <- seq(2,nrow(Sonar),2) #테스트용 인덱스 

sn.tr <- Sonar[odd.n,] ; sn.tr#훈련용 데이터
sn.ts <- Sonar[doub.n,] ; sn.ts#테스트 데이터
tr <- factor(Sonar[odd.n,61]) # 훈련용 데이터 그룹정보 팩터화 
ts <- factor(Sonar[-odd.n,61]) # 테스트용 데이터 그룹정보 팩터화 

pred <- knn(sn.tr,sn.ts,tr,k = 3, prob = TRUE) ; pred

acc <- mean(pred == ts)
#k = 3 
#예측 정확도 0.9333333

#k = 5 
#예측 정확도 0.9333333
acc
#k = 7
#예측 정확도 0.9333333



#문4) 
#mlbench 패키지에서 제공하는 Sonar 데이터셋에 대해 k-최근접 이웃 알고리즘을 이용하여 모델을 만들고 예측 정확도를 측정하시오.

#. Sonar 데이터셋에서 마지막에 있는 Class 열이 그룹 정보이다.
#. k-최근접 이웃에서 k는 3으로 한다.
#. 5-fold 교차 검증 방법으로 예측 정확도를 측정한다.
#20191218 16회차 #
#분류분석 : 교재 511~
#군집분석 : 교재 542~

#의사결정 tree : 교재 514~
#교재 519~
#뉴런 : 교재 537~
#시계열 data분석 :교재 ~636

#Linear regression : 예측 _ 연속형 data에대한 회귀분석
#Logistic regression : 분류예측_ 범주형 data에대한 회귀분석
#군집화(clustering)_어떤 정보가 어떤 그룹에 속하는지 
#   이경우 '그룹'에대한 정보가 초기에는 없다 
#   eg.한 기사(article)가 정치면에 속한다 할 때 초기에는 '정치'라는 그룹에대한 정보 x

#분류 알고리즘 
#1.군집화
#2.분류 예측(logistic regression)
#3.분류  
# => 1)KNN  2)K means  3)Decision tree  4)Random forest  5)Suppot vector machine(svm)
##===================================================================================##

##지도학습모델 ( supervised  learning model ) _ 예측과 분류 ##
# =>학습 data에 답이포함 (독립변수(feature),종속변수(label) 모두 존재 )
# 대상 알고리즘 : linear regression(대표적 예측 모델), logistic regression,
# KNN(K-Nearest Neighbor근접 이웃),#random forest,decision tree(의사결정),
# svm(Support Vector Machine, 분류 예측 모두 사용)

##비지도학습모델 ( unsupervised learning model ) _ 군집화##
# => 학습 data에 답이 미포함 (only 독립변수)
#대상 알고리즘 : K-means(평균)


####군집화(clustering) / 분류 (classfication)####

##군집화(clustering)##_(군집,범주,그룹)
#주어진 대상 데이터들을 유사성이 높은 것끼리 묶어주는 기술 (group,category)
#주어진 data에 group 정보가 없다 

##K-means(K-평균) 군집화 알고리즘##

#과정#
#1.산점도 그리기 
#2.임의의 위치에 점(a)을찍는다 _그룹2개로 나눌 때 점 2개 , 그룹3개 점 3개
#3.점과의 데이터와 거리 계산
#4.가까운 점과 데이터를 모으기
#5.a점을, 모인 데이터의 중앙으로 옮긴다.
#6.데이터가 추가로 들어와도 중심점이 
# 옮겨지지않는 시점에서 데이터 군집화(분류) 종료 

mydata <- iris[,1:4]
fit <- kmeans( x= mydata,center =3) ;fit

##결과## 

#K-means clustering with 3 clusters of sizes 62, 50, 38
# => 3개의 군집에 속한 데이터 개수

#Cluster means:  #3개 군집의 중심점 좌표 #도출함수 fit$centers
#    Sepal.Length Sepal.Width Petal.Length Petal.Width
#1     5.901613    2.748387     4.393548    1.433871
#2     5.006000    3.428000     1.462000    0.246000
#3     6.850000    3.073684     5.742105    2.071053
fit$centers #3개 군집의 중심점 좌표

#Clustering vector: #각 데이터에대한 군집 번호 => 도출함수 fit$clusters
#[1] 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
#[45] 2 2 2 2 2 2 1 1 3 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 3 1 1 1 1 1 1 1 1 1 1
#[89] 1 1 1 1 1 1 1 1 1 1 1 1 3 1 3 3 3 3 1 3 3 3 3 3 3 1 1 3 3 3 3 1 3 1 3 1 3 3 1 1 3 3 3 3
#[133] 3 1 3 3 3 3 1 3 3 3 1 3 3 3 1 3 3 1
fit$cluster #각 데이터에대한 군집 번호


library(cluster)  #차원축소 후 군집 시각화 패키지 

        clusplot(mydata, #군집대상
                 fit$cluster,  #군집번호
                 color = T,    #원의색
                 shade = T,    #원의 빗금표시유무 
                 labels =2,  #관측값 출력형태_label 2는 숫자 , label 1은 모양
                 lines =1)   #중심점 연결 표시여부_ 1은 선 有,0은 선 無
subset(mydata, fit$cluster == 2)

###표준화 ####
#대상 데이터 표준화 후 군집화
#데이터와 데이터의 거리를 계산할 때 발생하는 문데
#모든 변수가 거리 계산에 동등한 영향을 갖도록
#하기 위해서 모든 변수의 자료 범위를 0~1사이로
#표준화한 후 거리 계산을 한다. 

#(x - min (A)) / max(A) -min (A))
#x: 변수 A의 임의의 관측값
#max ( A ), min ( A )는 변수 A 관측값중 최대/최소값

#eg) 키와 시력 : 키(180cm)가 숫자가 크기가 크기 때문에 시력(1.0)에비해 영향을 더 크게 미침


std <- function(x){
    return(( x - min ( x ))/(max(x) - min(x)))
}

mydata <- apply( iris[ , 1:4 ],2, std)
View(mydata)
fit <- kmeans(x = mydata , center =3)
fit
View(iris[ , 1:4 ])

#군집화 (clustering ): 그룹정보가 없는 data의 그룹을 알아내는 model
#분류(classification):'특정' data가 어떤 그룹에 속하는지 알아내는 model_ KNN 분류 알고리즘 

####KNN 분류 알고리즘 ####
#1. 특정 data(x) 근접한 이웃 데이터들과 함께 x를 묶는다
#2. 묶은 데이터 중 더많이 속하여 있는 그룹에 x가 속하게 된다 
#eg) x주위에 묶어서 a그룹 b그룹 

library(class)

#훈련용 /테스트용 데이터 준비 #일부는 훈련용,일부는 테스트용 

#X 라는 데이터를 1)훈련용 2)테스트용 분리 
#1)훈련용데이터를통해 훈련 => 모델y 도출
#2)테스트용데이터를 y모델에 적용 
#테스트용 데이터를 모델에 적용하는 순간 overfitting이 일어날 수 있다 

tr.idx <- c(1:25,51:75,101:125) ;tr.idx #인덱스
ds.tr <- iris[tr.idx,1:4]; ds.tr #훈련용 
ds.ts <- iris[-tr.idx,1:4]#테스트용

cl.tr <- factor(iris[tr.idx,5]); cl.tr #훈련용 그룹정보 _ 문자열 팩터를 숫자 팩터로 변경해줘야 훈련/테스트비교가능 
cl.ts <- factor(iris[-tr.idx,5]); cl.ts

pred <- knn(ds.tr,ds.ts,cl.tr,k=3,prob = TRUE) #테스트 그룹  :많은 데이터가 있는 쪽으로 따라가라 (TRUE)
pred
acc <- mean( pred == cl.ts)  #True =1 false =0 값들의 평균
acc #예측정확도 
table(pred,cl.ts)

#k의 값은 보통 1~7사이. 변경해가며 예측정확도가 가장 높은 값으로 사용

#
#교차 검증방법(K-fold cross validation)_군집화를 할 때 
#

install.packages('cvTools')
library(cvTools)

k = 10
folds <-  cvFolds(nrow( iris ), K =k ) #폴드 생성
acc <- c() #폴드별 예측 정확도 저장용 벡터

acc   #폴드별 예측정확도 -  0.9333333
 mean(acc) #폴드를 통해서 10번 테스트하며 예측정확도를 0.9333333에서 0.9666667으로 올렸다 

#K-fold cross validation: overfitting 가능성을 줄인 검증 방법 . 
#                         훈련 할때마다 테스트 데이터가 달라짐 

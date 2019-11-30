#최서윤
#작성일:2019/11/29~2019/12/1
#제출일:2019/12/2



#
#문1) 

#score
#      m  f
#[1,] 10 21
#[2,] 40 60
#[3,] 60 70
#[4,] 20 30

#1.위와 같은 내용의 matrix score를 생성
#1.1
score <- c(10,21,40,60,60,70,20,30)
score
matrixscore <-   matrix(score,nrow = 4 ,ncol = 2 ,byrow = T )
matrixscore

#1.2
score <- matrix(c(10,21,40,60,60,70,20,30),nrow =4 ,ncol =2,byrow =T)
score

#2.score의 열 이름을 각각 male, female로 바꾸시오
  
  colnames(score) <- c("male","female")
  score
  
#3.2행에 있는 모든 값을 출력
  score[2,]

#4. female의 모든 값을 출력
  
#질문 score["female"] 하면 값이 안나와요 왜죠?
  score[ , 2]
  
#5.3행 2열의 값을 출력
  score[3,2]

  
#문2)
#R에서 제공하는 state.x77 데이터셋을 이용하여 작성  
  
#1. state.x77을 변환하여 st에 data frame으로 작성
class(state.x77)
st <- data.frame(state.x77)

#2. st의 내용을 출력
st

#3. st의 열 이름 출력
 colnames(st)

#4.st의 행 이름 출력
 rownames(st)

# 5. st의 행의 개수와 열의 개수 출력
 dim(st)
 
# 6. st의 요약 정보 출력
 str(st)

# 7. st의 행별 합계와 평균 출력
 rowSums(st)
 apply(st,1,mean)

#8. st의 열별 합계와 평균 출력
  colSums(st)
  apply(st,2,mean)
 
#9. Florida 주의 모든 정보 출력
  class(state.x77)
  st <- data.frame(state.x77)
  
  st["Florida", ]

#10. 50개 주의 수입(Income) 정보만 출력
  st[ ,"Income"]

#11. Texas 주의 면적(Area)을 출력
  st["Texas","Area"]
  
#12. Ohio 주의 인구(Population)와 수입(Income) 출력
  st["Ohio",c("Population","Income")]

#13. 인구가 5,000 이상인 주의 데이터만 출력
  stp <- subset(st,Population >= 5000)
  stp
  
#14. 수입이 4,500 이상인 주의 인구, 수입, 면적을 출력 
   st.1 <- subset(st, Income >= 4500)
   st.1
   st.1[ ,c("Population","Income","Area")]
   
#15수입이 4,500 이상인 주는 몇 개인지 출력★
 length(st.1)
 cat("수입이 4,500 이상인 주는" , length(st.1) , "개 이다") 
  
#16. 전체 면적(Area)이 100,000 이상이고, 
#결빙일수(Frost)가 120 이상인 주의 정보 출력
  st.2 <- subset(st,Area>=100000 & Frost>=120)
  st.2
  
#17. 인구(Population)가 2,000 미만이고, 범죄율(Murder)이 12미만인 주의 정보 출력
  
  
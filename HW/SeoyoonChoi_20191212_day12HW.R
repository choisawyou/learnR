#최서윤
#작성일 : 20191211-20191212
#제출일 : 20191212
Sys.setenv( JAVA_HOME = 'C:/Program Files/Java/jre1.8.0_231' )

install.packages("wordcloud")     #word cloud
install.packages("wordcloud2")    #word cloud
install.packages("KoNLP")         #한국어처리
install.packages("RColorBrewer")  #색상선택_단어에 색상부여하기위해

library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

##wordcloud 패키지
library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

##데이터 시각화 도구
library(dplyr)
library(ggplot2)

#문1)
#20대 국회 개원 여·야 3당 대표 국회연설문에 대해 각각 워드클라우드를
#작성하시오.
#예제소스 파일은 ‘ex_10-1.txt’, ‘ex_10-2.txt’, ‘ex_10-3.txt’이다.
setwd("C:/learnR/HW")
text1<- readLines( "ex_10-1.txt",encoding = "UTF-8") ; text1
text2<- readLines( "ex_10-2.txt",encoding = "UTF-8") ; text2
text3<- readLines( "ex_10-3.txt",encoding = "UTF-8") ; text3

buildDictionary(ext = 'woorimalsam')
pal <- brewer.pal(8 , 'Dark2')

#ex-10-1 워드 클라우드 
noun.1 <- sapply(text1,extractNoun,USE.NAMES = F);noun.1

n1 <- unlist(noun.1) ; n1

edit.1 <- n1[nchar(n1) > 1];edit.1

cnt.1 <- table ( edit.1) ; cnt.1

wordcloud(names(cnt.1),
          freq =cnt.1,
          scale = c( 6,0.5),
          min.freq = 3,
          random.order = T,
          rot.per = .1 ,
          colors = pal)

#ex-10-2 워드 클라우드 
noun.2 <- sapply(text2,extractNoun,USE.NAMES = F);noun.2
 
n2 <- unlist(noun.2); n2
edit.2 <- n2[nchar(n2) >= 2]; edit.2
cnt.2 <- table( edit.2 ); cnt.2
sort(cnt.2,decreasing = T)

wordcloud(names(cnt.2),
          freq = cnt.2,
          scale = c(5,1),
          min.freq =3,
          random.order = T,
          rot.per = 0, colors = "red")

#ex-10-2 워드 클라우드 

noun.3 <- sapply(text3,extractNoun,USE.NAMES = F) ; noun.3
n3 <- unlist(noun.3); noun.3
edit.3 <- n3[nchar(n3) >= 2]; edit.3
cnt.3 <-  table(edit.3); cnt.3
sort(cnt.3, decreasing = T)

wordcloud(names(cnt.3),
           freq = cnt.3,
           scale = c(6,0.5),
           min.freq =3 , 
           random.order = T , 
           rot.per = 0.2 )

#문2)
#스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성
#하시오.
#Tip. 예제소스 파일은 ‘ex_10-4.txt’이다.

text <- readLines("ex_10-4.txt", encoding = "UTF-8")

noun <- sapply(text,extractNoun,USE.NAMES = F); noun
vn <- unlist(noun);vn
table(vn)
sort(vn,decreasing = T)
vn.1 <- vn[nchar(vn) >= 2] ; vn.1
vn.1 <- gsub("개월", "" , vn.1)
vn.1 <- gsub("하지", "" , vn.1)
vn.1 <- gsub("그것", "" , vn.1)
vn.1 <- gsub("점들", "" , vn.1)
vn.1 <- gsub("여러분", "" , vn.1)
vn.1 <- gsub("가지", "" , vn.1)
vn.1 <- gsub("무엇", "" , vn.1)
vn.1
cnt <- table(vn.1) ; cnt
sort(cnt,decreasing = F)

wordcloud(names(cnt),
          freq = cnt,
          scale = c(15,0.5),
          min.freq = 3,
          random.order = T,
          rot.per = .2,
          colors = pal )
          
#문3) *****#21개월 단어 추가 안됨 ???????????????????????
#오바마 대통령의 데통령 당선 연설문에 대해 워드클라우드를 작성하시오
#Tip. 예제소스 파일은 ‘ex_10-5.txt’이다.


obm <- readLines( "ex_10-5.txt", encoding = "UTF-8")
obm1 <- sapply(obm,extractNoun,USE.NAMES = F); obm1
obm2 <- unlist(obm1) ;obm2
obm3 <- obm2[nchar(obm2)>=2];obm3
#21개월 추가 과정 
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame('21 개월','ncn'),
                replace_usr_dic = T ) 
obm3 <- obm2[nchar(obm2)>=2];obm3


obm3 <- gsub('들이','',obm3)
obm3 <- gsub('동안','',obm3)
obm3 <- gsub("때문",'',obm3)
obm4 <- table(obm3)
sort(obm4,decreasing = T)

wordcloud(names(obm4),
          freq = obm4,
          scale = c(15,0.4),
                    min.freq = 2,
                    random.order = T,
                    rot.per = .1,
                    colors = pal)


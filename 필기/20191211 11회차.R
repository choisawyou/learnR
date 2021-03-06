#20191211 11회차
# day 11hw 복습하기
#aggregate 함수 

#============================================================

##data mining : 의사결정을 위해서 DB(정형화 data)로부터 규칙과 
#              패턴을 발견하는 기법

##text mining : Text Data(자연어_비정형data)로부터 규칙과 패턴을 발견하는 기법 
#              자료 처리 과정과 자료분석과정
#대표적 text mining 시각화 도구: word cloud _ 단어 빈도수

#문제정의를 하는 과정에서 텍스트 마이닝 사용 _ 결과를 통해 분석 방향을 정할 수 있다 

##한글 워드클라우드 절차
#1.Java 실행환경 구축_ jdk 설치 절차와 동일
#2.자료수집 (Text자료)
# 2-1 Text file 형태로 수집      cf) 메모장으로 열리면 텍스트 파일
# 2-1 Web scraping을 이용하여 수집   
#3.명사 추출 _JAVA JRE 설치 경로 
Sys.setenv(JAVA_HOME = "C:/Program Files/Java/jre1.8.0_231")
#4.명사 추출
#5.추출된 단어에 대한 빈도수 계산 및 시각화

##필요시 설치_wordcloud 패키지
install.packages("wordcloud")     #word cloud
install.packages("wordcloud2")    #word cloud
install.packages("KoNLP")         #한국어처리
install.packages("RColorBrewer")  #색상선택_단어에 색상부여하기위해

##wordcloud 패키지
library(wordcloud)
library(wordcloud2)
library(KoNLP)
library(RColorBrewer)

##데이터 시각화 도구
library(dplyr)
library(ggplot2)

#R에서 텍스트 파일을 읽을 때 마지막에 공백줄 최소 한줄 _ 없으면 오류

setwd("C:/learnR/자료")
text <- readLines( "mis_document.txt",encoding = "UTF-8") 
text   #읽어들인 파일에서 '명사'를 추출해야함 

#우리말씀 사전 로드
buildDictionary( ext_dic = 'woorimalsam' )
pal2 <- brewer.pal( 8, 'Dark2') #색상팔레트생성
noun <- sapply( text ,extractNoun, USE.NAMES = F) #명사 추출 #extractNoun : 명사 추출
    #sapply는 추출함수 #extractNoun : 명사 추출 
# _USE.NAMES = F_행이름을 안쓰겠다_출력할때 해당 단어가 포함된 줄을 출력 X_ True랑 비교 
str(noun)

#사전에 없는 단어는 추출이 되지않는다 #

##추출된 단어(주로 명사)에 대한 빈도수 계산 및 시각화

noun2 <- unlist(noun) #추출한게 리스트 형식이니 그것을 vector화 
wordcount <- table(noun2)   #명사별 빈도수 카운트 
sort.noun <-  sort( wordcount, decreasing = T )[1:10] # 빈도 내림차순 , 상위 10개 
sort.noun
sort.noun <-  sort.noun[ -1 ] #공백제거 
barplot(sort.noun, names.arg = names(sort.noun),
        col = 'steelblue',main = '빈도수 높은 단어',
         ylab = '단어빈도수')

df <- as.data.frame( sort.noun )
df


ggplot(df, aes( x = df$noun2, y = df$Freq )) +
    geom_bar( stat = "identity", # x축만 있을 때, y축의  default는 빈도수)
             width =0.7,         #Identity 는 y축이 추가되면 y값으로 세로축 으로 표현해준다는 말 
             fill = "steelblue" ) +
    ggtitle('빈도수 높은 단어') +
    theme( plot.title = element_text ( size = 25,
                                      face = "bold",
                                      colour = "steelblue",
                                      hjust = 0, 
                                      vjust = 1 ))+
    labs(x = "명사" , y = '단어빈도수') +
    geom_text( aes ( label = df$Freq ), hjust = -0.3 ) +  #빈도표시 
    coord_flip()


    ## word cloud 작성
    wordcloud( names( wordcount ),   #출력할 단어
               freq = wordcount,     #단어빈도
               scale = c(6, 0.7),     #단어폰트크기(최대,최소 )
               min.freq = 3,          #단어최소빈도
               random.order = F,     #단어출력위치
               rot.per = .1 ,       #90도 회전단어비율
               colors = pal2)         #단어 색
          
    
    
    ##다른 팔레트 사용 
    pal3 <- brewer.pal(9,"Blues") [5:9]
    wordcloud( names( wordcount ),   #출력할 단어
               freq = wordcount,     #단어빈도
               scale = c(6, 0.7),     #단어폰트크기(최대,최소 )
               min.freq = 3,          #단어최소빈도
               random.order = F,     #단어출력위치
               rot.per = .1 ,       #90도 회전단어비율
               colors = pal3)         #단어 색
    
##6.전처리 과정 수행     
# 6-1.불필요한 단어 삭제
# 6-3.생략된 단어를 사전에 등재
    
buildDictionary(ext_dic = "woorimalsam",
                user_dic = data.frame( '정치', 'ncn' ),  
                #(단어 등록,품사) _정치라는 단어가 사전에 해당품사로서 등록하겠다
                
                replace_usr_dic = T )
noun <- sapply( text, extractNoun,USE.NAMES = F )
noun2 <- unlist( noun )

##6-1.불필요한 단어삭제
noun2 <- noun2[ nchar( noun2 ) > 1] #단어길이 2 이상인 거만 취급/ 2 미만은 삭제 
noun2 <- gsub( '하지','',noun2 ) #gsub(a,b,함수 F) _데이터 F에서  a를 b로 바꿔라 _직접지정 
noun2 <- gsub('때문','', noun2 )
wordcount <- table( noun2)


#7. wordcloud


##애국가 형태소 분석

library(KoNLP)
useSystemDic()  #시스템사전 _ 28만 단어
useSejongDic()  #37만단어
useNIADic()     #98만단어 

##애국가 가사:https://www.mois.go.kr/frt/sub/a06/b08/nationalIcon_3/screen.do



##1. 사전 설정   _사용할 사전 설정 
useSejongDic()
##2. 텍스트 데이터 가져오기

word_data <- readLines('애국가(가사).txt')
word_data

##3.명사추출
word_data2 <- sapply(word_data, extractNoun, USE.NAMES = F )  
word_data2
#추출된 단어가 '남산위에' => "남산"이라고 안나온 이유는 사전에 없을 수도 
#이처럼 자동화를 넘어 사람의 개입을 통해 정확성을 높여줘야함 _결과 확인 필수 

##3-1.제대로 추출되지않은 단어를 사용자 사전에 등록 

add_words <- c('백두산','남산','철갑','가을','하늘','달')
buildDictionary(user_dic = data.frame(add_words, rep('ncn',length(add_words))), replace_usr_dic = T)
get_dictionary('user_dic')

##3-2.단어 추가 후 다시 명사 추출
word_data2 <- sapply(word_data,extractNoun, USE.NAMES = F)
word_data2 

##4.행렬을 벡터로 변환

undata <- unlist(word_data2)
undata

##5. 사용 빈도 확인  table은 빈도계산 함수 
word_table <- table(undata)
word_table

##6.필터링 : 두글자 이상 단어만 선별 , 공백이나 한 자리 문자를 걸러냄 
#_필터링할 기준을 세우기 

undata2 <- undata[ nchar (undata) >= 2]
undata2
word_table2 <- table(undata2)
word_table2

##7.데이터 정렬
sort( word_table2, decreasing = T)#빈도수 내림차순 정렬 

#애국가 형태 분석 완료
#가장 기본적인 전처리만 수행, 100% 정확한 데이터라 볼 수 없음 

##8.word cloud 작성후 분석

#기본형
wordcloud2( word_table2) 
#배경색 지정
wordcloud2(word_table2,color = "random-light",
           backgroundColor = 'black')

##8-1.모양 변경

wordcloud2(word_table2,
          fontFamily = '맑은고딕',
          size = 1.2 , color = 'random-light',
          backgroundColor = 'black', shape  = 'star')


##8-3. 선택 색상 반복
wordcloud2( word_table2, size =1.6,
            color = rep_len(c('red','blue'),
                            nrow(word_table2)))

wordcloud2( demoFreq, size =1.6,
            color = rep_len(c('red','blue'),
                            nrow(word_table2)))

##8-4.일정방향 정렬
wordcloud2(word_table2,
           minRotation = -pi / 6,
           maxRotation = -pi /6,
           rotateRatio =  1 )


wordcloud2(demoFreq,
           minRotation = -pi / 36,
           maxRotation = -pi /36,
           rotateRatio =  1 )


#모든 웹은 ip를 가지고 있으나 기억하기 어려워서, DMS가 생성 _ eg)naver.com
#서버의 역할은 응답대기
#client의 역할은 서버에게 요청 = request : 1) get   2) post 방식 
#컴퓨터간 통신할 때에는 protocol(약속)이 필요 _ WEB PROTOCOL : HTTP
#HTTP PROTOCOL 은 header & body로 이루어져 있음 
#get 방식은 header에데이터를 담아 전송
#get 방식_ header의 크기는 크지않기 때문에 get방식은 데이터 전송 사이즈  제한이 있다
#get 방식_보안성이 약하다
#주소창 ? 뒤에 보이는 게 get 방식 
#post 방식은 body에 데이터를 담아 전송
#post 방식은 데이터 제한 x 
#post 방식은 보안성이 비교적 좋다 
#html을 해석하는 프로그램이 웹브라우저 
#<HTML>에서는 시작- tag와 끝 tag사이의 내용을 본다 .  첫 태그는 <HTML>
#<HTML>-<HEAD>-</HEAD>-<BODY>-<H1>,</H1>-</BODY>-<HTML>


##scraping _ 주로 body
#WEB SCRAPPING _내가 원하는 자료를 검색 할 수 있어야함 
#<div 공간 분할  / class,id : attribute _ id는 유일 / class 공통 이름 
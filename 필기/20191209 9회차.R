##20191209 10일차 

#https://www.tidyverse.org/packages/

install.packages( "tidyverse")
library(tidyverse)  # library와 require 동일한 기능 

#tibble 은 dataframe 개선한 것 


dim(mpg)
str(mpg)
head(mpg)
View(mpg)

#함수를 기본적으로 2개 
#ggplot은  기본함수 / LAYER 방식 eg) ggplot 깔고 geom_histogram깔고 theme깔고 
#반드시 플러스 연산으로 함수 연결 必 
#그래프 함수는 다 geom으로 시작 
#ggplot 은 data frame 으로 실행 해야함
#그래프를 그릴 때에는 data와 mapping은 필수값 *
ggplot( data = mpg ) +
geom_point( mapping = aes( x = displ, y = hwy)) #산점도 그리는 함수 
                                                #mapping은 x y 지정 #mapping  은 생략가능 

month <- c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)

ggplot(df,aes(x = month, y = rain))+  #aes안에 x와 y 좌표 설정해주기 _ ggplot에 넣거나 그래프 함수 안에 넣거나 상관없음 
    geom_bar(stat = "identity", #막대높이 
             width = 0.7 ,      #막대폭
             fill = "steelblue")  # 그래프 채움 색 

##가로 그래프 
#ggtitle < 제목 설정
#labs  x,y축 이름 설정
#theme  ggtitle의 테마
#coord_flip()  그래프를 옆으로 눕혀라 

ggplot(df,aes( x = month, y = rain))+
    geom_bar(stat = "identity", 
             width = 0.7 ,      
             fill = "steelblue")+  
ggtitle("월별 강수량") +
theme(plot.title = element_text(size =25,
                                face = "bold",
                                colour = "steelblue")) +
labs( x= "월", y ="강수량") + coord_flip()
    
##ggplot 히스토그램 
#bindwidth은연속형에대하여  x단위를 어떤 단위로 카운트 할것인지 
ggplot(iris, aes( x = Petal.Length))+
    geom_histogram(binwidth = 0.5)  


#fill에다가 종류별로 색을 넣기 위해서 _  iris의 Species 는 범주형 
#color는 막대의 경계선의 색 
#position 품종별로 한그래프에 그릴지,각각 그릴지 _ dodge는 따로 그리는 명령
#legend.position은 범례의 위치 = ↓
#guides( fill = guide_legend( title = "실린더수" ) ) 

ggplot( iris, aes( x= Sepal.Width, fill = Species , 
                   color=Species )) +
    geom_histogram(binwidth = 0.5, position = "dodge") +
    theme( legend.position = "bottom")


##ggplot2 Scatter Chart _ 
#geom_point _산점도 

ggplot( data = iris, mapping = aes( x = Petal.Length, 
                                     y = Petal.Width ) ) +
    geom_point()

# mapping의 위치는 상관없다 _

ggplot( data = iris ) +
    geom_point( mapping = aes( x = Petal.Length, 
                                 y = Petal.Width ))

##산점도
# color를 aes안에 넣으면 색 지정 가능 

ggplot( data = iris, mapping = aes( x = Petal.Length, 
                                    y = Petal.Width,
                                    color = Species,
                                    shape = Species )) +
    geom_point(  
        size = 3) +
    ggtitle("꽃잎의 길이와 폭 ") +
    theme( plot.title = element_text(size = 25,
                                     face = "bold",
                                     colour = "green"))

##ggplot, Boxplot
#boxplot은y만 지정 , 가로폭은 의미없음 
#
ggplot( data = iris, mapping = aes(y= Petal.Length))+
    geom_boxplot(fill = "yellow")


#한그래프 안에 세개의 box plot 
#aes의 안에는 xy좌표나 그것들 성질 등등
ggplot( data = iris, mapping = aes(y= Petal.Length, fill = Species))+
    geom_boxplot()

##ggplot Line Chart
#선그래프_시간정보가 포함된 데이터에 자주사용됨

year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)

head(df)

ggplot(df,aes( x = year, y = cnt)) +
    geom_line(col = "red")

#ggplot 작성 graph 꾸미기
str(economics)

##사선
#intercept : y 절편 값
#slope :기울기 
#abline :사선을 그을 때 쓰는 함수 _회귀선 구하는 식이 따로 존재 
ggplot( economics, aes( x= date, y = psavert))+
    geom_line() + 
    geom_abline( intercept = 12.18671,
                 slope = -0.0005444)
##평행선_시계열 데이터에 많이 사용됨 
#hline은 가로 선_ 기준 치 
#평균 기준으로 가로선 
ggplot( economics, aes( x = date, y = psavert))+
    geom_line()+
    geom_hline(yintercept = mean( economics$psavert))

#vline 세로선_ 기준 날짜 
#psavert의 값이 최소가 되는 날짜 

x_inter <-  filter(economics,
                   psavert == min ( economics$psavert))$date
ggplot( economics, aes( x = date, y = psavert))+
    geom_line() +
    geom_vline( xintercept = x_inter)

##텍스트 추가
#geom-text _ aes : 맵핑 해주는 역할 , label : 출력할 값 ,vjust= 0 숫자 출력 위치  
#0은 우측상단, +1: 좌측하단 , -1:우측 멀리상단 
ggplot(airquality,aes ( x = Day, y = Temp))+
    geom_point()+
    geom_text ( aes ( label = Temp,
                      vjust = 0,
                      hjust = 0))

##영역 지정 및 화살표 표시
#annotate _ rect은 모양 , alpha는 투명도  0~1사이 1에 가까울수록 불투명 
ggplot( mtcars, aes( x= wt, y = mpg))+
    geom_point()+
    annotate("rect",
             xmin = 3, 
             xmax = 4,
             ymin = 12,
             ymax = 21,
             alpha = 0.5,
             fill = "skyblue") +
    
annotate("segment", x= 2.5 , xend = 3.7,        #화살표 표시 추가
         y = 10, yend = 17, color = "red",      #segment _ 화살표
         arrow = arrow() )  +                   #화살표 길이 _x,xend,y,yend
    annotate( "text", x = 2.5, y = 10, label = "point")     #텍스트 추가 



#https://ggplot2.tidyverse.org/reference/index.html
#document users guide reference  _사용 설명서
#document reference guide reference _ 명령/ 함수 설명서 

#ggplot usage guide _ https://r4ds.had.co.nz/data-visualisation.html
#트리맵 _ https://rpubs.com/brandonkopp/creating-a-treemap-in-r

##treemap
install.packages("treemap")
library(treemap)

data("GNI2014")
dim(GNI2014)
str(GNI2014)
head(GNI2014)
view(GNI2014)

treemap( GNI2014, index = c( 'continent', 'iso3'), #계층구조_ 대륙 밑에 국가별로 계층화해라 
vSize ='population',                               #타일크기_ 인구가 많으면 타일이 크게해라
vColor = 'GNI',                                    #타일색깔_ GNI에 따라 색을 결정 
type = 'value',                                    #타일컬러링방법_ vcolor에서 정한 데이터의 value를 통해 
bg.labels = 'yellow',                              #레이블배경색_ 글씨 배경색
title = "World's GNI")                             #제목

st <- data.frame(state.x77)
st <- data.frame(st,stname = rownames(st))


treemap( st,
         index = c( "stname" ),
         vSize = "Area",         
         vColor = "Income",
         type = "value",
         title= "미국 주별 수입")


##산점도에 Bubble 추가 ( BUBBLE CHART)
#보통 산점도에 사용함 
symbols(st$Illiteracy,st$Murder,        #원의 xy 좌표
       circles = st$Population,         #원의 반지름
       inches = 0.3,                    #원크기 조절값
       fg = "white",                    #원 테두리 색
       bg = " lightgray",               #원 바탕색
       lwd = 1.5,                       #원 테두리선 두께
       xlab = "rate of Illiteracy", 
       ylab = "crime( murder) rate",
       main = "Illteracy and Crime")             

text(st$Illiteracy,st$Murder,           #텍스트출력 xy좌표
     rownames( st ),                    #출력할 text
     cex = 0.6,                         #폰트크기
     col = "brown")       #폰트컬러

##R 그래프 갤러리 : https://www.r-graph-gallery.com/index.html
##heatmap , map , 3d , spider 자주 사용됨 
#bubble 연습 
#============================================
# Libraries
library(ggplot2)
library(dplyr)
library(plotly)
library(viridis)
library(hrbrthemes)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Interactive version
p <- data %>%
    mutate(gdpPercap=round(gdpPercap,0)) %>%
    mutate(pop=round(pop/1000000,2)) %>%
    mutate(lifeExp=round(lifeExp,1)) %>%
    
    # Reorder countries to having big bubbles on top
    arrange(desc(pop)) %>%
    mutate(country = factor(country, country)) %>%
    
    # prepare text for tooltip
    mutate(text = paste("Country: ", country, "\nPopulation (M): ", pop, "\nLife Expectancy: ", lifeExp, "\nGdp per capita: ", gdpPercap, sep="")) %>%
    
    # Classic ggplot
    ggplot( aes(x=gdpPercap, y=lifeExp, size = pop, color = continent, text=text)) +
    geom_point(alpha=0.7) +
    scale_size(range = c(1.4, 19), name="Population (M)") +
    scale_color_viridis(discrete=TRUE, guide=FALSE) +
    theme_ipsum() +
    theme(legend.position="none")

# turn ggplot interactive with plotly
pp <- ggplotly(p, tooltip="text")
pp

# save the widget
# library(htmlwidgets)
# saveWidget(pp, file=paste0( getwd(), "/HtmlWidget/ggplotlyBubblechart.html"))

#============================================
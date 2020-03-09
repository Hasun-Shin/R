#### 03-1 ####

#ctrl shif c : 주석 

rm(list=ls()) # 만들었던 객체들을 지워줌. 

v1 = c(1,3,5) # c = combine 결합시켜서 메모리상에 연속해서 위치시킨다 -> 벡터를 만들어서 return 하면 v1이 그 정보를 갖게 해라.
v1
v2 = c(0,2,4,6,7) # 경고는 뜨지만, broadcasting 이 일어남. 1x0,3x2, 5x4 다음에 1x6, 3x7 이 연산됨.
v1*v2
class(v1*v2)

v1 %*% v2 #v1 dot v2, 벡터의 내적, 행렬곱.
v1 %*% v1
sum(v1*v1)
sum(v1*v2)
rep(v1, 3)
seq(1,10,2)
1:5 * 2 -1


#values = 만든 객체들. 

## ---------------------------------------------------------------------- ##
a <- 1  # a에 1 할당
a       # a 출력

b <- 2
b

c <- 3 
c

d <- 3.5
d

f <- "I am a boy"

a+b

a+b+c

4/b

5*b


## -------------------------------------------------------------------- ##
var1 <- c(1, 2, 5, 7, 8)    # 숫자 다섯 개로 구성된 var1 생성
var1

comp <- c(1, "abc")
comp


var2 <- c(1:5)              # 1~5까지 연속값으로 var2 생성
var2
c(1:4,5)

var3 <- seq(1, 5)           # 1~5까지 연속값으로 var3 생성
var3

var4 <- seq(1, 10, by = 2)  # 1~10까지 2 간격 연속값으로 var4 생성
var4

var5 <- seq(1, 10, by = 3)  # 1~10까지 3 간격 연속값으로 var5 생성
var5

var1
var1+2

var1
var2
var1+var2

var5 <-c(5,6,5,6)
var1 + var5


n1 <- 1:20
cut(n1, 5) #5구간으로 나눠라. range 를 0.1% 늘려서 구간을 만든다. 총 20개. 
class(cut(n1, 5))

n1

#q :v1과 v2를 결합하여 아래와 같은 백터 q를 출력하라.
v1
v2

q <-c(v1,v2)

q  

sort(q)



#top3출력
q[c(8,7,3)]
q[order(q, decreasing = T)[1:3]]
q[order(q, decreasing = T)][1:3]

#벡터 q를 역순으로 바꾸기
q
q[seq(length(q),1, -1)]

#벡터 q 짝수만 출력
q %% 2 #나머지
q%/%2 # 몫 
q[q %% 2 ==0]
q %% 2 ==0


which(q %% 2 ==0) #인덱스 출력 boolean indexing
q[which(q %% 2 ==0)] #fancy indexing



set.seed(123)
sample(q, 10, replace = T) # 벡터 q에서 랜덤하게 중복을 허용하여 10개의 수를 추출하라.  

sample(q,4) #벡터 q에서 중복없이 4개의 수를 추출하라. 

rm(v1, v2)



(x = 1:6) # 괄호 : 1에서 6까지 할당하고 출력하라. 
(p = 1:6/sum(1:6)) 

(sum(1:6))

sum(p)
sample(x, 100, replace = T, p=p) # 1에서 6까지 하나 뽑고, 다시 넣고 다시 뽑음. 그걸 100번 반복. 
table(sample(x, 1000000, replace = T, p=p)) /1000000 #독립시행을 백만번 한 다음에 빈도수를 세고, 시행횟수만큼 나눠지면 근사 확률이 나옴. 

p


rm(list = ls(pattern = "var\\d")) #정규식 표현 . var 가진 변수들을 삭제한다. 


## -------------------------------------------------------------------- ##
str1 <- "a"

str1

str2 <- "text"
str2

str3 <- "Hello World!"
str3

str4 <- c("a", "b", "c")
str4

str5 <- c("Hello!", "World", "is", "good!")
str5

str1+2 #연산이 안 이뤄짐. 


str6 <- c("a",1)
mode(str6)

as.character(var1) # var의 숫자 인수들을 문자열로 바꾼다. 

grep('a',s1) #a 가 존재하는 단어 색인(인덱스) 출력하라. 
grep('a',str4)

s1 <- strsplit("I have a mail", ' ')
s1
class(s1) # list 임. 
s1[2] #존재하지 않음. 

s1 <- unlist(s1)
s1 # list 를 해체 했기 때문에 vector가 됨. 
s1[2] #"have" 가 두번째 인덱스에 있음. 
class(s1) # list 를 없애서 character 임. 


str5 #str5 에서 'o'가 존재하는 성분을 출력하라. 
grep('o', str5)
grepl('o',str5) # l : logical . bollean vertor 출력됨. 
str5[grep('o',str5)]


#### 03-2 ####

## -------------------------------------------------------------------- ##
# 변수 만들기
x <- c(1, 2, 3)
x

# 함수 적용하기
{mean(x)
max(x)
min(x)
median(x)
var(x)
sd(x)} #맨 마지막 값만 console 값에 나온다. 

x_mean <- mean(x)
x_mean

# R 에서 함수 만들기. 
avg <-function(v){
  len = length(v)
  sumv = sum(v)
  return (sumv/len)
}

avg(x)



str5
paste(str5, collapse = ",")  # 쉼표를 구분자로 str4의 단어들 하나로 합치기
paste(str5, collapse = " ")

str3
paste(str5, str3, sep = ",")

str5_paste <- paste(str5, collapse = " ")
str5_paste

example(paste) #도움말, 해당 메소드(paste)에 대한 예시. 

#### 03-3 ####

## -------------------------------------------------------------------- ##
install.packages("ggplot2")  # ggplot2 패키지 설치
library(ggplot2)             # ggplot2 패키지 로드

# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 그래프 출력
qplot(x, geom="histogram", bins=3)


## -------------------------------------------------------------------- ##
# data에 mpg, x축에 hwy 변수 지정하여 그래프 생성

mpg <- mpg
mpg
mpg[7:11] #열에 대한 색인 

qplot(data = mpg, x = hwy, bins=20) # bin을 준다. 히스토그램을 그린다. (20개 구간)
summary(mpg$hwy) # 각각의 컬럼에 접근 $표시 사용. python 에서는 mpg.hwy
class(mpg)
names(mpg)


# x축 cty
qplot(data = mpg, x = cty, bins=20)


# x축 drv, y축 hwy. drv: 전륜-f, 후륜-r
qplot(data = mpg, x = drv, y = hwy)


# x축 drv, y축 hwy, 선 그래프 형태
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot", colour = drv)

# qplot 함수 매뉴얼 출력
?qplot

example(qplot)



# cty와 hwy간 산점도를 그리고, hwy ~ cty 의 회귀선을 추가하라.
qplot(cty, hwy, data=mpg) +
  geom_smooth(method = "lm", se = T) #lm : linear model, se: standard error. smooth 는 대략 회귀선이라는 뜻. 


ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(size = 2) +
  geom_smooth(method="lm", se = F)

# aes 는 에스테틱. 그림을 그리기 위한 frame을/화면을 지정해준다. 

# cyl  별 cty화 hwy간 산점도를 그려라.
qplot(cty, hwy, data=mpg, facets = ~ cyl) # cyl 별로 그려라. cyl를 원인변수로 해서. cyl 입장에서 cty와 hwy에 대한 산점도를 그려라. 

mpg$cyl # cyl 에는 4,5,6,8 이 있음. 


#y ~ x1 + x2   =>  x1과 x2를 원인변수로 해서 y(결과)를 설명해라. 



# cyl 별 hwy에 대한 boxplot 을 그려라. 
qplot(factor(cyl), hwy, data = mpg, geom="boxplot")

# 제조사별 모델별 바차트를 작성해라. 
mpg$manufacturer
qplot(manufacturer, data =mpg, geom='bar') + coord_flip()
qplot(model, data =mpg, geom = 'bar') + coord_flip()


manuf_Mod = paste(mpg$manufacturer, mpg$model, sep ='_')
qplot(manuf_Mod, geom='bar') + coord_flip()




#quiz p77
scores = c(80,60,70,50,90)
means = mean(scores)
means

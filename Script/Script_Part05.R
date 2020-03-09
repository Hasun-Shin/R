## 5장. 데이터 분석 기초 
#### 05-1 데이터 파악하기 ####

## -------------------------------------------------------------------- ##
exam <- read.csv("Data/csv_exam.csv")

head(exam)      # 앞에서부터 6행까지 출력
head(exam, 10)  # 앞에서부터 10행까지 출력
exam[1:6,]

tail(exam)      # 뒤에서부터 6행까지 출력
tail(exam, 10)  # 뒤에서부터 10행까지 출력
exam[-10:-1,]
exam[-c(1:5),] # 1~5행 제외하고 출력 . 



View(exam)      # 데이터 뷰어 창에서 exam 데이터 확인
dim(exam)       # 행, 열 출력
(num_row <- dim(exam)[1])
str(exam)       # 데이터 속성 확인. 
exam$id
summary(exam)   # 요약 통계량 출력


## ------------------------------------- ##
# ggplo2의 mpg 데이터를 데이터 프레임 형태로 불러오기
ggplot2::mpg
mpg <- as.data.frame(ggplot2::mpg)
class(mpg)

head(mpg)     # Raw 데이터 앞부분 확인
tail(mpg)     # Raw 데이터 뒷부분 확인
View(mpg)     # Raw 데이터 뷰어 창에서 확인
dim(mpg)      # 행, 열 출력
str(mpg)      # 데이터 속성 확인
summary(mpg)  # 요약 통계량 출력


df2 <- as.data.frame(table(mpg$model)) #table 이 벡터이므로, as는 data.frame 프레임 형식으로 변환시키는 뜻. 
df2
names(df2) <- c("model", "freq")
head(df2)

#### 05-2 ####

## -------------------------------------------------------------------- ##
df_raw <- data.frame(var1 = c(1, 2, 1),
                     var2 = c(2, 3, 2))
df_raw

install.packages("dplyr")  # dplyr 설치
library(dplyr)             # dplyr 로드

df_new <- df_raw  # 복사본 생성
df_new            # 출력
# rename(df_name, new_v_name = old_v_name)
df_new <- rename(df_new, v2 = var2, v1 = var1)  # var2를 v2로 수정
df_new
names(df_new) <- c('v1' , 'v2')

# names 함수를 이용하는 또 다른 방법.
colnames(df_new)<-c("var1", "var2")


# p.112
mpg2 <- mpg
mpg2 <- rename(mpg, city = cty, highway = hwy)
mpg2



#### 05-3 파생변수 만들기 ####

## -------------------------------------------------------------------- ##
df <- data.frame(var1 = c(4, 3, 8),
                 var2 = c(2, 6, 1))
df

df$var_sum <- df$var1 + df$var2       # var_sum 파생변수 생성
df

df$var_mean <- (df$var1 + df$var2)/2  # var_mean 파생변수 생성
df


## -------------------------------------------------------------------- ##
str(mpg)
mpg$total <- (mpg$cty + mpg$hwy)/2  # 통합 연비 변수 생성
head(mpg)
mean(mpg$total)  # 통합 연비 변수 평균


## -------------------------------------------------------------------- ##
mpg

summary(mpg$total)  # 요약 통계량 산출
h<- hist(mpg$total)     # 히스토그램 생성 - 데이터가 있음.

library(ggplot2)  

qplot(total, data=mpg, bins=20)
str(h) #structure => equidist :등구간. 

#structure 의 count, mids 를 가지고 대략적인 평균값 내보기. 
h[['counts']]
sum(h$counts * h$mids)/sum(h$counts)
median(mpg$total)
mean(mpg$total)


## - df vs. List 변수접근 차이
mpg$total
h$counts
class(mpg[,"total"])
class(h[["counts"]])

head(mpg$total, 10)
rv <- mpg$total[1]
mpg$total[1] = rv
str(mpg)
h<-hist(mpg$total, nclass = 15)
str(h)
h$counts / 234 #빈도 비율. 각 빈도를 전체 데이터개수로 나눠줌. 

sum(h$counts / 234) #1이 나옴. 


sum(h$density) #왜 0.5가 나오지?

counts <-(hist(mpg$total, nclass = 15))$counts
colors <- terrain.colors(10)
hist(mpg$total, border=terrain.colors(10))
hist(mpg$total, border=rainbow(10))


# 20이상이면 pass, 그렇지 않으면 fail 부여
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
mpg[21, "total"]
mpg[21:30, c("total", "test")]

head(mpg, 20)     # 데이터 확인
mpg$test[1:5]

table(mpg$test)   # 연비 합격 빈도표 생성
prop.table(table(mpg$test))

library(ggplot2)  # ggplot2 로드
qplot(mpg$test)   # 연비 합격 빈도 막대 그래프 생성
qplot(mpg$total, bins=30) #histogram로 변환 방법 1. . 기본 검은색
hist(mpg$total, nclass = 30) # histogram으로 변환방법 2.  기본 흰색 


## -------------------------------------------------------------------- ##
# total을 기준으로 A, B, C 등급 부여
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B", "C"))

head(mpg, 20)     # 데이터 확인

table(mpg$grade)  # 등급 빈도표 생성
qplot(mpg$grade)  # 등급 빈도 막대 그래프 생성

table(mpg$test, mpg$grade)

# A, B, C, D 등급 부여
(mpg$grade2 <- ifelse(mpg$total >= 30, "A",
                      ifelse(mpg$total >= 20, "B",
                             ifelse(mpg$total >= 15, "C", "D"))))
table(mpg$grade2)

## -------------------------------------------------------------------- ##
# 1.데이터 준비, 패키지 준비
mpg <- as.data.frame(ggplot2::mpg)  # 데이터 불러오기
library(dplyr)                      # dplyr 로드
library(ggplot2)                    # ggplot2 로드

# 2.데이터 파악
head(mpg, 10)     # Raw 데이터 앞부분
tail(mpg)     # Raw 데이터 뒷부분
View(mpg)     # Raw 데이터 뷰어창에서 확인
dim(mpg)      # 차원
str(mpg)      # 속성
summary(mpg)  # 요약 통계량
mpg$total <- (mpg$cty + mpg$hwy)/2

# 3.변수명 수정
mpg <- rename(mpg, company = manufacturer)
mpg <- rename(mpg, manufacturer = company)
names(mpg[c(1,2)]) <- c("manufacturer", "models")
colnames(mpg)[1] <- "company"


# 4.파생변수 생성
mpg$total <- (mpg$cty + mpg$hwy)/2                   # 변수 조합
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")  # 조건문 활용

mpg #total과 test 컬럼이 생성되었다. 

# 5.빈도 확인
table(mpg$test)  # 빈도표 출력
prop.table(table(mpg$test))
qplot(mpg$test)  # 막대 그래프 생성

# 6. 데이터프레임 접근
exam[1:3]
exam[1]
exam$id
class(exam[1])


#quiz.p123

#데이터 특성 파악 
str(midwest)
summary(midwest)


#변수명 수정
df_midwest <- rename(midwest, total = poptotal, asian = popasian)
df_midwest

# 파생변수 및 histogram
df_midwest$rate <- (df_midwest$asian / df_midwest$total)*100 #가중 평균으로 계산. 
 

#midwest[1:5, c('perasian')
h<-hist(df_midwest$rate, nclass = 20)

qplot(total, rate, data=df_midwest)


avg <- sum(df_midwest$rate)/437
#sum(midwest$asian) / sum(midwest$total) * 100 원래 이게 정답.

avg3 <- sum(df_midwest$asian) / sum(df_midwest$total) * 100

avg2 <- mean(df_midwest$rate)

avg2
avg
avg3

df_midwest$grade <- ifelse(df_midwest$rate > avg3, "large", "samll")

df_midwest$grade


table(df_midwest$grade)  # 빈도표 출력
prop.table(table(df_midwest$grade))
qplot(df_midwest$grade)  # 막대 그래프 생성




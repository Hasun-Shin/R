#### 4장. data.frame #######
#### 04-2 데이터 프레임 이해 ####
rm(list=ls())
## ---------------------------------------------------------------------- ##

english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성

english

math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
math

# english, math로 데이터 프레임 생성해서 df_midterm에 할당
df_midterm <- data.frame(english, math)
df_midterm
df_midterm[2] # 열색인
df_midterm["math"]
df_midterm$math # df_midterm.math . vector 가 됨.
df_midterm[1:2] #열색인
df_midterm[,1:2] # [행,열]
## - 행, 열 구분없이 색인하면, 열을 가져온다.
## - 모든 것을 선택하는데, :를 사용해서는 안된다.
## - 연속색인에서 끝 첨자를 포함한다.

class <- c(1, 1, 2, 2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

df_midterm$class <- class
df_midterm["class"] <- class
class
df_midterm[4] <- class
df_midterm
names(df_midterm)[4] <- "class2" #4번째 컬럼 이름 지정. 
names(df_midterm)[3:4] <- c("class1", "class2") #3,4번째 컬럼 이름 지정. 
df_midterm

mean(df_midterm$english)  # df_midterm의 english로 평균 산출
mean(df_midterm$math)     # df_midterm의 math로 평균 산술

# python은 reduce 대상축(0), r은 직접 연산 대상(2)
df_midterm
apply(df_midterm[1:2], 2, mean) # margin : 축의 역할을 한다. 여기서는 2(열) . 참고로 1은 행이다.  

df_midterm[1:2]
summary(df_midterm[1:2])

rm(english, math, class)

df_midterm <- data.frame(english <- c(90, 80, 60, 70),
                         math <- c(50, 60, 100, 20),
                         class <- c(1, 1, 2, 2))
df_midterm

rm(df_midterm, english, math, class)

df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))

df_midterm

df<-df_midterm #원본을 손상시키지 않기 위해서. 
## - vector
df
df$math
df[,2] # 2열 에 대한 벡터
df[,'math'] # 벡터. 
## 1 column data.frame
df[2] #frame
df["math"] #frame
mean(df[,2]) #벡터이므로 연산이 됨. 
mean(df["math"]) #프레임이므로 연산이 안됨. 


## - 행 삽입하기.
df[5,] <- c(50, 60, 1)
df

head(df)
1:3 == c(1,2,3)

# - 순서와 이름에 의한 색인을 섞어 쓸 수 있다.

df
df[1:3, c('math', 'english')]
df[1:3, c(2,1)] # 행 : 1~3, 열 : 수학과 영어
df[1,]
df[2,3]
df[c(1,3,4),] #1행과 3행과 4행. 
df[c(1,3,4), c(1,3)]
df[c(1,3,4), c("english", "class")]



class(df[2])
str(df[,2])
a<-1
str(a)
dim(df)



##quiz
df_fruit <- data.frame(제품 = c("사과","딸기","수박"),
                         가격 = c(1800, 1500, 3000),
                         판매량 = c(24,38,13))

df_fruit
apply(df_fruit[1:2], 2, mean)
mean(df_fruit[,2])
mean(df_fruit[,3])


# Quiz 4-2:
fruits <- c("사과", "딸기", "수박")
price <- c(1800, 1500, 3000)
amount <- c(24, 38, 13)
df2 <- data.frame(fruits, price, amount)
df2

meaned <- apply(df2[2:3], 2, mean)
meaned
names(meaned) <- NULL

df3 <- data.frame(price, amount, row.names = fruits)
df3
apply(df3[1:2], 2, mean)


#### 04-3 ####
rm(list=ls())
getwd()
## -------------------------------------------------------------------- ##
install.packages("readxl")
library(readxl)

# 엑셀 파일을 불러와서 df_exam에 할당
df_exam <- read_excel("Data/excel_exam.xlsx")
df_exam <- readxl::read_excel("Data/excel_exam.xlsx")
df_exam   # 출력
as.data.frame(df_exam)


mean(df_exam$english)
mean(df_exam$science)
summary(df_exam$english)

## quiz: 
# 1. math와 science 만을 선택하는 4가지 방법을 작성
df_exam[,c(3,5)]
df_exam[,c('math','science')]
df_exam[c(3,5)]
df_exam[c('math','science')]


# 2. math, english, science의 점수 합을 값으로 갖는 sum이라는 열을 생성하라.
df_exam

sum = apply(df_exam[,3:5], 1, sum)
df_exam[6] <- sum

names(df_exam)[6]<- "sum"
df_exam

df_exam['sum'] =apply(df_exam[3:5],1,sum)


# 3. sum이라는 열의 값이 150이상 180 이하인 행만 선택하라.
df_exam[(df_exam$sum >=150 & df_exam$sum <=180),]



# 4. 각 반별로 science의 최고점과 최저점인 학생 id를 구하라.

df_exam[ (df_exam$science ==max(df_exam$science)),1]
df_exam[(df_exam$science ==min(df_exam$science)),1]

df_exam[(which.min(df_exam$science)),"id"]
df_exam[(which.max(df_exam$science)),1]

df_exam


## - quiz end


# ------- 컬럼명이 없는 파일을 읽으면:
df_exam_novar <- read_excel("Data/excel_exam_novar.xlsx")
df_exam_novar

df_exam_novar <- read_excel("Data/excel_exam_novar.xlsx", col_names = F)
df_exam_novar

# Q: 
# - df_exam_novar에 아래와 같은 컬럼명을 적용하라.
# - c("id", "class", "math", "eng", "sci")
names(df_exam_novar) <- c("id", "class", "math", "eng", "sci")
df_exam_novar


# 엑셀 파일의 세 번째 시트에 있는 데이터 불러오기
df_exam_sheet <- read_excel("Data/excel_exam_sheet.xlsx", sheet=3)
df_exam_sheet


## -------------------------------------------------------------------- ##
df_csv_exam <- read.csv("Data/csv_exam.csv")
class(df_csv_exam)

df_csv_exam <- read.csv("Data/csv_exam.csv", stringsAsFactors = F)


## -------------------------------------------------------------------- ##
df_midterm <- data.frame(english = c(90, 80, 60, 70),
                         math = c(50, 60, 100, 20),
                         class = c(1, 1, 2, 2))
df_midterm

write.csv(df_midterm, file = "Data/df_midterm.csv")


## -------------------------------------------------------------------- ##
save(df_midterm, file = "Data/df_midterm.rdata")

rm(df_midterm)

load("Data/df_midterm.rdata")

# 정리하면:
# - 알려진 파일 형식: read, write
# - rdata 형식: load, save


## -------------------------------------------------------------------- ##
# 1.변수 만들기, 데이터 프레임 만들기
english <- c(90, 80, 60, 70)  # 영어 점수 변수 생성
math <- c(50, 60, 100, 20)    # 수학 점수 변수 생성
data.frame(english, math)     # 데이터 프레임 생성

# 2. 외부 데이터 이용하기

# 엑셀 파일
library(readxl)                                 # readxl 패키지 로드
df_exam <- read_excel("Data/excel_exam.xlsx")        # 엑셀 파일 불러오기

# CSV 파일
df_csv_exam <- read.csv("Data/csv_exam.csv")         # CSV 파일 불러오기
write.csv(df_midterm, file = "df_midterm.csv")  # CSV 파일로 저장하기

# Rda 파일
load("Data/df_midterm.rda")                          # Rda 파일 불러오기
save(df_midterm, file = "df_midterm.rda")       # Rda 파일로 저장하기


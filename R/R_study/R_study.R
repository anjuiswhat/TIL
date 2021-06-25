print("Hello world!")

help()
help(print)
??print


x0 <- 10
x0

x1 <- c(10, 20, 30)
x1

x2 <- c(1:100)
x2

x3 <- seq(19,15)
x3

x4 <- seq(1, 10, by = 4)
x4

x5 <- c( "a", "b", "c")
x5


ex_vector1 <- c(-1,0,1)


# 벡터의 변수의 속성 확인
str(x2)
str(x5)
str(ex_vector1)

# 벡터의 길이 확인
length(x2)
length(x5)
length(ex_vector1)


# 저장되어 있는 변수들을 모두 출력
ls()

# 인수로 주어지는 오브젝트 삭제
rm()

# 현재 저장되어 있는 모든 변수를 삭제
# rm() 으로 일일히 삭제해도 되지만 한꺼번에 지우고 싶을땐
# rm() 과 ls()의 list 를 결합한다.
rm( list = ls() )


# 행렬 생성
# 행렬 데이터는 단일형 data set (한가지 데이터 type만 사용 가능)
matrix( 변수명, nrow = 행 개수, ncol = 열 개수 )

x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 3, ncol = 2)

# 행렬 생성 시, 배치순서 변경: 'byrow = T' 옵션 추가
x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow = 2, ncol = 3) # 1열의 모든행을 채우고 다음 열로...
matrix(x, nrow = 2, ncol = 3, byrow = T) # 1행의 모든 행을 채우고 다음 행으로...


# 배열 생성
# 단일형 data set (한가지 데이터 type만 사용 가능)
# 행렬을 n차원으로 확대한 구조 
array( 변수명, dim = c(행 개수, 열 개수, 차원 수) )

y <- c(1, 2, 3, 4, 5, 6)
array(y, dim = c(2, 2, 3))


# 리스트 생성
# 1차원의 다중형 data set  (여러가지 data type을 동시에 포함 가능)
list( data1, data2, data3, ...... )

z <- list(c(1,2,3), 'hello')
z
str(z) # 리스트 z 속성 확인


# 데이터 프레임 생성
# 다중형 data set (여러가지 data type을 동시에 포함 가능)
data.frame( 변수명1, 변수명2, ..., 변수명n )

# data.frame 구성하는 변수(컬럼) 생성
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울", "인천", "경기")


# 변수를 포함한 데이터 프레임 구조로 dataframe_ex 데이터 세트에 저장
dataframe_ex <- data.frame(ID, SEX, AGE, AREA)

# dataframe_ex 조회
dataframe_ex 

# 데이터프레임 속성 확인
str(dataframe_ex) 

# dataframe 으로 dataset 을 구성할 때는
# 각 변수에 들어있는 관측치의 개수가 동일해야만 dataframe() 함수를 적용할 수 있다.
# 예를 들어 위의 예제에서 다른 변수들은 data 개수가 10개인데 AGE 의 데이터가 8개라면 오류가 발생한다.

ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울", "인천", "경기")

data.frame(ID, SEX, AGE, AREA)

# 하지만 변수의 data 가 일부 부족한게 아니라 단 1개만 존재할 경우에는
# 변수들간의 data 의 개수가 맞지 않더라도
# 첫번째 data 1개가 다음 행들을 자동으로 채워서 dataframe 을 완성하게 된다.


ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울", "인천", "경기")

data.frame(ID, SEX, AGE, AREA)



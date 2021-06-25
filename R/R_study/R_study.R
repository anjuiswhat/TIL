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
# matrix( 변수명, nrow = 행 개수, ncol = 열 개수 )

x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 3, ncol = 2)

# 행렬 생성 시, 배치순서 변경: 'byrow = T' 옵션 추가
x <- c(1, 2, 3, 4, 5, 6)
matrix(x, nrow = 2, ncol = 3)
matrix(x, nrow = 2, ncol = 3, byrow = T)








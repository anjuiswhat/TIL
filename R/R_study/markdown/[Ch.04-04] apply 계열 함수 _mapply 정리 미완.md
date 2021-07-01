# [Ch.04-04] apply 계열 함수

R에는 벡터, 행렬 또는 데이터 프레임에 임의의 함수를 적용한 결과를 얻기 위한 apply 계열 함수가 있다.

이 함수들은 데이터 전체에 함수를 한 번에 적용하는 벡터 연산을 수행하므로 속도가 빠르다.



## apply( )

- apply( )는 행렬의 행 또는 열 방향으로 특정 함수를 적용하는 데 사용한다.

- 배열 또는 행렬에 함수를 MARGIN 방향으로 적용하여 결과를 벡터, 배열 또는 리스트로 반환한다.

- 반환 값은 함수가 반환한 벡터들의 길이가 1인 경우에는 벡터, 1보다 큰 벡터들을 반환한 경우 행렬, 서로 다른 길이의 벡터를 반환한 경우 리스트다.

```R
apply(
  X,       # 배열 또는 행렬
  MARGIN,  # 함수를 적용하는 방향. 1은 행 방향, 2는 열 방향
           # c(1, 2)는 행과 열 방향 모두를 의미
  FUN      # 적용할 함수
)

---- < example > ---------------------------------------------------------------

# 행렬의 각 행의 합, 각 열의 합 구하기

> d <- matrix(1:9, ncol=3)
> d
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

> apply(d, 1, sum)
[1] 12 15 18

> apply(d, 2, sum)
[1]  6 15 24


# iris 데이터의 Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 컬럼의 합 구하기

## 1) iris 데이터의 대략적인 구조 확인
> head(iris)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
> str(iris)
'data.frame':	150 obs. of  5 variables:
 $ Sepal.Length: num  5.1 4.9 4.7 4.6 5 5.4 4.6 5 4.4 4.9 ...
 $ Sepal.Width : num  3.5 3 3.2 3.1 3.6 3.9 3.4 3.4 2.9 3.1 ...
 $ Petal.Length: num  1.4 1.4 1.3 1.5 1.4 1.7 1.4 1.5 1.4 1.5 ...
 $ Petal.Width : num  0.2 0.2 0.2 0.2 0.2 0.4 0.3 0.2 0.2 0.1 ...
 $ Species     : Factor w/ 3 levels "setosa","versicolor",..: 1 1 1 1 1 1 1 1 1 1 ...

## 2) 1번째 컬럼부터 4번째 컬럼까지의 각 컬럼의 합 출력
> apply( iris[,1:4], 2, sum )
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
       876.5        458.6        563.7        179.9 
```



### rowSums( ), rowMeans( ), colSums( ), colMeans( )

행 또는 열의 합 또는 평균의 계산은 빈번히 사용되므로 rowSums( ), rowMeans( ), colSums( ), colMeans( ) 함수가 미리 정의되어 있다.

```R
# rowSums : 숫자 배열 또는 데이터 프레임에서 행의 합을 구한다.
rowSums(
  x,            # 배열 또는 숫자를 저장한 데이터 프레임
  na.rm=FALSE,  # NA를 제외할지 여부
)

# rowMeans : 숫자 배열 또는 데이터 프레임에서 행의 평균을 구한다.
rowSums(
  x,            # 배열 또는 숫자를 저장한 데이터 프레임
  na.rm=FALSE,  # NA를 제외할지 여부
)

# colSums : 숫자 배열 또는 데이터 프레임에서 열의 합을 구한다.
colSums(
  x,            # 배열 또는 숫자를 저장한 데이터 프레임
  na.rm=FALSE,  # NA를 제외할지 여부
)

# colMeans : 숫자 배열 또는 데이터 프레임에서 열의 평균을 구한다.
colSums(
  x,            # 배열 또는 숫자를 저장한 데이터 프레임
  na.rm=FALSE,  # NA를 제외할지 여부
)

---- < example > ---------------------------------------------------------------

> colSums(iris[, 1:4])
Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
       876.5        458.6         563.7        179.9

> colMeans(iris[, 1:4])
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    5.843333     3.057333     3.758000     1.199333 
```



## lapply( )

- lapply( )는 리스트를 반환하는 특징이 있는 apply 계열 함수다.

- 벡터, 리스트, 표현식, 데이터 프레임 등에 함수를 적용하고 그 결과를 리스트로 반환한다.

- 반환 값은 X와 같은 길이의 리스트다.

```R
lapply(
  X,    # 벡터, 리스트, 표현식 또는 데이터 프레임
  FUN,  # 적용할 함수
  ...   # 추가 인자. 이 인자들은 FUN(함수)에 전달된다.
)

---- < example > ---------------------------------------------------------------

# 벡터에 lapply() 적용
## c(1, 2, 3) 벡터가 있을 때, 각 숫자를 2배한 값을 lapply( )를 통해 구하기
> ( result <- lapply(1:3 , function (x) { x*2 }) )
[[1]]
[1] 2

[[2]]
[1] 4

[[3]]
[1] 6

> result[[1]]	# [[n]] (이때 n은 접근할 요소의 색인) 형태로 list에 접근
[1] 2


# 리스트에 lapply() 적용
## a에는 c(1, 2, 3), b에는 c(4, 5, 6)이 저장된 리스트에서 각 변수마다 평균을 출력
> (x <- list(a=1:3, b=4:6))
$a
[1] 1 2 3

$b
[1] 4 5 6

> lapply(x, mean)
$a
[1] 2

$b
[1] 5


# 데이터 프레임에 lapply() 적용
## iris 데이터의 숫자형 데이터들에 대한 평균 출력
> lapply(iris[,1:4], mean)
$Sepal.Length
[1] 5.843333

$Sepal.Width
[1] 3.057333

$Petal.Length
[1] 3.758

$Petal.Width
[1] 1.199333
```



### unlist( ) : 리스트 구조를 벡터로 변환

리스트보다는 벡터 또는 데이터 프레임이 사용하기에 직관적인 면이 있으므로 lapply( )의 결과를 벡터 또는 데이터 프레임으로 변환할 필요가 있다.

```R
unlist(
  x,                # R 객체. 보통 리스트 또는 벡터
  recursive=FALSE,  # x에 포함된 리스트 역시 재귀적으로 변환할지 여부
  use.names=TRUE    # 리스트 내 값의 이름을 보존할지 여부
)

---- < example > ---------------------------------------------------------------

> ( result <- lapply(1:3 , function (x) { x*2 }) )
[[1]]
[1] 2

[[2]]
[1] 4

[[3]]
[1] 6

> unlist(result)
[1] 2 4 6
```



### 데이터 프레임을 처리한 리스트 결과를 다시 데이터 프레임으로 변환하는 경우

#### unlist( ) → matrix( ) → as.data.frame( ) 단계로 변환

이 경우 아래와 같은 순서로 처리한다.

1. unlist( )를 통해 리스트를 벡터로 변환한다.
2. matrix( )를 사용해 벡터를 행렬로 변환한다.
3. as.data.frame( )을 사용해 행렬을 데이터 프레임으로 변환한다.
4. names( )를 사용해 리스트로부터 변수명을 얻어와 데이터 프레임의 각 컬럼에 이름을 부여한다.

```R
# iris 데이터의 각 컬럼에 대한 평균을 lapply( )로 구한 뒤, 이 결과를 다시 데이터 프레임으로 변환

> d <- as.data.frame( matrix( unlist( lapply(iris[, 1:4], mean) ), ncol=4, byrow=TRUE ) )

> names(d) <- names(iris[,1:4])

> d
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     5.843333    3.057333        3.758    1.199333
```



##### unlist( ) 사용 시 문제점

unlist( )를 사용하여 리스트를 벡터로 변환할 경우, 한 가지 문제가 있다.

unlist( )는 벡터를 반환하는데, 벡터에는 한 가지 데이터 타입만 저장할 수 있기 때문에 변환 과정에서 하나의 데이터 타입으로 데이터가 모두 형 변환된다.

```R
# unlist() 사용 시 문제점

> x <- list(data.frame(name="foo", value=1),
            data.frame(name="bar", value=2))
> x
[[1]]
  name value
1  foo     1

[[2]]
  name value
1  bar     2

> unlist(x)
 name value  name value 	# 리스트 -> 벡터 변환 과정에서 벡터의 성질로 인해
"foo"   "1" "bar"   "2" 	# 숫자 데이터가 전부 문자열로 바뀐다!!!!
```



#### do.call : 리스트로 주어진 인자에 함수를 적용하여 함수 호출 결과를 반환

위에서 살펴본 unlist( )의 문제를 피하기 위해 데이터 타입이 혼합된 경우에는 do.call( )을 사용해 변환할 수도 있다.

지금 살펴보는 예제의 경우에는 lapply( )가 반환한 리스트 내의 각 컬럼별 계산 결과가 들어 있다. 따라서 이를 새로운 데이터 프레임의 컬럼들로 합치기 위해 cbind( )를 사용한다. 다음 코드는 do.call( )을 사용해 lapply( )의 결과로 나온 리스트 내 요소 각각을 cbind( )의 인자들로 넘겨준다.

```R
do.call(
  what,  # 호출할 함수
  args,  # 함수에 전달할 인자의 리스트
)

---- < example > ---------------------------------------------------------------

> x <- list(data.frame(name="foo", value=1),
            data.frame(name="bar", value=2))

> do.call(rbind, x) 	# 리스트의 각 요소가 한 행에 해당하므로 rbind 사용
  name value
1  foo     1
2  bar     2


# iris 데이터의 각 컬럼에 대한 평균을 lapply( )로 구한 뒤, 이 결과를 다시 데이터 프레임으로 변환

## 1) do.call() 사용하여 컬럼들을 cbind 로 결합, matrix 생성 
> do.call( cbind, lapply(iris[, 1:4], mean) )
     Sepal.Length Sepal.Width Petal.Length Petal.Width
[1,]     5.843333    3.057333        3.758    1.199333
> x <- do.call( cbind, lapply(iris[, 1:4], mean) )
> is.matrix(x)
[1] TRUE

## 2) 데이터 프레임으로 변환
> data.frame( do.call( cbind, lapply(iris[, 1:4], mean) ) )
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     5.843333    3.057333        3.758    1.199333
```



##### do.call( ) 사용 시 문제점

do.call(rbind, …) 방식은 속도가 느리다는 단점이 있다. 따라서 대량의 데이터를 변환해야 한다면 ‘5장. 데이터 조작 II’에서 설명할 rbindlist( )를 사용해야 한다.



## sapply( )

- sapply( )는 행렬, 벡터 등의 데이터 타입으로 결과를 반환하는 특징이 있는 함수다.
- 벡터, 리스트, 표현식, 데이터 프레임 등에 함수를 적용하고 그 결과를 벡터 또는 행렬로 반환한다.
- 반환 값은 함수의 결과가 길이 1인 벡터들이면 벡터, 길이가 1보다 큰 벡터들이면 행렬이다.



### sapply( ) 사용 시 주의점

- sapply( )는 한 가지 타입만 저장 가능한 데이터 타입인 벡터 또는 행렬을 반환하므로, sapply( )에 인자로 준 함수의 반환 값에 여러 가지 데이터 타입이 섞여 있으면 안 된다.
- 만약 각 컬럼에 대해 수행한 함수의 결과 데이터 타입이 서로 다르다면, 리스트를 반환하는 lapply( )나 리스트 또는 데이터 프레임을 반환할 수 있는 plyr 패키지(5장에서 설명)를 사용해야 한다.

```R
sapply(
  X,    # 벡터, 리스트, 표현식 또는 데이터 프레임
  FUN,  # 적용할 함수
  ...,  # 추가 인자. 이 인자들은 FUN에 전달된다.
)

---- < example > ---------------------------------------------------------------

# sapply( )에 인자로 주어진 함수의 출력이 길이가 1인 벡터들인 경우

## iris 데이터에서 각 컬럼의 평균을 구하여 벡터로 반환
> ( x <- sapply(iris[, 1:4], mean) )
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
    5.843333     3.057333     3.758000     1.199333 

> class(x)	# claas 확인 결과, 숫자를 저장한 벡터
[1] "numeric"

## iris 데이터에서 각 컬럼의 데이터 타입을 구하여 벡터로 반환
> ( y <- sapply(iris, class) )
Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
   "numeric"    "numeric"    "numeric"    "numeric"     "factor" 

> class(y)
[1] "character"


# sapply( )에 인자로 주어진 함수의 출력이 길이가 1보다 큰 벡터들인 경우

## iris 의 숫자형 값들에 대해 각 값이 3보다 큰지 여부를 판단하여 행렬로 반환
> z <- sapply( iris[, 1:4], function(x) { x > 3 } )

> head(z)
     Sepal.Length Sepal.Width Petal.Length Petal.Width
[1,]         TRUE        TRUE        FALSE       FALSE
[2,]         TRUE       FALSE        FALSE       FALSE
[3,]         TRUE        TRUE        FALSE       FALSE
[4,]         TRUE        TRUE        FALSE       FALSE
[5,]         TRUE        TRUE        FALSE       FALSE
[6,]         TRUE        TRUE        FALSE       FALSE

> class(z)
[1] "matrix" "array" 
```



### sapply( )에서 반환된 벡터에 as.data.frame( ) 적용 시 주의점

t( ) 함수를 사용하여 벡터의 행과 열을 바꿔주는 과정이 필요하다

```R
> as.data.frame(x)
                    x
Sepal.Length 5.843333	# 단순하게 as.data.frame() 만 적용하면 
Sepal.Width  3.057333	# 생각했던 데이터 프레임이 나오지 않는다.
Petal.Length 3.758000
Petal.Width  1.199333

> as.data.frame(t(x))	# t() 함수를 사용하여 행과 열을 바꿔야 함.
  Sepal.Length Sepal.Width Petal.Length Petal.Width
1     5.843333    3.057333        3.758    1.199333
```





## tapply( )

- tapply( )는 그룹별로 함수를 적용하기 위한 apply 계열 함수다.
- 벡터 등에 저장된 데이터를 주어진 기준에 따라 그룹으로 묶은 뒤 각 그룹에 함수를 적용하고 그 결과를 반환한다.
- 반환 값은 배열이다.

```R
tapply(
  X,      # 벡터
  INDEX,  # 데이터를 그룹으로 묶을 색인.
          # 팩터를 지정해야 하며 팩터가 아닌 타입이 지정되면 팩터로 형 변환된다.
  FUN,    # 각 그룹마다 적용할 함수
  ...,    # 추가 인자. 이 인자들은 FUN에 전달된다.
)

---- < example > ---------------------------------------------------------------

# 1부터 10까지의 숫자가 있고 이들이 모두 한 그룹에 속해 있을 때, 이 그룹에 속한 데이터의 합을 출력
## rep(1, 10)은 1을 10회 반복하는 것을 의미
## 즉, 1부터 10까지의 숫자에 각각 1 이라는 동일한 인덱스를 부여한 후 총합 계산 
> tapply(1:10, rep(1, 10), sum)
 1 
55 

# 1부터 10까지의 숫자를 홀수별, 짝수별로 묶어서 합을 출력
# %%는 나머지를 구하는 연산자. 몫은 %/%로 구할 수 있다.
# 2로 나눈 나머지가 1 이면 TRUE 인덱스 부여, 아니라면 FALSE 인덱스 부여 
> tapply(1:10, 1:10 %% 2 == 1, sum)    
FALSE  TRUE 
   30    25 

# iris 데이터에서 Species별 Sepal.Length의 평균을 출력
> tapply(iris$Sepal.Length, iris$Species, mean)
    setosa versicolor  virginica 
     5.006      5.936      6.588 
```



### 같은 클러스터에 속한 데이터들의 평균 계산

```R
# 계절별 성별로 정리된 판매량 데이터를 가정
> m <- matrix(1:8,
              ncol=2,
              dimnames = list(c("spring", "summer", "fall", "winter"),
                              c("male", "female")))
> m
       male female
spring    1      5
summer    2      6
fall      3      7
winter    4      8

# 봄,여름을 1분기라고 하고 가을, 겨울을 2분기라고 할때, 분기별로 성별 합 출력하기

# 먼저 성별에 따른 분기별 클러스터링 실행
# male 컬럼의 행에 부여할 인덱스는 순서대로 (1,1), (1,1), (2,1), (2,1)
# female 컬럼의 행에 부여할 인덱스는 순서대로 (1,2), (1,2), (2,2), (2,2)

# INDEX를 실제로 지정할 때는 (n, m)에서 n을 먼저 나열한 뒤 m 값을 나열한다.
# 즉, 그룹 (n1, m1), (n2, m2)는 list(c(n1, n2), c(m1, m2))로 표현한다. 
> tapply(m, list(c(1,1,2,2,1,1,2,2),
                 c(1,1,1,1,2,2,2,2)), sum)
  1  2
1 3 11
2 7 15
```



## mapply( )

- mapply( )는 sapply( )와 유사하지만 다수의 인자를 함수에 넘긴다는 점에서 차이가 있다.
- 주요 사용 목적은 다수의 인자를 받는 함수가 있고 그 함수에 넘겨줄 인자들이 데이터로 저장되어 있을 때, 데이터에 저장된 값들을 인자로 하여 함수를 호출하는 것이다.
- 함수에 리스트 또는 벡터로 주어진 인자를 적용한 결과를 반환한다.


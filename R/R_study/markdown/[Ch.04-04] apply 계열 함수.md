# [Ch.04-04] apply 계열 함수

R에는 벡터, 행렬 또는 데이터 프레임에 임의의 함수를 적용한 결과를 얻기 위한 apply 계열 함수가 있다.

이 함수들은 데이터 전체에 함수를 한 번에 적용하는 벡터 연산을 수행하므로 속도가 빠르다.

# apply( )

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

> d <- matrix(1:9, ncol=3)
> d
     [,1] [,2] [,3]
[1,]    1    4    7
[2,]    2    5    8
[3,]    3    6    9

# 행렬의 각 행의 합
> apply(d, 1, sum)
[1] 12 15 18

# 행렬의 각 열의 합
> apply(d, 2, sum)
[1]  6 15 24


# iris 데이터의 Sepal.Length, Sepal.Width, Petal.Length, Petal.Width 컬럼의 합 구하기

## iris 데이터의 대략적인 구조 확인
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

## 1번째 컬럼부터 4번째 컬럼까지의 각 컬럼의 합 계산
> apply( iris[,1:4], 2, sum )
Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
       876.5        458.6        563.7        179.9 
```



## rowSums( ), rowMeans( ), colSums( ), colMeans( )

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

# colSums : 숫자 배열 또는 데이터 프레임에서 열의 평균을 구한다.
colSums(
  x,            # 배열 또는 숫자를 저장한 데이터 프레임
  na.rm=FALSE,  # NA를 제외할지 여부
)

---- < example > ---------------------------------------------------------------

> colSums(iris[, 1:4])
Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
       876.5        458.6         563.7        179.9
```

# lapply( )

- lapply( )는 리스트를 반환하는 특징이 있는 apply 계열 함수다.

- 벡터, 리스트, 표현식, 데이터 프레임 등에 함수를 적용하고 그 결과를 리스트로 반환한다.

- 반환 값은 X와 같은 길이의 리스트다.

```R
lapply(
  X,    # 벡터, 리스트, 표현식 또는 데이터 프레임
  FUN,  # 적용할 함수
  ...   # 추가 인자. 이 인자들은 FUN(함수)에 전달된다.
)
```



리스트보다는 벡터 또는 데이터 프레임이 사용하기에 직관적인 면이 있으므로 lapply( )의 결과를 벡터 또는 데이터 프레임으로 변환할 필요가 있다. 이 경우 다음과 같은 함수를 사용한다.

▼ **표 4-10** 리스트를 다른 데이터 타입으로 변환하는 함수

| unlist : 리스트 구조를 벡터로 변환한다.                      |
| ------------------------------------------------------------ |
| `unlist(  x,                # R 객체. 보통 리스트 또는 벡터  recursive=FALSE,  # x에 포함된 리스트 역시 재귀적으로 변환할지 여부  use.names=TRUE    # 리스트 내 값의 이름을 보존할지 여부 )`반환 값은 벡터다. |
| do.call : 함수를 리스트로 주어진 인자에 적용하여 결과를 반환한다. |
| `do.call(  what,  # 호출할 함수  args,  # 함수에 전달할 인자의 리스트 )`반환 값은 함수 호출 결과다. |





c(1, 2, 3) 벡터가 있을 때, 각 숫자를 2배한 값을 lapply( )를 통해 구해보자. 앞서 ‘2.5 리스트’ 절에서 살펴봤듯이, 리스트의 각 값은 형태로 접근한다는 점을 기억하기 바란다(이때 n은 접근할 요소의 색인이다).

```R
> (result <- lapply(1:3, function(x) { x*2 }))
1
[1] 2

2
[1] 4

3
[1] 6

> result1
[1] 2
```

위의 예처럼 lapply( )의 결과는 리스트다. 이 결과를 다시 벡터로 변환하고 싶다면 unlist( )를 사용한다.

```R
> unlist(result)
[1] 2 4 6
```



lapply( )는 인자로 리스트를 받을 수 있다. 다음은 a에는 c(1, 2, 3), b에는 c(4, 5, 6)이 저장된 리스트에서 각 변수마다 평균을 계산한 예다.

```R
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
```

데이터 프레임에도 곧바로 lapply( )를 적용할 수 있다. 아이리스 데이터의 숫자형 데이터들에 대한 평균을 구해보자.

```R
> lapply(iris[, 1:4], mean)
$Sepal.Length
[1] 5.843333

$Sepal.Width
[1] 3.057333

$Petal.Length
[1] 3.758

$Petal.Width
[1] 1.199333
```

앞서 설명했듯이 각 컬럼의 평균은 colMeans( )로도 계산할 수 있다.

```R
> colMeans(iris[, 1:4])
Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
    5.843333     3.057333      3.758000     1.199333
```







데이터 프레임을 처리한 결과를 리스트로 얻은 뒤 해당 리스트를 다시 데이터 프레임으로 변환할 필요가 있을 수 있다. 이 변환은 몇 단계를 거쳐서 처리해야 한다.

**1.** unlist( )를 통해 리스트를 벡터로 변환한다.

**2.** matrix( )를 사용해 벡터를 행렬로 변환한다.

**3.** as.data.frame( )[**3**](https://thebook.io/006723/ch04/04/02-02/#footnote-101232-3)을 사용해 행렬을 데이터 프레임으로 변환한다.

**4.** names( )를 사용해 리스트로부터 변수명을 얻어와 데이터 프레임의 각 컬럼에 이름을 부여한다.

다음은 아이리스 데이터의 각 컬럼에 대한 평균을 lapply( )로 구한 뒤 이 결과를 다시 데이터 프레임으로 변환한 예다.

```R
> d <- as.data.frame(matrix(unlist(lapply(iris[, 1:4], mean)),
+                           ncol=4, byrow=TRUE))
> names(d) <- names(iris[, 1:4])
> d
  Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
1     5.843333     3.057333         3.758     1.199333
```

또는 do.call( )을 사용해 변환할 수도 있다. 지금 살펴보는 예제의 경우에는 lapply( )가 반환한 리스트 내의 각 컬럼별 계산 결과가 들어 있다. 따라서 이를 새로운 데이터 프레임의 컬럼들로 합치기 위해 cbind( )를 사용한다. 다음 코드는 do.call( )을 사용해 lapply( )의 결과로 나온 리스트 내 요소 각각을 cbind( )의 인자들로 넘겨준다.

```R
> data.frame(do.call(cbind, lapply(iris[, 1:4], mean)))
  Sepal.Length  Sepal.Width  Petal.Length  Petal.Width
1     5.843333     3.057333         3.758     1.199333
```

앞에서 살펴본 두 가지 방법 중 unlist( )후 matrix( )를 거쳐 데이터 프레임으로 변환하는 방법에는 한 가지 문제가 있다. unlist( )는 벡터를 반환하는데, 벡터에는 한 가지 데이터 타입만 저장할 수 있기 때문에 변환 과정에서 하나의 데이터 타입으로 데이터가 모두 형 변환되어버리기 때문이다.

다음 예에서는 문자열과 숫자가 혼합된 경우 unlist( )가 문자열을 모두 엉뚱한 값으로 바꿔버리는 것을 볼 수 있다.

```R
> x <- list(data.frame(name="foo", value=1),
+           data.frame(name="bar", value=2))
> unlist(x)
 name value name value
    1     1    1     2
```

따라서 데이터 타입이 혼합된 경우에는 do.call( )을 사용해야 한다. 다음 예에서는 리스트의 각 요소가 한 행에 해당하므로 rbind를 호출했다.

```R
> x <- list(data.frame(name="foo", value=1),
+           data.frame(name="bar", value=2))
> do.call(rbind, x)
  name value
1  foo     1
2  bar     2
```

이것만으로 끝이라면 좋겠지만 아쉽게도 do.call(rbind, …) 방식은 속도가 느리다는 단점이 있다. 따라서 대량의 데이터를 변환해야 한다면 ‘5장. 데이터 조작 II’에서 설명할 rbindlist( )를 사용해야 한다.









# sapply( )







# tapply( )



# mapply( )


# [Ch.04-05] 데이터를 그룹으로 묶은 후 함수 호출하기

- 데이터 분석에서는 데이터 전체에 대해 함수를 호출하기보다는 데이터를 그룹별로 나눈 뒤 각 그룹별로 함수를 호출하는 일이 흔하다. 앞 절에서 설명한 tapply( ) 외에도 이런 목적에 특화된 패키지들이 있는데, doBy는 그중 잘 알려진 패키지다.
- doBy 패키지에는 summaryBy( ), orderBy( ), sampleBy( )와 같이 특정 값에 따라 데이터를 처리하는 유용한 함수들이 있다.



## `summary()`

- summary( )는 데이터에 대한 간략한 통계 요약을 보기 위해 사용하는 일반 함수Generic Function다.
- 일반 함수는 주어진 인자에 따라 다른 동작을 수행하는 함수로, summary( )의 경우에는 데이터가 인자로 주어지면 간략한 통계 요약을 내놓고, 모델이 인자로 주어지면 모델에 대한 요약을 보여주는 방식으로 동작한다.
- 반환 값은 요약 결과며, 데이터 타입은 object 타입에 따라 다르다.
- Sepal.Length 등과 같은 수치형 데이터에 대해서는 최솟값Min, 1사분위수(1st Qu), 중앙값(Median), 평균(Mean), 3사분위수(3rd Qu), 최댓값(Max)을 보여준다.
- Species와 같은 팩터에 대해서는 각 수준(level)마다 몇 개의 값이 있는지를 보여준다.

```R
summary(
  object  # 요약할 객체
)

-------------------- < example > ------------------------------

> summary(iris)
  Sepal.Length    Sepal.Width     Petal.Length    Petal.Width          Species  
 Min.   :4.300   Min.   :2.000   Min.   :1.000   Min.   :0.100   setosa    :50  
 1st Qu.:5.100   1st Qu.:2.800   1st Qu.:1.600   1st Qu.:0.300   versicolor:50  
 Median :5.800   Median :3.000   Median :4.350   Median :1.300   virginica :50  
 Mean   :5.843   Mean   :3.057   Mean   :3.758   Mean   :1.199                  
 3rd Qu.:6.400   3rd Qu.:3.300   3rd Qu.:5.100   3rd Qu.:1.800                  
 Max.   :7.900   Max.   :4.400   Max.   :6.900   Max.   :2.500  
```

------

#### *< Note >*

- 수치형 데이터의 분포는 `quantile( )`을 통해서도 알아볼 수 있다.
- `quantile( )`는 데이터를 크기 순서대로 나열했을 때 0, 25, 50, 75, 100%에 해당하는 값과 0, 10, 20, 30, ..., 100%에서의 값을 보여준다.

```R
  > quantile(iris$Sepal.Length)
    0%  25%  50%  75%  100%
   4.3  5.1  5.8  6.4   7.9

  > quantile(iris$Sepal.Length, seq(0, 1, by=0.1))
    0%  10%  20%  30%  40%  50%  60%  70%  80%  90%  100%
  4.30 4.80 5.00 5.27 5.60 5.80 6.10 6.30 6.52 6.90  7.90
```

------



## doBy 패키지 설치 및 로드

```R
> install.packages("doBy")  # doBy 패키지를 설치함
> library(doBy)             # doBy 패키지를 불러들여 사용할 준비를 함
```



## `doBy::summaryBy()`

※  '`::`' 은 네임스페이스(이름 공간; Namespace)를 표현하는 데 사용한다.

※  즉, `doBy::summaryBy()`는 doBy 패키지의 `summaryBy()`를 지칭한다.

- summaryBy( )는 그룹별로 그룹을 특징짓는 통계적 요약 값을 계산하는 함수다. 
- doBy 패키지의 summaryBy( )는 이름에서 짐작할 수 있듯이 원하는 컬럼의 값을 특정 조건에 따라 요약하는 목적으로 사용한다.
- 반환 값은 데이터 프레임이다.
- 예를 들어, Sepal.Length와 Sepal.Width를 Species에 따라 살펴보려면 다음과 같이 하면 된다.
- 아래 코드에서 ‘`Sepal.Length + Sepal.Length ~ Species`’ 부분은 수식(Formula)이라고 하는데, 처리할 데이터를 일종의 수학 공식처럼 표현하는 방법이다.

```R
doBy::summaryBy(
  var1 + var2 ~ factor,  # 요약을 수행할 포뮬러
  data = parent.frame()  # 포뮬러를 적용할 데이터
)

-------------------- < example > ------------------------------




> summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)
     Species Sepal.Width.mean Sepal.Length.mean
1     setosa            3.428             5.006
2 versicolor            2.770             5.936
3  virginica            2.974             6.588
```



### *< Note >* 포뮬러 해석



#### X1 + X2 ~ Y

- Y를 X1, X2로 모델링.
- 상수항은 암시적으로 허용된다.
- 따라서 선형 회귀에 이 포뮬러를 사용하면 '`Y = a*X1 + b*X2 + c`' 를 의미한다.



#### X1 - X2 ~ Y

- Y를 X1로 모델링하되 X2는 제외한다.
- 특히 선형 회귀에서 ' Y ~ X1 + X2 - 1 ' 은 Y를 X1과 X2로 모델링하되 상수항은 제외한다는 의미로 Y = a * X1 + b * X2를 의미한다.



#### X1 | X2 ~ Y

- X2의 값에 따라 데이터를 그룹으로 묶은 후 각 그룹별로 Y ~ X1을 적용한다.



#### X1 : X2 ~ Y

- Y를 X1과 X2의 상호 작용(interaction)에 따라 모델링한다.
- 상호 작용은 Y = a * X1 * X2 + b와 같이 X1과 X2가 동시에 Y 값에 영향을 주는 상황을 말한다.
- 특히 영향을 주는 방식이 Y = a * X1 + b * X2 + c 와 같은 합의 형태와는 구분된다.



#### X1 * X2 ~ Y

- X1 + X2 + X1:X2 ~ Y 의 축약형 표현이다.


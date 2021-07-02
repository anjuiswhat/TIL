# [Ch.04-05] 데이터를 그룹으로 묶은 후 함수 호출하기

- 데이터 분석에서는 데이터 전체에 대해 함수를 호출하기보다는 데이터를 그룹별로 나눈 뒤 각 그룹별로 함수를 호출하는 일이 흔하다. 앞 절에서 설명한 tapply( ) 외에도 이런 목적에 특화된 패키지들이 있는데, doBy는 그중 잘 알려진 패키지다.
- doBy 패키지에는 summaryBy( ), orderBy( ), sampleBy( )와 같이 특정 값에 따라 데이터를 처리하는 유용한 함수들이 있다.



## 기본 패키지

### `summary()`

- `summary()`는 데이터에 대한 간략한 통계 요약을 보기 위해 사용하는 일반 함수Generic Function다.
- 일반 함수는 주어진 인자에 따라 다른 동작을 수행하는 함수로, `summary()`의 경우에는 데이터가 인자로 주어지면 간략한 통계 요약을 내놓고, 모델이 인자로 주어지면 모델에 대한 요약을 보여주는 방식으로 동작한다.
- 반환 값은 요약 결과며, 데이터 타입은 object 타입에 따라 다르다.
- Sepal.Length 등과 같은 수치형 데이터에 대해서는 최솟값(Min), 1사분위수(1st Qu), 중앙값(Median), 평균(Mean), 3사분위수(3rd Qu), 최댓값(Max)을 보여준다.
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



### `order()`

- 데이터를 정렬하기 위한 순서를 반환한다.
- 반환 값은 원 데이터에 지정하면 정렬된 결과가 나오도록 하는 색인이다.

```R
order(
  ...,  # 정렬할 데이터
  na.last=TRUE,   # na.last는 NA 값을 정렬한 결과의 어디에 둘 것인지를 제어한다.
                    # 기본값인 na.last=TRUE는 NA 값을 정렬한 결과의 마지막에 둔다.
                    # na.last=FALSE는 정렬한 값의 처음에 둔다.
                    # na.last=NA는 NA 값을 정렬 결과에서 제외한다.
  decreasing=FALSE  # 내림차순 여부
)

-------------------- < example > ------------------------------

# 아이리스 데이터를 Sepal.Width에 따라 정렬

> order(iris$Sepal.Width)
  [1]  61  63  69 120  42  54  88  94  58  81  82  70  73  90  99 107 109 114 147  80  91
 [22]  93 119 135  60  68  83  84  95 102 112 124 143  55  56  72  74  77 100 115 122 123
 [43] 127 129 131 133 134   9  59  64  65  75  79  97  98 104 108   2  13  14  26  39  46
 [64]  62  67  76  78  85  89  92  96 103 105 106 113 117 128 130 136 139 146 148 150   4
 [85]  10  31  35  53  66  87 138 140 141 142   3  30  36  43  48  51  52  71 111 116 121
[106] 126 144  24  50  57 101 125 145   7   8  12  21  25  27  29  32  40  86 137 149   1
[127]  18  28  37  41  44   5  23  38 110  11  22  49  19  20  45  47 118 132   6  17  15
[148]  33  34  16


# iris 데이터프레임을 Sepal.Width 순으로 정렬하여 출력 
# Sepal.Width 정렬 순서를 iris 데이터 프레임의 각 행에 대한 색인으로 사용

> iris[order(iris$Sepal.Width),]
   Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
61          5.0         2.0          3.5         1.0 versicolor
63          6.0         2.2          4.0         1.0 versicolor
69           6.2         2.2          4.5         1.5 versicolor
120          6.0         2.2          5.0         1.5  virginica
42           4.5         2.3          1.3         0.3     setosa
...


# Sepal.Length, Sepal.Width 순으로 데이터를 정렬
# 데이터가 먼저 Sepal.Length 순으로 정렬되고 그 안에서 다시 Sepal.Width로 정렬된다.
# 여러 컬럼을 기준으로 데이터를 정렬하고자 한다면 해당 컬럼들을 order( )에 나열한다.

> iris[order(iris$Sepal.Length, iris$Sepal.Width), ]
   Sepal.Length Sepal.Width Petal.Length Petal.Width  Species
14          4.3         3.0          1.1         0.1   setosa
9           4.4         2.9          1.4         0.2   setosa
39          4.4         3.0          1.3         0.2   setosa
43          4.4         3.2          1.3         0.2   setosa
42          4.5         2.3          1.3         0.3   setosa
...
```



### `sample()`

- 샘플링을 수행한다.
- 데이터를 무작위로 섞는 데 사용할 수도 있다.
- `sample()`은 주어진 데이터에서 임의로 샘플(표본)을 추출하는 목적으로 사용된다.
- 복원 추출 여부는 replace로 지정하며, 기본값은 비복원 추출(`replace = FALSE`)이다.
- 반환 값은 샘플을 저장한 길이 size인 벡터다.

```R
sample(
  x,    # 샘플을 뽑을 데이터 벡터. 만약 길이 1인 숫자 n이 지정되면 1:n에서 샘플이 선택된다.
  size,    # 샘플의 크기
  replace=FALSE,    # 복원 추출 여부, 기본값은 FALSE
  prob    # 데이터가 뽑힐 가중치
          # 예를 들어, x=c(1, 2, 3)에서 2개의 샘플을 뽑되
          # 각 샘플이 뽑힐 확률을 50%, 20%, 30%로 하고자 한다면 size=2, prob=c(5, 2, 3)을 지정한다. 
          # prob에 지정한 값의 합이 1일 필요는 없다.
)

-------------------- < example > ------------------------------

# 1에서 10까지의 숫자 중 5개를 샘플링

> sample(1:10, 5)
[1] 10 3 8 2 6

> sample(1:10, 5, replace=TRUE)    # replace = TRUE 옵션으로 인해 복원추출 시행
[1] 8 1 6 6 10                     # 복원추출로 인해 6이 2회 추출


# iris 데이터 프레임의 행을 무작위 순서로 출력
## NROW(iris) 는 iris 데이터프레임 행의 수로 150 이므로
## sample(NROW(iris), NROW(iris)) 는 1부터 150까지의 숫자를 150번 무작위 비복원 추출한 것이며,
## 아래 코드는 iris[ridx, cidx] 에서 ridx 만 지정했으므로 150개의 행을 무작위 순서로 출력한다. 

> iris[ sample( NROW(iris), NROW(iris) ), ]
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
146          6.7         3.0          5.2         2.3  virginica
11           5.4         3.7          1.5         0.2     setosa
46           4.8         3.0          1.4         0.3     setosa
125          6.7         3.3          5.7         2.1  virginica
77           6.8         2.8          4.8         1.4 versicolor
...
```





## `doBy` 패키지

```R
> install.packages("doBy")  # doBy 패키지를 설치함
> library(doBy)             # doBy 패키지를 불러들여 사용할 준비를 함
```



### `summaryBy()`

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
  data=parent.frame()  # 포뮬러를 적용할 데이터
)

-------------------- < example > ------------------------------

# Sepal.Width와 Sepal.Length를 Species별로 요약

> summaryBy(Sepal.Width + Sepal.Length ~ Species, iris)
     Species Sepal.Width.mean Sepal.Length.mean
1     setosa            3.428             5.006
2 versicolor            2.770             5.936
3  virginica            2.974             6.588
```



#### *< Note >* 포뮬러 해석



##### X1 + X2 ~ Y

- Y를 X1, X2로 모델링.
- 상수항은 암시적으로 허용된다.
- 따라서 선형 회귀에 이 포뮬러를 사용하면 '`Y = a*X1 + b*X2 + c`' 를 의미한다.



##### X1 - X2 ~ Y

- Y를 X1로 모델링하되 X2는 제외한다.
- 특히 선형 회귀에서 'X1 + X2 - 1 ~ Y' 는 Y를 X1과 X2로 모델링하되 상수항은 제외한다는 의미로 '`Y = a*X1 + b*X2`'를 의미한다.



##### X1 | X2 ~ Y

- X2의 값에 따라 데이터를 그룹으로 묶은 후 각 그룹별로 X1 ~ Y 을 적용한다.



##### X1 : X2 ~ Y

- Y를 X1과 X2의 상호 작용(interaction)에 따라 모델링한다.
- 상호 작용은 '`Y = a*X1*X2 + b`'와 같이 X1과 X2가 동시에 Y 값에 영향을 주는 상황을 말한다.
- 특히 영향을 주는 방식이 '`Y = a*X1 + b*X2 + c`' 와 같은 합의 형태와는 구분된다.



##### X1 * X2 ~ Y

- X1 + X2 + X1:X2 ~ Y 의 축약형 표현이다.



### `orderBy()`

- `orderBy()`는 수식에 따라 데이터 프레임을 정렬한다.
- `orderBy()`는 `order()`와 유사하지만 정렬할 데이터를 포뮬러로 지정할 수 있다는 점이 편리하다.
- `order()`가 `orderBy()`보다 번거로워 보이지만 기본 패키지 함수기 때문에 자주 사용한다.
- `orderBy()`에서 ~의 좌측은 무시하므로 적지 않는다.
- 다른 함수들과 다르게 데이터를 그룹으로 묶는 기능은 없다.
- 반환 값은 `order()`와 동일하다.

```R
doBy::orderBy(
  formula,  # 정렬할 기준을 지정한 포뮬러
            # ~의 좌측은 무시하며, ~ 우측에 나열한 이름에 따라 데이터가 정렬된다.
  data,     # 정렬할 데이터
)

-------------------- < example > ------------------------------

# 모든 데이터를 Sepal.Width로 배열

> orderBy(~ Sepal.Width, iris)
   Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
61          5.0         2.0          3.5         1.0 versicolor
63          6.0         2.2          4.0         1.0 versicolor
69          6.2         2.2          4.5         1.5 versicolor
120         6.0         2.2          5.0         1.5 virginica
42          4.5         2.3          1.3         0.3    setosa
...


# 모든 데이터를 Species, Sepal.Width 순으로 정렬
# 데이터가 먼저 Species 순으로 정렬되고 그 안에서 다시 Sepal.Width로 정렬된다.

> orderBy(~ Species + Sepal.Width, iris)
    Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
42           4.5         2.3          1.3         0.3     setosa
9            4.4         2.9          1.4         0.2     setosa
...
34           5.5         4.2          1.4         0.2     setosa
16           5.7         4.4          1.5         0.4     setosa
61           5.0         2.0          3.5         1.0 versicolor
63           6.0         2.2          4.0         1.0 versicolor
...
57           6.3         3.3          4.7         1.6 versicolor
86           6.0         3.4          4.5         1.6 versicolor
120          6.0         2.2          5.0         1.5  virginica
107          4.9         2.5          4.5         1.7  virginica
...
118          7.7         3.8          6.7         2.2  virginica
132          7.9         3.8          6.4         2.0  virginica
```



### `sampleBy()`

- sampleBy( )는 데이터를 그룹으로 묶은 후 각 그룹에서 샘플을 추출하는 함수다.
- 수식에 따라 데이터를 그룹으로 묶은 후 샘플을 추출한다.
- 반환 값은 데이터 프레임이다.

```R
doBy::sampleBy(
  formula,              # ~ 우측에 나열한 이름에 따라 데이터가 그룹으로 묶인다.
  frac=0.1,             # 추출할 샘플의 비율이며 기본값은 10%
  replace=FALSE,        # 복원 추출 여부
  data=parent.frame(),  # 데이터를 추출할 데이터 프레임
  systematic=FALSE      # 계통 추출(Systematic Sampling)을 사용할지 여부, 기본값은 FALSE
)


# iris 데이터에서 각 Species별로 10%의 데이터를 추출
# sampleBy( )에서 Species를 지정했으므로 각 종별로 5개씩 데이터가 정확히 샘플로 추출된다.

> sampleBy(~ Species, frac=0.1, data=iris)
              Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
setosa.1               5.1         3.5          1.4         0.2     setosa
setosa.23              4.6         3.6          1.0         0.2     setosa
setosa.45              5.1         3.8          1.9         0.4     setosa
setosa.47              5.1         3.8          1.6         0.2     setosa
setosa.50              5.0         3.3          1.4         0.2     setosa
versicolor.63          6.0         2.2          4.0         1.0 versicolor
versicolor.64          6.1         2.9          4.7         1.4 versicolor
versicolor.83          5.8         2.7          3.9         1.2 versicolor
versicolor.84          6.0         2.7          5.1         1.6 versicolor
versicolor.95          5.6         2.7          4.2         1.3 versicolor
virginica.108          7.3         2.9          6.3         1.8  virginica
virginica.112          6.4         2.7          5.3         1.9  virginica
virginica.122          5.6         2.8          4.9         2.0  virginica
virginica.125          6.7         3.3          5.7         2.1  virginica
virginica.131          7.4         2.8          6.1         1.9  virginica
```

- 샘플링은 주어진 데이터를 훈련 데이터(Training Data)와 테스트 데이터(Test Data)로 분리하는 데 유용하게 사용할 수 있다. 훈련 데이터로부터 모델을 만든 뒤 테스트 데이터에 모델을 적용하면 모델의 정확성을 평가할 수 있다.
- 모델의 정확성을 잘 평가하려면 데이터에서 예측 대상이 되는 값별로 샘플을 균일하게 뽑을 필요가 있다. 예를 들어, 아이리스의 Sepal.Width, Sepal.Length, Petal.Width, Petal.Length로부터 Species를 예측하는 모델을 만드는 경우를 생각해보자. 만약 훈련 데이터에는 setosa만 들어 있고 테스트 데이터에는 vericolor와 virginica만 들어 있다면 제대로 된 모델링과 모델의 평가가 이루어질 수 없다. 평가를 올바르게 하려면 훈련 데이터와 테스트 데이터에 Species 값별로 데이터의 수가 균일한 것이 좋다. 바로 이런 경우에 sampleBy( )가 유용하다.
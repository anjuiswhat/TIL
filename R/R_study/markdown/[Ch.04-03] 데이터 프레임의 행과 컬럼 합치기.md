# [Ch.04-03] 데이터 프레임의 행과 컬럼 합치기

- rbind( )와 cbind( )는 각각 행 또는 컬럼 형태로 주어진 벡터, 행렬, 데이터 프레임을 합쳐서 결과로 행렬 또는 데이터 프레임을 만드는 데 사용한다.
- 이들 함수는 분리되어 저장된 데이터를 합치는 데 유용하게 사용할 수 있다.



## rbind( )

rbind( )는 주어진 인자를 행으로 취급하여 데이터를 합친다.

```R
# rbind( )를 사용한 두 벡터의 병합
> rbind( c(1, 2, 3), c(4, 5, 6) )
     [,1] [,2] [,3]
[1,]    1    2    3
[2,]    4    5    6

# rbind( )를 사용한 데이터 프레임 병합
> ( x <- data.frame(id=c(1, 2),
                    name=c("a", "b"),
                    stringsAsFactors=T) )    # name 컬럼의 데이터를 팩터로 취급하기 위한 옵션
                                             # 옵션을 생략하거나 FALSE 로 지정하면 문자열로 취급
  id name
1  1    a
2  2    b

> str(x)
'data.frame':	2 obs. of  2 variables:
 $ id  : num  1 2
 $ name: Factor w/ 2 levels "a","b": 1 2

# 데이터 프레임 x와 새로운 값을 저장한 벡터를 rbind() 로 병합
> ( x <- data.frame(id=c(1, 2),
                    name=c("a", "b")) )
  id name
1  1    a
2  2    b

> rbind(x, c(3, "c"))
  id name
1  1    a
2  2    b
3  3    c
```



## cbind( )

- cbind( )는 주어진 인자를 컬럼으로 취급하여 데이터를 합친다.
- 데이터 프레임에 새로운 컬럼을 추가할 때는 cbind( )를 사용하지 않고 df$colname <- data 형태로도 추가할 수 있다. 이 내용은 앞서 데이터 프레임 타입에 대해서 살펴본 ‘2.8 데이터 프레임’ 절을 참고하기 바란다.

```R
# cbind( )를 사용한 두 벡터의 병합
> cbind( c(1, 2, 3), c(4, 5, 6) )
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

# cbind( )를 사용하여 데이터 프레임에 새로운 컬럼 추가
> ( x <- data.frame(id=c(1, 2),
                    name=c("a", "b")) )
  id name
1  1    a
2  2    b

> ( y <- cbind(x, greek=c("alpha", "beta")) )
  id name greek
1  1    a alpha
2  2    b  beta

> str(y)
'data.frame':	2 obs. of  3 variables:
 $ id   : num  1 2
 $ name : chr  "a" "b"
 $ greek: chr  "alpha" "beta"

> y <- cbind(x, greek=c("alpha", "beta"),
             stringsAsFactors=T)    # stringsAsFactors를 TRUE 로 지정.
                                    # 새로 추가된 greek 컬럼이 범주형 데이터인 팩터가 된다.

> str(y)
'data.frame':	2 obs. of  3 variables:
 $ id   : num  1 2
 $ name : chr  "a" "b"
 $ greek: Factor w/ 2 levels "alpha","beta": 1 2
```
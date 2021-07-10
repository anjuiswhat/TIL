# PART 1 |  Pandas 기본

## 1. Pandas 자료구조

### 1-1. Series

### 1-2. DataFrame

#### DataFrame 생성

```python
# Dictionary → DataFrame
pd.DataFrame( 딕셔너리 객체 )

# Array → DataFrame
pd.DataFrame( 2차원 배열,
              index = 행 인덱스 배열
              columns = 열 인덱스 배열 )
```

#### 행 인덱스 / 열 이름 변경 :  `rename()`, `.index`, `.columns`

```python
# 행 인덱스 변경 ( .index / rename() )
df객체.index
df객체.rename( index = { 기존 인덱스 : 새 인덱스, ...} )

# 열 이름 변경 ( .columns / rename() )
df객체.columns
df객체.rename( columns = { 기존 이름 : 새 이름, ...} )
```

#### 행/열 삭제 :  `.drop()`

```python
df객체.drop( 행 인덱스/배열 또는 열 이름/배열
                    axis = 0,           # 행 옵션은 axis = 0 / 열 옵션은 axis = 1
                    inplace = False )   # 기본값은 False 로 원본 객체는 변경없이 새로운 객체를 반환
                                        # 원본 객체를 직접 변경하려면 inplace = True 로 설정
```

#### 행 선택 :  `.loc[]`, `.iloc[]`

```python
# .loc[] : 인덱스 이름을 기준으로 선택, 범위 지정 가능
df객체.loc[ '인덱스 이름' ]

# .iloc[] : 정수형 위치 인덱스를 기준으로 선택, 범위 지정 가능
df객체.iloc[ '정수형 위치 인덱스' ]
```

#### 열 선택

```python
# 열 1개 선택 ( Series 생성 )
df객체[ '열 이름' ]
df객체.열_이름

# .iloc[] : 정수형 위치 인덱스를 기준으로 선택, 범위 지정 가능
df객체.iloc[ '정수형 위치 인덱스' ]
```





## 2. 인덱스 활용

## 3.산술연산



# PART 2 |  데이터 입출력

## 1. 외부 파일 읽어오기

## 2. 웹(web)에서 가져오기

## 3. API 활용하여 데이터 수집하기

## 4. 데이터 저장하기



# PART 3 |  데이터 살펴보기

## 1. 데이터프레임의 구조

## 2. 통계 함수 적용

## 3. Pandas 내장 그래프 도구 활용



# PART 4 |  시각화 도구

## 1. Matplotlib - 기본 그래프 도구

## 2. Seaborn 라이브러리 - 고급 그래프 도구

## 3. Folium 라이브러리 - 지도 활용



# PART 5 |  데이터 사전 처리

## 1. 누락 데이터 처리

## 2. 중복 데이터 처리

## 3. 데이터 표준화

## 4. 범주형 데이터 처리

## 5. 정규화

## 6. 시계열 데이터



# PART 6 |  데이터프레임의 다양한 응용

## 1. 함수 Mapping

## 2. 열 재구성

## 3. 필터링

## 4. 데이터프레임 합치기

## 5. 그룹 연산

## 6. 멀티 인덱스

## 7. 피벗

# PART 7 |  머신러닝 데이터 분석

## 1.

## 2.

## 3.

## 4.

## 5.

## 6.

## 7.


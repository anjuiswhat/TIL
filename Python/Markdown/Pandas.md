# PART 1 |  Pandas 기본

.

## 1. Pandas 자료구조

.

### 1-1. Series

#### Series 생성

```python
# 딕셔너리 -> 시리즈 변환
pandas.Series( 딕셔너리 )

# 리스트 -> 시리즈 변환
pandas.Series( 리스트,
               index = 인덱스 배열 )    # 인덱스 옵션을 생략하면 정수형 위치 인덱스가 자동 지정된다.
```

#### 인덱스 구조

```python
# 인덱스 배열 선택
series객체.index

# 데이터 값 배열
series객체.values
```

#### 원소 선택

```python
# 인덱스 이름으로 원소 선택

## 1)  1개의 원소 선택
series객체[ 'idx_name' ]     # 원소만 출력됨
series객체[ ['idx_name'] ]   # 원소와 인덱스가 같이 출력됨

## 2)  여러 개의 원소를 선택 (인덱스 리스트 활용)
series객체[ ['idx_name_1', 'idx_name_2', ..., 'idx_name_n'] ]

## 3)  여러 개의 원소를 선택 (인덱스 범위 지정)
###    범위 지정 시 범위의 끝 포함 ( [ 'a':'c' ] --> 'a', 'b', 'c' )
series객체[ '인덱스 이름1' : '인덱스 이름n' ]
series객체[ '인덱스 이름1' : '인덱스 이름n' : 슬라이싱 간격 ]


# 정수형 인덱스를 기준으로 원소 선택

## 1)  1개의 원소 선택
series객체[ idx_number ]     # 원소만 출력됨
series객체[ [ idx_number ] ]   # 원소와 인덱스가 같이 출력됨

## 2)  여러 개의 원소를 선택 (정수형 인덱스 리스트 활용)
series객체[ [ idx_number_1, idx_number_2, ..., idx_number_n ] ]

## 3)  여러 개의 원소를 선택 (정수형 인덱스 범위 지정)
###    범위 지정 시 범위의 끝 제외 ( [ 3 : 7 ] --> 3, 4, 5, 6 )
series객체[ idx_number_1 : idx_number_n ]
series객체[ idx_number_1 : idx_number_n : 슬라이싱 간격 ]    # 슬라이싱 간격을 지정하지 않으면 1씩 증가
                                                             # 예) 모든 행에 대하여 0행부터 2행 간격으로 선택하려면 [ : : 2 ]
```

.

### 1-2. DataFrame

#### DataFrame 생성

```python
# Dictionary → DataFrame
pandas.DataFrame( 딕셔너리 객체 )

# Array → DataFrame
pandas.DataFrame( 2차원 배열,
                  index = 행 인덱스 배열,
                  columns = 열 인덱스 배열 )
```

#### 행 인덱스 / 열 이름 변경 :  `rename()`, `.index`, `.columns`

```python
# 행 인덱스 변경 ( .index / rename() )
df객체.index
df객체.rename( index = { 기존 인덱스 : 새 인덱스, ...},
               inplace = False )   # 기본값은 False 로 원본 객체는 변경없이 새로운 객체를 반환
                                        # 원본 객체를 직접 변경하려면 inplace = True 로 설정)

# 열 이름 변경 ( .columns / rename() )
df객체.columns
df객체.rename( columns = { 기존 이름 : 새 이름, ...},
               inplace = False )   # 기본값은 False 로 원본 객체는 변경없이 새로운 객체를 반환
                                        # 원본 객체를 직접 변경하려면 inplace = True 로 설정)
```

#### 행/열 삭제 :  `.drop()`

```python
df객체.drop( 행 인덱스/배열 또는 열 이름/배열,
             axis = 0,    # 행 옵션은 axis = 0 / 열 옵션은 axis = 1
             inplace = False )    # inplace : 원본 객체에 변경사항 반영할지 결졍하는 옵션
```

#### 행 선택 :  `.loc[]`, `.iloc[]`

```python
# .loc[] : 인덱스 이름을 기준으로 선택
# 범위 지정 시 범위의 끝 포함 ( [ 'a':'c' ] --> 'a', 'b', 'c' )
df객체.loc[ '인덱스 이름' ]
df객체.loc[ '인덱스 이름1':'인덱스 이름n' ]

# .iloc[] : 정수형 위치 인덱스를 기준으로 선택
# 범위 지정 시 범위의 끝 제외 ( [ 3 : 7 ] --> 3, 4, 5, 6 )
df객체.iloc[ '정수형 위치 인덱스' ]
df객체.iloc[ 시작인덱스 : 끝인덱스 ]
df객체.iloc[ 시작인덱스 : 끝인덱스 : 슬라이싱 간격 ]    # 슬라이싱 간격을 지정하지 않으면 1씩 증가
                                                     # 예) 모든 행에 대하여 0행부터 2행 간격으로 선택하려면 .iloc[ : : 2 ]
```

#### 열 선택

```python
# 열 1개 선택 ( Series 생성 )
df객체[ '열 이름' ]
df객체.열 이름

# 열 n개 선택
df객체[ ['열1', '열2', ..., '열n'] ]
```

#### 원소 선택 :  `.loc[]`, `.iloc[]`

```python
# 1행2열 또는 2행1열을 선택하는 경우 Series 객체 반환
# 2행2열 이상을 선택하면 DataFrame 객체 반환

# .loc[] : 행 인덱스, 열 이름을 기준으로 선택
# 범위 지정 시 범위의 끝 포함 ( [ 'a':'c' ] --> 'a', 'b', 'c' )
df객체.loc[ 'r_idx', 'c_name' ]
df객체.loc[ ['r_idx_1', 'r_idx_2'],  ['c_name_1', 'c_name_2'] ]    # 2개 이상의 행/열 지정하여 원소 선택
df객체.loc[ 'r_idx_1' : 'r_idx_n' ,  'c_name_1' : 'c_name_n' ]    # 행/열 범위를 지정하여 원소 선택

# .iloc[] : 행/열의 정수형 위치 인덱스를 기준으로 선택
# 범위 지정 시 범위의 끝 제외 ( [ 3 : 7 ] --> 3, 4, 5, 6 )
df객체.iloc[ r_num, c_num ]
df객체.iloc[ [r_num_1, r_num_2],  [c_num_1, c_num_2] ]    # 2개 이상의 행/열 지정하여 원소 선택
df객체.iloc[ r_num_1 : r_num_n,  c_num_1 : c_num_n ]    # 행/열 범위를 지정하여 원소 선택
```

#### 행/열 추가

```python
# 행 추가
df객체.loc[ '추가할 행 이름' ] = 데이터 값 또는 배열

# 열 추가
df객체[ '추가할 열 이름' ] = 데이터 값
```

#### 원소 값 변경

```python
df객체의 일부분 또는 원소 선택 = 새로운 값
```

#### 전치행렬 :  `.transpose()`

```python
df객체.transpose()
df객체.T
```

.

## 2. 인덱스 활용

#### 특정 열을 행 인덱스로 설정 :  `.set_index()`

```python
df객체.set_index( '열 이름',
                  inplace = False )    # inplace : 원본 객체에 변경사항 반영할지 결졍하는 옵션

df객체.set_index( ['열 이름'],    # 멀티 인덱스로 바꿀 경우에는 [ '열 이름1', '열 이름2' ]
                  inplace = False )
```

#### 행 인덱스 재배열 :  `.reindex()`

```python
df객체.reindex( 새로운 인덱스 배열,
                fill_value = 0 )    # 추가한 행의 NaN 값을 다른 값으로 채울때 fill_value 옵션 사용 
```

#### 행 인덱스를 정수형으로 초기화 :  `.reset_index()`

```python
df객체.reset_index( inplace = False )    # inplace : 원본 객체에 변경사항 반영할지 결졍하는 옵션
```

#### 행 인덱스를 기준으로 DataFrame 정렬 :  `.sort_index()`

```python
df객체.sort_index( ascending = True,    # 오름차순/내림차순 옵션
                   inplace = False )    # inplace : 원본 객체에 변경사항 반영할지 결졍하는 옵션
```

#### 특정 열의 데이터 값을 기준으로 DataFrame 정렬 :  `.sort_values()`

```python
df객체.sort_values( by = '열 이름',
                    ascending = True,    # 오름차순/내림차순 옵션
                    inplace = False )    # inplace : 원본 객체에 변경사항 반영할지 결졍하는 옵션
```

.

.

# PART 2 |  데이터 입출력

.

## 1. 외부 파일 읽어오기

```python
# 참고: https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.read_csv.html

pandas.read_csv( '파일 경로/이름',
                 sep = 텍스트 데이터를 필드별로 구문하는 문자    # delimiter 옵션도 sep 와 동일한 기능
                 header = None,
                 index_col = 행 인덱스로 사용할 열의 이름/번호,
                 names = 열 이름으로 사용할 문자열 리스트,
                 skiprows = 처음 몇 줄을 skip 할 것인지 설정 (숫자 입력),
                 skipfooter = 마지막 몇 줄을 skip 할 것인지 설정 (숫자 입력),
                 encoding = 텍스트 인코딩 종류를 지정 (예: 'utf-8')
                 )
```



.

## 2. 웹(web)에서 가져오기

.

## 3. API 활용하여 데이터 수집하기

.

## 4. 데이터 저장하기

.

.

# PART 3 |  데이터 살펴보기

.

## 1. 데이터프레임의 구조

.

### 1-1. 데이터 내용 미리보기 :  `.head()`, `.tail()`

```python
# 앞부분 미리보기
df객체.head(n)    # 처음 n개의 행을 보여준다. n을 입력하지 않으면 처음 5개 행을 보여준다.

# 뒷부분 미리보기
df객체.tail(n)    # 마지막 n개의 행을 보여준다. n을 입력하지 않으면 마지막 5개 행을 보여준다.
```

.

### 1-2. 데이터 요약 정보 확인하기 :  `.shape`, `.info()`, `.describe()`

```python
# DataFrame의 크기 (행, 열)
df객체.shape

# DataFrame의 기본 정보
df객체.info()

# DataFrame의 기술 통계 정보 요약
df객체.describe()
df객체.describe( include = 'all' )    # 산술 데이터가 아닌 열에 대한 정보를 포함하는 옵션
```

.

### 1-3. 데이터 개수 확인

```python
# 각 열의 데이터 개수 확인
df객체.count()

# 각 열의 고유값 개수
df객체

df객체

df객체

df객체

```







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


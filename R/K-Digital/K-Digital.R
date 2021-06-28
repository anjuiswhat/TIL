# 디버깅을 위한 4가지 함수
print()
sprintf()    # 포매팅을 해서 출력
paste()
cat()

print('하이')

?sprintf
sprintf("number : %s", 1232)





letters
print(letters)
print(LETTERS)
month.abb
month.name


x <- 1:50
y <- x^2
mean(x)
plot(x,y)
cor(x,y)
# 변수의 데이터 형 확인
typeof()
mode()





sv <- c(100:200)
sv

sv[10]
head(sv,10)
tail(sv, 10)

sv[sv %%2 ==1]


sv[sv %%3 ==1]


d.20 <- head(sv, 20)
d.20

d.20[c(-5)]


d.20[c(-5, -7, -9)]


?month.name
absent <- c(10,8,14,15,9,10,15,12,9,7,8,7)

names(absent) <- month.name
absent

absent['May']
absent[absent.name='May']







mean(1:10)






# [정규표현식(regular expression)]

# *  0 or more.
# +  1 or more.
# ?  0 or 1.
# .  무엇이든 한 글자를 의미
# ^  시작 문자 지정 
# ex) ^[abc] abc중 한 단어 포함한 것으로 시작
# [^] 해당 문자를 제외한 모든 것 ex) [^abc] a,b,c 는 빼고
# $  끝 문자 지정
# [a-z] 알파벳 소문자 중 1개
# [A-Z] 알파벳 대문자 중 1개
# [0-9] 모든 숫자 중 1개
# [a-zA-Z] 모든 알파벳 중 1개
# [가-힣] 모든 한글 중 1개
# [^가-힣] 모든 한글을 제외한 모든 것
# [:punct:] 구두점 문자, ! " # $ % & ’ ( ) * + , - . / : ; < = > ? @ [ ] ^ _ ` { | } ~.
# [:alpha:] 알파벳 대소문자, 동등한 표현 [A-z]
# [:lower:] 영문 소문자, 동등한 표현 [a-z]
# [:upper:] 영문 대문자, 동등한 표현 [A-Z].
# [:digit:] 숫자, 0,1,2,3,4,5,6,7,8,9,
# [:xdigit:] 16진수  [0-9A-Fa-f]
# [:alnum:] 알파벳 숫자 문자, 동등한 표현[A-z0-9].
# [:cntrl:] \n, \r 같은 제어문자, 동등한 표현[\x00-\x1F\x7F].
# [:graph:] 그래픽 (사람이 읽을 수 있는) 문자, 동등한 표현
# [:print:] 출력가능한 문자, 동등한 표현
# [:space:] 공백 문자: 탭, 개행문자, 수직탭, 공백, 복귀문자, 서식이송
# [:blank:] 간격 문자, 즉 스페이스와 탭.


# 시작문자를 지정: ^
# + 1 or more

# 소문자 b 로 시작하는 데이터를 추출한다면?
grep('^b+', txtVec, value = T)
grep('^b+', txtVec, value = T, ignore.case = T)


# gsub()
# 


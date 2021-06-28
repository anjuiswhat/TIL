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











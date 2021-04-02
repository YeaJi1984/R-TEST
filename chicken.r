#치킨집이 가장 많은 지역 찾기
#그림의 크기고 많은 지역을 표현
#치킨집데이터 구하기
#www.localdata.kr
#데이터 읽어오기
library("readxl")
ck <- read_excel("치킨집_가공.xlsx")
head(ck)

#동별로 추출하여 상세 주소는 제거 substr()를 사용하여 동까지만 남기고 나머지 삭제
addr <- substr(ck$'소재지전체주소', 11, 16) #substr(데이터, 시작, 끝)
head(addr)

#숫자들과 공백을 모두 삭제.
#gsub() 함수를 사용하여 제거
addr_num  <- gsub("[0-9]","", addr) #gsub(찾을 값, 바꿀 값, 어디에)
head(addr_num)

#여백 모두 삭제
#gsub() 함수 사용하여 제거
addr_trim  <-  gsub(" ", "", addr_num)
head(addr_trim)

#동별 업소 개수 확인하기
#변수의 개수 확인을 위해 table() 함수 사용
library(dplyr)
addr_count  <-  addr_trim  %>% table()  %>% data.frame
head(addr_count)

install.packages("treemap")
library(treemap)

treemap(addr_count,index=".",vSize="Freq", title = "서대문구 동별 치킨집 분포")



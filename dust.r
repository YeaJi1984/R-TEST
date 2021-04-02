#서울시의 구 중에서 성북구와 중구의 미세먼지 비교 및 차이 검정..
library("readxl")
library("dplyr")
dustdata <- read_excel("dustdata.xlsx")
head(dustdata)


#성북구와 중구 데이터만 추출
dustdata_anal  <- dustdata  %>%  filter(area %in% c("성북구", "중구"))

#데이터 현황 구체적인 파악
#데이터 날짜 확인 -> 2017년 9월 1일부터 12월 31일까지..

count(dustdata_anal, yyyymmdd)  %>%  arrange(desc(n)) #모든 데이터가 2개 확인
count(dustdata_anal, area) # 모든 데이터가 2개 확인.
#실행 결과를 보면 빠진 데이터가 없이 동일한 날짜는 2개씩 구에 따른 미세먼지 수치를 122

#성북구와 중구에 데이터를 각각 분리
dust_sb  <-  subset(dustdata_anal, area =="성북구")
dust_jg  <-  subset(dustdata_anal, area =="중구")
#sub(데이터, 조건)
#dust_sb  <- dustdata_anal  %>%  filter(area=="성북구")
#dust_sb  <- dustdata_anal  %>%  filter(area=="중구")

#분리한 두 개구의 데이터를 이용해서 기초 통계량 도출


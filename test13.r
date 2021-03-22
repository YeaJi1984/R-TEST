library(readxl)
library(dplyr)

customer_r <- read_excel("customer_r.xlsx")
reservation_r <- read_excel("reservation_r.xlsx")
order_info_r <- read_excel("order_info_r.xlsx")
item_r <- read_excel("item_r.xlsx")
colnames(customer_r) <- tolower(colnames(customer_r))
colnames(reservation_r) <- tolower(colnames(reservation_r))
colnames(order_info_r) <- tolower(colnames(order_info_r))
colnames(item_r) <- tolower(colnames(item_r))

my_first_cook  <-  order_info_r  %>% #읽어오기
    mutate(reserv_month = substr(reserv_no, 1,6)) %>% #계산후 열을 생성
    group_by(item_id, reserv_month) %>%  # 그룹 생성
    summarise(avg_sales = mean(sales)) %>% #요약 평균 계산
    arrange(item_id, reserv_month) #정렬

my_first_cook

head(my_first_cook)
library(ggplot2)
ggplot(my_first_cook, aes(x=reserv_month, y = avg_sales, group= item_id, color= item_id))+
    geom_line(size=1)+
    geom_point(color ="darkorange", size =1.5) +
    scale_color_brewer(palette ="Paired")+
    labs(title ="메뉴 아이템별 월 평균 매출 추이", x="월", y="매출")


weight  <-  c (74, 66, 61, 59, 70)
mean(weight) # 평균 값
median(weight) # 중앙 값
var(weight) #분산
sd(weight) # 표준편차


df_f_join_1  <- inner_join(reservation_r, order_info_r, by = "reserv_no")
df_f_join_2  <- inner_join(df_f_join_1, item_r, by ="item_id")


head (df_f_join_2)
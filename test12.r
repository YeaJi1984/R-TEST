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


total_amt  <-  order_info_r  %>% 
                group_by(reserv_no) %>% 
                summarise(amt_daily = sum(sales/1000)) %>% 
                arrange(reserv_no)
total_amt


library('ggplot2')
ggplot(total_amt, aes(x= reserv_no, y=amt_daily, group =1)) + 
        geom_line()

total_amt  <- order_info_r  %>% 
                mutate(month =substr(reserv_no, 1,6))  %>% 
                group_by(month)  %>% 
                summarise(amt_monthly = sum(sales/1000))

total_amt





ggplot(total_amt, aes(x = month, y = amt_monthly, group = 1)) +geom_line() +geom_point()

ggplot(total_amt, aes(x= month, y= amt_monthly, group=1)) + geom_line() +geom_point()




ggplot(total_amt, aes(x = month, y = amt_monthly, group = 1, label = amt_monthly)) +
    geom_line(color = "red", size = 1) +
    geom_point(color = "darkred", size = 3) +
    geom_text(vjust = 1.5, hjust = 0.5)


tail(ToothGrowth)

df  <-  ToothGrowth  %>% 
        group_by(dose)  %>% 
        summarise(sd=sd(len), len =mean(len))   #표준편차, 평균

df

ggplot(df, aes(dose, len)) + 
        geom_line(aes(group=1)) +
        geom_point(size=2)

df2  <-  ToothGrowth  %>% 
    group_by(dose, supp)  %>% 
    summarise(sd=sd(len), len=mean(len))

df2

ggplot(df2,aes(dose,len)) +
    geom_line(aes(group=supp))


ggplot(df2,aes(dose,len)) +
    geom_line(aes(group=supp,linetype=supp)) +
    geom_point(size=2)

ggplot(df2,aes(dose,len)) +
    geom_line(aes(group=supp,linetype=supp)) +
    geom_point(size=2) +
    theme_classic()


df_boxplot_graph  <-  inner_join(order_info_r, item_r, by="item_id")

ggplot(df_boxplot_graph, aes(product_name, sales/1000)) +
    geom_boxplot(width =0.8, outlier.size = 2, outlier.color = "red")+
    labs(title="메뉴아이템 상자 그림", x="메뉴", y="매출")
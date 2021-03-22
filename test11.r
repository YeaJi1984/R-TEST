
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

install.packages("ggplot2")
library(ggplot2)

ggplot(data = pressure, aes(x= temperature, y = pressure))
+geom_point()
+geom_line()
+geom_col()


df_cfm_order <- inner_join(reservation_r, order_info_r, by = "reserv_no") %>% 
    select(customer_id, reserv_no, visitor_cnt, cancel, order_no, item_id, sales) %>% 
arrange(customer_id, reserv_no, item_id)

head(df_cfm_order)

df_sct_graph  <- df_cfm_order  %>% 
    group_by(customer_id) %>% 
    summarise(vst_cnt = sum(visitor_cnt), cust_amt = sum(sales/1000))

head(df_sct_graph)


ggplot(data = df_sct_graph, aes( x= vst_cnt, y=cust_amt)) + geom_point()

ggplot(data = df_sct_graph, aes(x=vst_cnt, y=cust_amt))+
geom_point() +
xlim(0,50) + ylim(0,500)

df_sct_graph2  <-  inner_join(df_sct_graph, customer_r, by = "cust")

df_sct_graph2 <- inner_join(df_sct_graph, customer_r, by = "customer_id") %>%
    select(vst_cnt, cust_amt, sex_code)

head(df_sct_graph2) 

ggplot(data = df_sct_graph2, aes(x = vst_cnt, y = cust_amt, color = sex_code)) +
    geom_point() +
    xlim(0, 50) +
    ylim(0, 500)


df_branch_sales_1  <- inner_join(reservation_r, order_info_r, by = "reserv_no")  %>% 
select(branch,sales) %>% 
arrange(branch, sales)


ggplot(df_b)

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

head(customer_r)

customer_r %>% count()
summarise(order_info_r, avg = mean(sales))

summarise(order_info_r, min_value=min(sales), max_value = max(sales))

order_info_r  %>% summarise(min(sales), max_value = max(sales))

reservation_r  %>%  group_by(customer_id)  %>% summarise(avg = mean(visitor_cnt))

order_info_r %>% filter(item_id =='M0001')

order_info_r  %>%  filter(item_id == 'M0001' & sales >= 150000)

head(order_info_r)

order_info_r  %>% distinct(item_id)

order_info_r  %>%  slice(2:4)

order_info_r  %>%  slice(c(1,3))

order_info_r  %>%  arrange(sales)

order_info_r  %>% arrange(reserv_no, item_id)

table_added_row  <-  order_info_r  %>%  add_row(order_no = "1", item_id ="1", reserv_no ="1")

table_added_row  %>%  arrange(order_no)

order_info_r  %>% sample_frac(0.1, replace = TRUE)

order_info_r  %>%  select(reserv_no, sales)

order_info_r  %>%  group_by(reserv_no)  %>% mutate (avg= mean(sales))

order_info_r  %>% group_by(reserv_no) %>%  transmute(avg = mean(sales))

order_info_r  %>% mutate_all(funs(max))

order_info_r  %>% mutate_if(is.numeric, funs(log(.)))

order_info_r  %>% mutate_at(vars(sales), funs(max))

tmp_order_info_r  <- order_info_r

bind_cols(order_info_r, tmp_order_info_r)

bind_cols(order_info_r, reservation_r)

tmp_order_info_r  <-  order_info_r

bind_rows(order_info_r, tmp_order_info_r)

bind_rows(order_info_r, reservation_r)

inner_join(reservation_r, order_info_r, by="reserv_no")  %>%  arrange(reserv_no, item_id)

inner_join(reservation_r, order_info_r, by = "reserv_no")  %>% 
arrange(reserv_no, item_id)  %>% 
select(reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales)

left_join(reservation_r, order_info_r, by = "reserv_no")  %>% 
arrange(reserv_no, item_id)  %>% 
select(reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales)

right_join(reservation_r, order_info_r, by = "reserv_no")  %>% 
arrange(reserv_no, item_id)  %>% 
select(reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales)

table_added_row  <- order_info_r  %>% 
    add_row(order_no="1", item_id="1", reserv_no="1", sales=1)
full_join(reservation_r, table_added_row, by = "reserv_no") %>% 
arrange(reserv_no, item_id) %>% 
select(reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales)

reservation_r_rsv_no  <-  select(reservation_r, reserv_no)

order_info_r_rsv_no <- select(order_info_r, reserv_no)

intersect(reservation_r_rsv_no, order_info_r_rsv_no)

setdiff(reservation_r_rsv_no, order_info_r_rsv_no)

union(reservation_r_rsv_no, order_info_r_rsv_no)

reservation_r  %>% 
    group_by(customer_id)  %>% 
    summarise(avg = mean(visitor_cnt)) %>% 
    filter(avg>3) %>% 
    arrange(desc(avg))

my_first_cook  <- order_info_r %>%
    mutate(reserv_month=substr(reserv_no,1,6)) %>% 
    group_by(item_id, reserv_month) %>% 
    summarise(avg_sales=mean(sales)) %>% 
    arrange(item_id, reserv_month)

my_first_cook
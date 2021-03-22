install.packages("readxl")
library(readxl)
install.packages('jsonlite')
order_info_r  <- read_excel("order_info_r.xlsx")

head(order_info_r)

tmp_order_info_r  <-  order_info_r

library(dplyr)

bind_cols(order_info_r, tmp_order_info_r)

bind_rows(order_info_r, reservation_r)

inner_join(reservation_r, order_info_r, by="reserv_no") %>%
arrange(reserv_no, item_id) %>%
select(reserv_no, custom_id, visition_cnt, cancel, order_no, item_id, sales)


left_join(reservation_r, order_info_r, by = "reserv_no") %>%
    arrange(reserv_no, item_id)%>% 
    select (reserv_no, customer_id, visitor_cnt, cancel, order_no, item_id, sales )
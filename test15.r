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


df_rsv_customer  <- reservation_r %>% 
                    select(customer_id, reserv_no) %>% 
                    arrange(customer_id, reserv_no)

head(df_rsv_customer)

df_steak_order_rsv_no  <- order_info_r  %>% 
                        filter(item_id =='M0005') %>% 
                        mutate(steak_order ='Y')  %>% 
                        arrange(reserv_no)
head(df_steak_order_rsv_no)

df_steak_order_1  <-  left_join(df_rsv_customer, df_steak_order_rsv_no, by = "reserv_no") %>% 
group_by(customer_id) %>% 
mutate(steak_order = ifelse(is.na(steak_order),"N","Y"))  %>% 
summarise(steak_order = max(steak_order)) %>% 
arrange(customer_id)

df_dpd_var  <- df_steak_order_1
df_dpd_var

install.packages("installr")
install.packages("stringr")

check.for.updates.R()

package_version(R.version)

install.packages("rpart")
install.packages("caret") #예측과 머신러닝 함수들
install.packages("e1071") #훈련과 실험 데이터셋나누기

library(caret)


set.seed(10000)

train_data <-  createDataPartition( y=df_final_data$steak_order, p=0.8, list + FALSE)
train  <-  df_final_data[train_data, ]
test  <- df_final_data[-train_data,]
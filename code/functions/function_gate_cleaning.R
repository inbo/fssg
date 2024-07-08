gate_cleaning<-function(data,jaar){
  colnames(data)<-c("date_time","opening")
  if (jaar=="2023"){data$date_time <- round_date(ymd_hms(data$date_time,tz = "Europe/Brussels"),unit="1 second")}
  if (jaar=="2024"){data$date_time <- round_date(mdy_hms(data$date_time,tz = "Europe/Brussels"),unit="1 second")}
  attr(data$date_time, "tzone") <- "UTC"
  data$measurement=TRUE
  start<-min(data$date_time,na.rm=TRUE)
  stop<-max(data$date_time,na.rm=TRUE)
  seq=as.data.frame(seq(start,stop,by=1)) #Time interval with steps of one second
  colnames(seq)="date_time"
  gate <- left_join(seq,data[which(duplicated(data$date_time)==FALSE),], by=c("date_time")) 
  gate$opening<-na_interpolation(gate$opening,option ="linear")
  gate$open=FALSE
  gate$open[which(gate$opening>5)]=TRUE
  gate$open_lag<-dplyr::lag(gate$open)
  open<-which(gate$open!=gate$open_lag & gate$open==TRUE & gate$open_lag==FALSE)
  gate$periode=NA
  k=1
  for (i in open){
    gate$periode[i]=k
    k=k+1
  }
  gate <- gate %>% fill(periode, .direction = 'up') %>% dplyr::select(-open_lag,-open)
  gate$since_open<-with(rle(gate$periode), sequence(lengths)-1)/60
  gate <- gate %>% dplyr::select(-periode)
  return(gate)
}
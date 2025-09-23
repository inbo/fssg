plot_vdz <- function(start, stop, node_input, exp_input, points = FALSE, trend = FALSE, peaksid = FALSE, gate=gate){
  start = as.POSIXct(start,tz = "UTC")
  stop = as.POSIXct(stop,tz = "UTC")
  
  g<-ggplot(gate %>% dplyr::filter(date_time>start & date_time<stop & node==node_input) ,aes(x=date_time,y=opening))+
    geom_line()
  if (points == TRUE){
    g<-g+geom_point(data=gate %>% dplyr::filter(date_time>start & date_time<stop & node==node_input & measurement == TRUE),aes(x=date_time,y=opening))
  }
  if (peaksid == TRUE){
    g<-g+geom_point(data=gate %>% dplyr::filter(date_time>start & date_time<stop & node==node_input & measurement == TRUE),aes(x=date_time,y=opening,color=peaksid))
  }
  if (trend == TRUE){
    g<-g+geom_point(data=gate %>% dplyr::filter(date_time>start & date_time<stop & node==node_input & measurement == TRUE),aes(x=date_time,y=opening,color=trend))
  }
  g<-g+geom_vline(data=comp_dir %>% dplyr::filter(exp==exp_input & node==node_input),aes(xintercept = min_det),colour="red",size=1,alpha=0.3)+
    ylab("opening valve (cm)")+
    xlab("date") +
    scale_y_continuous(breaks = round(seq(min(gate$opening), max(gate$opening), by = 1),1))
  print(g)
}
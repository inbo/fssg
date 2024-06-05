clean_hervangst_and_uitzet<-function(dir,proef,type,tijdstip,first.numbers){
  data<-read.csv(dir,sep=";")
  data$Fish.Spiral<-NULL
  colnames(data)<-c("tag_code","opmerkingen")
  numbers_only <- function(x) !grepl("\\D", x)
  data$tag_code[which(numbers_only(data$tag_code)==TRUE)]=paste0("90020900008",data$tag_code[which(numbers_only(data$tag_code)==TRUE)])
  data$tag_code[which(numbers_only(data$tag_code)==FALSE)]=paste("unknown",rownames(data[which(numbers_only(data$tag_code)==FALSE),]),sep="_")
  data$toestand<-NA
  data$toestand[which(sapply(data$opmerkingen, grepl, pattern = 'dood')==TRUE)]="dood"
  data$toestand[which(sapply(data$opmerkingen, grepl, pattern = 'levend')==TRUE)]="levend"
  data$event_site_code_value<-NA
  data$event_site_code_value[which(sapply(data$opmerkingen, grepl, pattern = 'buitenring onder')==TRUE)]="buitenring onder"
  data$event_site_code_value[which(sapply(data$opmerkingen, grepl, pattern = 'binnenring')==TRUE)]="binnenring"
  data$event_site_code_value[which(sapply(data$opmerkingen, grepl, pattern = 'tank beneden')==TRUE)]="tank beneden"
  data$event_site_code_value[which(sapply(data$opmerkingen, grepl, pattern = 'tank onder')==TRUE)]="tank beneden"
  data$event_site_code_value[which(sapply(data$opmerkingen, grepl, pattern = 'tank boven')==TRUE)]="tank boven"
  if (type=="uitzet"){data$event_site_code_value="tank beneden"}
  data$event_date_time_value<-as.POSIXct(tijdstip,format="%Y-%m-%d %H:%M:%OS",tz="Europe/Brussels")
  attr(data$event_date_time_value, "tzone") <- "UTC"
  data$antenna_id<-"01"
  data$antenna_group_configuration_value<-100
  data$proef<-proef
  data$tag_code<-paste0(data$tag_code,"_",data$proef)
  data <- data %>% dplyr::select(-opmerkingen,-toestand)
  data$type<-type
  data$event_site_code_value[which(is.na(data$event_site_code_value)==TRUE)]="ontsnapt"
  return(data)
}
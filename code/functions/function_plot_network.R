plot_network<-function(exp_input,to_include="all"){
  if (to_include=="all"){
    d=links %>% 
      dplyr::filter(exp==exp_input) %>%
      dplyr::select(-exp)
    vertices=nodes %>% 
      dplyr::filter(exp==exp_input) %>%
      dplyr::select(-exp)
  } else{
    d=links %>% 
      dplyr::filter(exp==exp_input & stop!="inner ring" & stop!="outer ring") %>%
      dplyr::select(-exp)
    vertices=nodes %>% 
      dplyr::filter(exp==exp_input & node!="inner ring" & node!="outer ring") %>%
      dplyr::select(-exp)
  }
  
  network <- graph_from_data_frame(d,vertices,directed=T) 
  l <- layout_on_grid(network)
  plot(network, edge.width=E(network)$n/8, vertex.size=V(network)$n, layout = l, edge.curved=0.5, 
       edge.color=E(network)$color,edge.label = d$n,vertex.label = paste(vertices$node,vertices$n,sep="\n"),vertex.label.cex=2,edge.label.cex=2)
}
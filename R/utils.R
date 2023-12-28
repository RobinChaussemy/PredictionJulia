str_to_int <- function(chc){
  return(as.integer(chc))
}

strbool_to_int <- function(chc){
  if(chc == "false" | chc == "M"){
    return(0)
  }else{
    return(1)
  }
}

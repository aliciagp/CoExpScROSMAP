#' initDb - Initialization of the package so the scROSMAP networks can be used with
#' CoExpNets
#'
#' @param mandatory If this parameter is `TRUE` then the networks will be added no matter whether they were already there.
#'
#' @return No value
#' @export
#'
#' @examples
initDb = function(mandatory=F){
  the.dir = system.file("", "scROSMAP", package = "CoExpscROSMAP")
  nets = getscROSMAPcombinations()
  for(net in nets){
    CoExpNets::addNet(which.one="scROSMAP",
                      tissue=net,
                      netfile=getscROSMAPnet(net),
                      ctfile=paste0(getscROSMAPnet(net),"_gprof.rds"),
                      gofile=paste0(getscROSMAPnet(net),"_gprof.rds"),
                      exprdatafile=paste0(the.dir,"/",net,"resids", ".rds"),
                      overwrite=mandatory)
  }
}

#' getscROSMAPnet - Accessing a network object directly
#'
#' @param tissue One of the labels that can be obtained by calling getscROSMAPcombinations() method
#' to refer to a specific network within the package
#'
#' @return The RDS full file name to the network
#' @export
#'
#' @examples
getscROSMAPnet = function(tissue){

  the.dir = system.file("", "scROSMAP", package = "CoExpscROSMAP")
  files = list.files(the.dir)

  net.file = files[grep(paste0("net",tissue,"\\.\\d+\\.it\\.50\\.rds$"),files)]
  if(length(net.file) == 0)
    return(NULL)

  return(paste0(the.dir,"/",net.file))
}

#' Title Getting all scROSMAP available tissues
#'
#' @return
#' @export
#'
#' @examples
getscROSMAPcombinations = function(){

  the.dir = system.file("", "scROSMAP", package = "CoExpscROSMAP")
  files = list.files(the.dir)

  net.files = files[grep("net\\w+\\.\\d+\\.it\\.50\\.rds$",files)]
  net.files = gsub("net","",net.files)
  net.files = gsub(".\\d+\\.it\\.50\\.rds$","",net.files)

  return(net.files)
}

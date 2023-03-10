#' Plot axis creation
#' @description The purpose of this function is to create  even plot ticks at the minimum, middle and max values of the plot. 
#' 
#' @param dat A dataframe with variable to create axis information for 
#' @param colName Name of variable do you need to find intervals for (make sure there are quotations around the colnames )
#' @param round Number of digits to round axis values to. Default is 2
#'
#' @return A list of three values 
#' 
#' @export
#' 
#' @import dplyr
#' 
#' @family aesthetics
#' @keywords plotting aesthetics
#' 
#' @examples
#' #create three evenly spaced axis ticks for weight column on mtcars dataset
#' axis_ticks<-plotaxis(dat=mtcars,colName = "wt")
#' 
#' axis_ticks
#' 
#' #Slightly more complicated 
#' #create three evenly spaced axis ticks for airquality dataset
#' months<-unique(airquality$Month)#unique list of months of year sampled
#'
#' dats<-lapply(months,#create list of datasets, one for each month
#'  function (month) dplyr::filter(airquality,Month==month))
#' axis_ticks<-lapply(dats, #create set of evenly spaced axis tick values for all datasets.
#' function(x) plotaxis(dat = x, colName = "Ozone"))
#' 
#' axis_ticks 

plotaxis<-function(dat,
                   colName,
                   round=2){

  dd<-dat%>% 
    ungroup%>%
    select(!!sym(colName))
  
  #determining minimum, middle, and max of the particular variable plotted....default is to round to 2 digits. 
  min<-min(dd, na.rm=T)%>%round(digits=round)# calculate the minimum value of vector of values dd
  mid<-mean(c(min(dd, na.rm =T),max(dd, na.rm =T)))%>%round(digits=round)# calculate the middle value of vector of values dd
  max<-max(dd, na.rm =T)%>%round(digits=round)# calculate the max value of vector of values dd
  
  #output
  axes<-c(min, mid, max)#save each of those previously calculated values. 
  
  return(axes)
}




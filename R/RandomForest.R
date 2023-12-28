c_indiv <- function(a,b,c,d,e,f,g,h,i,j,k=0,l=0){
  return(paste0("[",a,",",b,",",c,",",d,",",e,",",f,",",g,",",e,",",i,",",j,",",k,",",l,"]"))
}

string_process <- function(cdc){
  return(paste0("\"",cdc,"\""))
}

#' RandomForest_Julia
#'
#' @param ntree nombre d'arbres dans la RandomForest
#' @param sommet nom du sommet
#' @param saison choix de la saison
#' @param nationalite quelle nationalité ?
#' @param role rôle dans la cordée
#' @param annee année de l'ascension
#' @param sexe votre genre
#' @param age votre âge
#' @param pro êtes vous un sherpa
#' @param solo comptez vous faire l'ascension en solo
#' @param oxygene utilsation d'oxygène
#' @param mort êtes vous prêt à mourir
#' @param blesse avez vous peur de vous blesser
#'
#' @import jl4R
#'
#' @export
#'
#' @examples RandomForest_Julia("Ama Dablam","Autumn","France","Climber",2025,1,20,0,0,0,0,0,5)


RandomForest_Julia <- function(sommet,saison,nationalite,role,annee,sexe,age,pro,solo,oxygene,mort=0,blesse=0,ntree = 5){
  RandomForest_result <- jl4R::jl(paste0("JuliaPredict.Tree_Process(JuliaPredict.get_data(),",c_indiv(string_process(sommet),string_process(saison),string_process(nationalite),string_process(role),str_to_int(annee),strbool_to_int(sexe),str_to_int(age),strbool_to_int(pro),strbool_to_int(solo),strbool_to_int(oxygene),mort,blesse),",",ntree,")"))
  return(list(prediction = R(RandomForest_result[1]), proba_f = R(RandomForest_result[2]),proba_s = R(RandomForest_result[3]),temps = R(RandomForest_result[4])))
}

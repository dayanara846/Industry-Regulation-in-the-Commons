#' Nash Equilibrium
#'
#' @param num_of_firms Number of firms in the game.
#' @param K Amount available of the Commons. Default is number of firms + 1.
#'
#' @return A written statement explaining the strategies that lead to Nash Equilibrium.
#' @export
#'
#' @examples game_NE(2)
game_NE <- function(num_of_firms, K="none") {
  num_of_firms=3
  K="none"
  # set K
  if(K == "none"){
  K <- num_of_firms +1 # resource
  }

  # payoffs
    pays <- game_payoffs(num_of_firms=num_of_firms, best_resp="Yes")

  # Nash Equilibriums
    NEs <- pays[(pays$Si == pays$Sj_right | pays$Si == pays$Sj_right | (pays$Si == pays$Sj_right-pays$Sj_left-1 & pays$Si == 1)) & (pays$Scenario == "Sum_Si<K" |  pays$Scenario == "Sum_Si=>K"),]

    # results
    cat("There ", ifelse(nrow(NEs)==1, " is ", " are "), nrow(NEs), ifelse(nrow(NEs)==1, " Nash Equilibrium ", " Nash Equilibriums "), ".\n")
    cat("\n")
    for(i in 1:nrow(NEs)){
    cat(" ", "(", i, ")", "Nash Equilibrium ", i, ", for ", NEs$Scenario[i], ": \n")
    if(NEs$Sj_left[i]==NEs$Sj_right[i]){
      cat("  ", num_of_firms, " firms choose ", NEs$Sj_left[i], " units, each with a payoff of ", NEs$Sj_Payoff_left[i],". \n")
      cat("\n")
    } else if (NEs$Sj_left[i]!=NEs$Sj_right[i] & NEs$Sj_left[i]==NEs$Si[i]){
      cat("  ", num_of_firms, " firms choose ", NEs$Sj_left[i], " units, each with a payoff of ", NEs$Sj_Payoff_left[i],". \n")
      cat("\n")
    } else if (NEs$Sj_left[i]!=NEs$Sj_right[i] & NEs$Sj_right[i]==NEs$Si[i]){
      cat("  ", num_of_firms, " firms choose ", NEs$Sj_right[i], " units, each with a payoff of ", NEs$Sj_Payoff_right[i],". \n")
      cat("\n")
    } else {
      cat("  ", num_of_firms, " firms choose ", NEs$Si[i], " units, each with a payoff of ", NEs$Si_Payoff[i],". \n")
    }
    }
}

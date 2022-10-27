#' Game Payoffs
#'
#' @param num_of_firms Number of firms in the game.
#' @param p penalty or entrance fee paid by the firms when entering the game, if they choose a strategy that is not S0. Default is 0.5.
#' @param K amount available of the Commons. Default is number of firms + 1.
#' @param S0 Strategy of extracting 0 units or not submitting a form request to the government, in our game's context.
#' @param S1 Strategy of extracting x unit from the Commons. Default is 1.
#' @param S2 Strategy of extracting y units from the Commons. Default is 1.
#' @param best_resp if "Yes", it will return only a dataframe of the payoffs of Player i, for each strategy. Default at "Yes". If "No", it will print a phrase summarising the best responses and payoffs of Player i.
#'
#' @return payoffs of Player i and Player j
#' @export
#'
#' @examples game_payoffs(2)
game_payoffs <- function(num_of_firms, p=0.5, K="none", S0=0, S1=1, S2=2, best_resp="Yes"){

  # set K
  if(K == "none"){
  K <- num_of_firms +1 # resource
  }


  # Probabilities
  pr_e <- floor(num_of_firms/2)/num_of_firms
  pr_n <- 1-pr_e

  # Payoffs
  p0 <- S0
  p1 <- S1-p
  p2 <- S2-p
  p1_1 <- (S1-p)*pr_e+(-p)*pr_n
  p2_2 <- (S2-p)*pr_e+(-p)*pr_n

  # recurrent words
  vi <- "You get = "
  Si <- ", if you choose = "
  S_i <- " & the rest of the firms choose = "

  # return

  if(best_resp == "Yes"){
      # also return payoffs
      payoffs <- data.frame(
        Scenario = c("Sum_Si<K", "Sum_Si<K", "Sum_Si<K", "Sum_Si=>K", "Sum_Si=>K", "Sum_Si=>K"),
        Si = c(0, 1, 2, 1, 2, 0),
        Sj_left = c(S0, S0, S0,
                    ifelse(((num_of_firms-2)*S2+S1*2)>=K, S1, S2),
                    ifelse(((num_of_firms-2)*S2+S1*2)>=K, S1, S2),
                    ifelse(((num_of_firms-2)*S2+S1*2)>=K, S1, S2)),
        Sj_right = c(S2,
                     if((num_of_firms-2)*S0+S2+S1<K){
                       S2
                     } else if((num_of_firms-2)*S0+S1+S1<K){
                       S1
                     } else {
                       S0
                     },
                     if((num_of_firms-2)*S0+S2+S2<K){
                       S2
                     } else if((num_of_firms-2)*S0+S1+S2<K){
                       S1
                     } else {
                       S0
                     },
                     S2, S2, S2),
        Si_Payoff = c(p0, p1, p2, p1_1, p2_2, p0),
        Sj_Payoff_left = c(p0, p0, p0,
                           ifelse(((num_of_firms-2)*S2+S1*2)>=K, p1_1, p2_2),
                           ifelse(((num_of_firms-2)*S2+S1*2)>=K, p1_1, p2_2),
                           ifelse(((num_of_firms-2)*S2+S1*2)>=K, p1_1, p2_2)),
        Sj_Payoff_right = c(p2,
                     if((num_of_firms-2)*S0+S2+S1<K){
                       p2
                     } else if((num_of_firms-2)*S0+S1+S1<K){
                       p1
                     } else {
                       p0
                     },
                     if((num_of_firms-2)*S0+S2+S2<K){
                       p2
                     } else if((num_of_firms-2)*S0+S1+S2<K){
                       p1
                     } else {
                       p0
                     },
                     p2_2, p2_2, p2_2)
        )
      return(payoffs)
  } else {
    cat("Your payoff in each scenario, with ",  num_of_firms-1," other firms:\n")
      cat(vi , p0, Si, S0 , S_i, "[0, infinity]\n")
        cat(vi, p1, Si, S1, S_i, "[0, ", K-S1-1, "]\n")
          cat(vi, p2, Si, S2, S_i, "[0, ", K-S2-1, "]\n")
            cat(vi, p1_1, Si, S1, S_i, " [", K-S1, " , infinity]\n")
              cat(vi, p2_2, Si, S2, S_i,"[", K-S2, " , infinity]\n")
                cat("\n")
                cat("\n")
    }
}

#' Pareto Equilibrium
#'
#' @param num_of_firms Number of firms in the game.
#' @param K Amount available of the Commons. Default is number of firms + 1.
#'
#' @return A written statement explaining the strategies that lead to pareto optimality.
#' @export
#'
#' @examples game_pareto(2)
game_pareto <- function(num_of_firms, K="none"){

  # set K
  if(K == "none"){
  K <- num_of_firms +1 # resource
  }

  # payoffs
    pays <- game_payoffs(num_of_firms=num_of_firms, best_resp="Yes")

    # pareto optimal strategy
    pareto <- pays[which((pays$Si_Payoff) == max(pays$Si_Payoff)), ]

      # number of other firms that choose each strategy
                    nl <- 1 # num. of firms that choose the minimum strategy
                    nr <- 0 # num. of firms that choose the maximum strategy
                    nm <- 0 # num. of firms that choose the median strategy
                    m <- if(pareto$Sj_right==2 & pareto$Sj_left==0){
                            m <- 1
                            } else {
                             m <- "None"
                            }


                    if(m == "None"){
                                   nr <- ifelse(pareto$Sj_right==0,
                                          floor((K - pareto$Si - nl*pareto$Sj_left)/1)-1,
                                          floor((K - pareto$Si - nl*pareto$Sj_left)/pareto$Sj_right)-1)
                                   nl <- num_of_firms-nr-1

                      } else {while((nr*pareto$Sj_right+pareto$Si+nl*pareto$Sj_left+nm*m< K) & (nr+nl+nm+1<num_of_firms)){
                            nm <- ifelse((nr*pareto$Sj_right+pareto$Si+nl*pareto$Sj_left+(nm+1)*m<K) &
                                     (nr+nl+nm+1<num_of_firms) &
                                     (((ifelse(pareto$Sj_right==0,
                                             floor((K - pareto$Si - nl*pareto$Sj_left - nm*m)/1),
                                            floor((K - pareto$Si - nl*pareto$Sj_left - nm*m)/pareto$Sj_right)))*pareto$Sj_right+pareto$Si+nl*pareto$Sj_left+(nm)*m)<K),
                                   0, nm+1)
                                if((nr*pareto$Sj_right+pareto$Si+nl*pareto$Sj_left+nm*m<K) & (nr+nl+nm+1<num_of_firms)){
                                  nr <- ifelse(pareto$Sj_right==0,
                                             floor((K - pareto$Si - nl*pareto$Sj_left - nm*m)/1),
                                            floor((K - pareto$Si - nl*pareto$Sj_left - nm*m)/pareto$Sj_right))
                                    if((nr*pareto$Sj_right+pareto$Si+nl*pareto$Sj_left+nm*m< K) & (nr+nl+nm+1<num_of_firms)){
                                      nl <- num_of_firms-nr-nm-1
                                    }
                                }}
                        }

          # print result
            if(m == "None" & pareto$Sj_left==pareto$Sj_right){
                       cat("Pareto Optimality is reached when: Si = ",
                          pareto$Si, " with vi(Si, S_i) = ",
                          pareto$Si_Payoff, ", if ", pareto$Scenario,
                          " & ", "Sj = ", pareto$Sj_left,
                          " , with payoff vj(Sj, Si) = ",
                          pareto$Sj_Payoff_left, ". With ",
                          nl, ifelse(nl==1, "other firm ", "other firms "), "choosing ",
                          pareto$Sj_left," and viceversa.\n")
                       cat("\n")
                       cat("That is: \n")
                       if(pareto$Sj_left==pareto$Si){
                              cat(nl+1, " firms choose ", pareto$Sj_left, " units", ", each with a payoff of ", pareto$Sj_Payoff_left,".\n")
                       } else {
                              cat(nl, "firms choose ", pareto$Sj_left, " units, with a payoff of ", pareto$Sj_Payoff_left, ". \n", "1 firm chooses ", pareto$Si, " units, with a payoff of ", pareto$Si_Payoff, ". \n")
                       }
            } else if (m == "None" & pareto$Sj_left!=pareto$Sj_right){
                cat("Pareto Optimality is reached when: Si = ",
                          pareto$Si, " with vi(Si, S_i) = ",
                          pareto$Si_Payoff, ", if ", pareto$Scenario,
                          " & ", "Sj = [", pareto$Sj_left, " , ", pareto$Sj_right,
                          " ], with payoff vj(Sj, Si) = [ ",
                          pareto$Sj_Payoff_left, " , ",
                          pareto$Sj_Payoff_right," ]. With ",
                          nl, ifelse(nl==1, "other firm choosing", "other firms choosing"),
                          pareto$Sj_left, " and ", nr ,
                          ifelse(nr==1, "other firm choosing", "other firms choosing"),
                          pareto$Sj_right," and viceversa.\n")
                       cat("\n")
                       cat("That is: \n")
                         if((pareto$Sj_left==pareto$Si) | (pareto$Sj_left==pareto$Si)){
                                cat(ifelse(pareto$Sj_left==pareto$Si, nl+1, nl), " firms choose ", pareto$Sj_left, " units", ", with a payoff of ", pareto$Sj_Payoff_left,
                                    ". \n", ifelse(pareto$Sj_left==pareto$Si, nr, nr+1), "firms choose ", pareto$Sj_right, " units, with a payoff of ", pareto$Sj_Payoff_right,
                                    ". \n")
                         } else {
                                cat(nl, "firms choose ", pareto$Sj_left, " units, with a payoff of ", pareto$Sj_Payoff_left,
                                    ". \n", "1 firm chooses ", pareto$Si, " units, with a payoff of ", pareto$Si_Payoff,
                                    ". \n", nr, "firms choose", pareto$Sj_right, "units, with a payoff of ", pareto$Sj_Payoff_right,
                                    ". \n")
                         }
            } else {
                        cat("Pareto Optimality is reached when: Si = ",
                          pareto$Si, " with vi(Si, S_i) = ",
                          pareto$Si_Payoff, ", if ", pareto$Scenario,
                          " & ", "Sj = [", pareto$Sj_left, " , ",
                          pareto$Sj_right, " ], with payoff vj(Sj, Si) = [",
                          pareto$Sj_Payoff_left, " , ",
                          pareto$Sj_Payoff_right, "]. With ",
                          nr, ifelse(nr==1, "other firm ", "other firms "), "choosing ",  pareto$Sj_right,
                          "; ", nm, ifelse(nm==1, "other firm choosing", "other firms choosing"), m,
                          ", and ", nl, ifelse(nl==1, "other firm", "other firms"),
                          " choosing", pareto$Sj_Payoff_left,", and viceversa.\n")
                          cat("\n")
                          cat("That is: \n")
                          if((pareto$Sj_left==pareto$Si) | (pareto$Sj_left==pareto$Si)){
                                cat(ifelse(pareto$Sj_left==pareto$Si, nl+1, nl), " firms choose ", pareto$Sj_left, " units", ", with a payoff of ", pareto$Sj_Payoff_left,
                                    ". \n", nm, " firms choose ", m, " units,  with a payoff of ", 0,
                                    ". \n", ifelse(pareto$Sj_left==pareto$Si, nr, nr+1), "firms choose ", pareto$Sj_right, " units, with a payoff of ", pareto$Sj_Payoff_right,
                                    ". \n")
                         } else {
                                cat(ifelse(pareto$Sj_left==pareto$Si, nl+1, nl), "firms choose ", pareto$Sj_left, " units, with a payoff of ", pareto$Sj_Payoff_left,
                                    ". \n", nm, " firms choose ", m, " units,  with a payoff of ", 0,
                                    ". \n", ifelse(pareto$Sj_left==pareto$Si, nr, nr+1), "firms choose", pareto$Sj_right, "units, with a payoff of ", pareto$Sj_Payoff_right,
                                    ". \n")
                         }
            }
}

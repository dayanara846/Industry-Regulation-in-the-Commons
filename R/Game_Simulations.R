#' Game Simulations
#'
#' @param num_simulations Maximum amount of players you want to visualize in the simulations -- the simulations start at 2. For example, if 6, then it will return the structure of the game for 2 players, later it will print the structure of the game for 3 players, later for 4 players and so on until it finishes by printing the structure of the game for 6 players.
#' @param best_resp If "Yes", returns payoffs for Player i, for each of their strategies. If "No", it will print a phrase summarising the best responses and payoffs of Player i.
#' @param pareto If "Yes", returns the pareto equilibrium strategies. Default is "Yes".
#' @param NE If "Yes", returns Nash Equilibrium strategies. Default is "Yes"
#'
#' @return Game structure for different number of players.
#' @export
#'
#' @examples game_simulations(6)
game_simulations <- function(num_simulations, best_resp="Yes", pareto="Yes", NE="Yes"){
  for (i in 2:num_simulations) {
    if(best_resp=="Yes" & pareto == "No"){
      cat("Game of ", i, " firms:")
      cat("\n")
      print(game_payoffs(num_of_firms=i, best_resp=best_resp))
      cat("\n")
    } else if (best_resp=="Yes" & pareto == "Yes" & NE=="Yes") {
      cat("Game of ", i, " firms:")
      cat("\n")
      print(game_payoffs(num_of_firms=i, best_resp=best_resp))
      cat("\n")
      cat("---- Pareto Equilibrium --- ")
      cat("\n")
      game_pareto(num_of_firms=i)
      cat("\n")
      cat("---- Nash Equilibrium --- ")
      cat("\n")
      game_NE(num_of_firms=i)
      cat("\n")
      cat("-------------------------------------------------------\n")
      cat("\n")
      cat("\n")
    } else {
    game_payoffs(num_of_firms=i, best_resp=best_resp)
    }
  }
}

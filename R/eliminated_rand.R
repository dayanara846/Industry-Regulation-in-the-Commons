#' Title Determine the players that will be eliminated
#'
#' @param num_players Number of players participating in the game
#'
#' @return list of players eliminated
#' @export
#'
#' @examples elimination_rand(num_players = 12)
elimination_rand <- function(num_players){
  players <- sample(1:num_players, num_players)
  eliminated <- sample(players, num_players/2)
  cat("In this game with ", num_players, " total players, we will eliminate the following players: ", eliminated)

}

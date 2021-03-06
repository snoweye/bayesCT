#' @title Analysis wrapper function
#'
#' @description Wrapper function to analyze bayesian trials.
#'
#' @param input list. Input function for all the analysis.
#' @param type character. Type of analysis to be ran (binomial (default),
#'   normal. etc.).
#' @param .data NULL. stores the all the details, please do not fill it in.
#'
#' @return a list with results of the analysis of bayesian trial.
#'
#' \describe{
#'   \item{\code{prob_of_accepting_alternative}}{
#'     scalar. The input parameter of probability of accepting the alternative.}
#'   \item{\code{margin}}{
#'     scalar. The margin input value of difference between mean estimate of treatment
#'      and mean estimate of the control.}
#'   \item{\code{alternative}}{
#'     character. The input parameter of alternative hypothesis. }
#'   \item{\code{N_treatment}}{
#'     scalar. The number of patients enrolled in the experimental group for
#'     each simulation.}
#'   \item{\code{N_control}}{
#'     scalar. The number of patients enrolled in the control group for
#'     each simulation.}
#'   \item{\code{N_enrolled}}{
#'     vector. The number of patients enrolled in the trial (sum of control
#'     and experimental group for each simulation. )}
#'   \item{\code{N_complete}}{
#'     scalar. The number of patients who completed the trial and had no
#'     loss to follow-up.}
#'   \item{\code{post_prob_accept_alternative}}{
#'     vector. The final probability of accepting the alternative
#'     hypothesis after the analysis is done.}
#'   \item{\code{est_final}}{
#'     scalar. The final estimate of the difference in posterior estimate of
#'     treatment and posterior estimate of the control group.}
#'   \item{\code{stop_futility}}{
#'     scalar. Did the trial stop for futility during imputation of patient
#'     who had loss to follow up? 1 for yes and 0 for no.}
#'   \item{\code{stop_expected_success}}{
#'     scalar. Did the trial stop for early success during imputation of patient
#'     who had loss to follow up? 1 for yes and 0 for no.}
#'
#' }
#'
#' @importFrom stats rbinom glm rnorm lm
#' @importFrom dplyr mutate filter group_by bind_rows select n
#' @importFrom bayesDP bdpbinomial bdpnormal
#'
#' @export analysis
#'

analysis <- function(input, type = "binomial", .data = NULL){
  if(type == "binomial"){
    do.call(binomial_analysis, input)
  }

  else if(type == "normal"){
    do.call(normal_analysis, input)
  }

}

#' Is the input the empty model?
#'
#' Checks to see if the input is the empty model.
#'
#' @param x Input to check.
#' @param .xname Not intended to be used directly.
#' @param severity How severe should the consequences of the assertion be?  
#' Either \code{"stop"}, \code{"warning"}, \code{"message"}, or \code{"none"}.
#' @return \code{is_[non_]empty_model} returns \code{TRUE} if the input is an  
#' [non] empty model.  (\code{has_terms} is used to determine that a variable 
#' is a model object.)  The model is considered empty if there are no
#' factors and no intercept. The \code{assert_*} functions return nothing 
#' but throw an error if the corresponding \code{is_*} function returns
#' \code{FALSE}.
#' @seealso \code{\link[stats]{is.empty.model}} and \code{is_empty}.
#' @examples
#' # empty models have no intercept and no factors
#' an_empty_model <- lm(uptake ~ 0, CO2)
#' is_empty_model(an_empty_model)
#' 
#' a_model_with_an_intercept <- lm(uptake ~ 1, CO2)
#' a_model_with_factors <- lm(uptake ~ conc * Type, CO2)
#' is_non_empty_model(a_model_with_an_intercept)
#' is_non_empty_model(a_model_with_factors)
#' 
#' assertive.base::dont_stop(assert_is_empty_model(a_model_with_factors))
#' @importFrom stats terms
#' @export
is_empty_model <- function(x, .xname = get_name_in_parent(x))
{
  if(!has_terms(x)) 
  {
    return(
      false(
        gettext("%s has no terms; is probably not a model."), 
        .xname
      )
    )
  }
  tt <- terms(x)
  factors <- attr(tt, "factors")
  if(length(factors) != 0L) 
  {
    return(
      false(
        ngettext(
          length(factors),
          "%s has factor %s.",
          "%s has factors %s."
        ), 
        .xname, 
        toString(colnames(factors))
      )
    )
  }
  if(attr(tt, "intercept") != 0L) 
  {
    return(false(gettext("%s has an intercept."), .xname))
  }
  TRUE
}

#' @rdname is_empty_model
#' @importFrom stats terms
#' @export
is_non_empty_model <- function(x, .xname = get_name_in_parent(x))
{
  if(!has_terms(x)) 
  {
    return(
      false(
        gettext("%s has no terms; is probably not a model."), 
        .xname
      )
    )
  }
  tt <- terms(x)
  if(length(attr(tt, "factors")) == 0L && attr(tt, "intercept") == 0L)  
  {
    return(false(gettext("%s is an empty model."), .xname))
  }
  TRUE
}

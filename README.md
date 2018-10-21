[![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![Is the package on CRAN?](http://www.r-pkg.org/badges/version/assertive.models)](http://www.r-pkg.org/pkg/assertive.models)
[![SemaphoreCI Build Status](https://semaphoreci.com/api/v1/projects/d11cfca6-463e-49aa-8efa-2c84c91c83f0/635137/badge.svg)](https://semaphoreci.com/richierocks/assertive-models)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/64d6meb0b89eh1de?svg=true)](https://ci.appveyor.com/project/richierocks/assertive-models)
[![Research software impact](http://depsy.org/api/package/cran/assertive.models/badge.svg)](http://depsy.org/package/r/assertive.models)

# assertive.models

A set of predicates and assertions for checking the properties of models.  Most of the documentation is on the *[assertive](https://bitbucket.org/richierocks/assertive)* page.  End-users will usually want to use *assertive* directly.


### Installation

To install the stable version, type:

```{r}
install.packages("assertive.models")
```

To install the development version, you first need the *devtools* package.

```{r}
install.packages("devtools")
```

Then you can install the *assertive.models* package using

```{r}
library(devtools)
install_bitbucket("richierocks/assertive.models")
```

### Predicates

`has_terms` checks whether or not an object has a `terms` attribute or 
component.

`is_empty_model` and `is_non_empty_model` check whether a model is empty or not.

### Assertions

Predicates all return a single logical value and have one corresponding assertion.
For example, `has_terms` has `assert_has_terms`.
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

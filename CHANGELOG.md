## 0.1.2

* updated dependencies to make gem work with color gem version 1.5.x

## 0.1.1

* rails 4 compatibility

## 0.1.0

* Refactoring of `ColorVariableParser` to be closer to Sass
* Now all color variables that can be successfully resolved to a `Sass::Script::Color` are supported:
  * Sass color functions (e.g. `lighten(#00f, 20%)`, `darken()`, `saturate()`)
  * RGBA colors (e.g. `rgba(255, 255, 255, 0.5`)
  * and more

## 0.0.6

* added rudimentary support for color variables with values generated by Sass color functions, e.g. `$color: shade($other-color, 10%)`
* more tests

## 0.0.5

* finished up renaming to "smurfville"

## 0.0.4

* renamed gem again, this time to "smurfville", because "smurf-rails" might give the impression that this is extension of the other "smurf" gem

## 0.0.3

* renamed gem to "smurf-rails" because there already is a gem called "smurf"

## 0.0.2

* added variable usage counts for color variables

## 0.0.1

* initial release
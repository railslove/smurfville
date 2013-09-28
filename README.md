Smurfville
=========

Smurfville is the home of SMURF:  **S**calable, **M**odular, re**U**sable **R**ails **F**rontends

SMURF is a new and modular approach to Rails frontend development based on the [SMACSS](http://smacss.com) approach for CSS.  It is mainly comprised of 2 parts:

1. [SMURF Philosopy](#smurf-philosophy) describing a modular approach an establishing coding conventions
2. [Smurfville Gem](#smurfville-gem) aid in following the SMURF conventions by rendering a nice "living styleguide"

[SMURF presentation from ArrrrCamp 2012](http://smurf-presentation.herokuapp.com/)

![SMURF](https://github.com/railslove/smurfville/raw/master/app/assets/images/smurfville/smurf.png)

[![Build Status](https://secure.travis-ci.org/railslove/smurfville.png?branch=master)](http://travis-ci.org/railslove/smurfville)



# SMURF Philosophy

The name and the philosophy of SMURF are heavily influenced by the [SMACSS](http://smacss.com) approach by Jonathan Snook ([@snookca](https://twitter.com/snookca)) which stands for Scalable Modular Architecture for CSS.

These are the main goals behind SMURF:

## Goal 1:  Conventions

Analogous to what [SMACSS](http://smacss.com) does for modular CSS we want to establish conventions for naming, structure, and filenames of all modular frontend code.  There should be a specific partial, helper or similar for each frontend module and it should be immediately clear how it needs to be named and where the files should be put.

This goal is achieved when it is completely clear where all the necessary parts of a frontend module are located.


## Goal 2:  Living Styleguide

Based on the conventions from Goal 1 we are creating tools that parse our Rails projects and render anything that makes sense into a living styleguide. This would include an overview of all the modules with their different submodules and states and hopefully also some JS interactions. The two goals behind this would be **a)** to have a tool for something like **"visual unit testing"** and **b)** to have a **communication device** for any kind of **design work** within a project.

As a first step, our SMURF gem can already render a living styleguide of all the color variables in your Sass code.

An example for a similar tool could be [kss-rails](https://github.com/dewski/kss-rails)

----

There is also a 3rd goal about [in-browser module development](https://github.com/railslove/smurfville/wiki/Goal-3:-in-browser-module-development), but that is still some way ahead in the future.


# Smurfville Gem

## Status

The gem is currently able to parse your Sass files and display all the used color variables (e.g. `$primary-color`) in a nice styleguide.

Future goals include extracting typography information and rendering SMURF modules.

## Prerequisites

* Rails >3.1
* Sass
* Haml
* Color gem

## Installation

Add this to your `Gemfile`, run `bundle install`:

    gem 'smurfville'
    
Add an initializer to your Rails project in which you tell Smurfville where it can find your Sass files:

    # config/initializers/smurfville.rb

    if defined?(Smurfville)
      Smurfville.sass_directory = Rails.root.join('app', 'assets', 'stylesheets').to_s
    end
    
Mount the `Smurfville::Engine` in your routes:

    # config/routes.rb

    if defined?(Smurfville)
      mount Smurfville::Engine => "/smurfville"
    end
    
Restart your server and you should be able to access the SMURF pages, e.g. `yourapp.com/smurfville/colors`

## Screenshot

Here is a screenshot of how a very simple living color styleguide will look like:

![Smurfville screenshot](https://raw.github.com/wiki/railslove/smurfville/images/smurfville_styleguide_screenshot.png)


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/railslove/smurfville/trend.png)](https://bitdeli.com/free "Bitdeli Badge")


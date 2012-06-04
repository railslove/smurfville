SMURF
=====

**S**calable, **M**odular, re**U**sable **R**ails **F**rontends

![SMURF](https://github.com/railslove/smurf/raw/master/app/assets/images/smurf/smurf.png)

[![Build Status](https://secure.travis-ci.org/railslove/smurf.png?branch=master)](http://travis-ci.org/railslove/smurf)

The name and the philosophy of SMURF are heavily influenced by the [SMACSS](http://smacss.com) approach by Jonathan Snook ([@snookca](https://twitter.com/snookca)) which stands for Scalable Modular Architecture for CSS.


# SMURF Philosophy

These are the main goals behind SMURF:

## Goal 1:  Conventions

Analog to what [SMACSS](http://smacss.com) does for modular CSS we want to establish conventions for naming, structure, filenames of all modular frontend code.  There should be a specific partial, helper or similar for each frontend module and it should be immediately clear how it needs to be named and where the files should be put.

This goal is achieved when it is completely clear where all the necessary parts of a frontend modul are located.


## Goal 2:  Living Styleguide

Based on the conventions from Goal 1 we are creating tools that parse our Rails projects and render anything that makes sense into a living styleguide.  This would include an overview of all the modules with their different submodules and states and hopefully also some JS interactions.  The two goals behind this would be **a)** to have a tool for something like **"visual unit testing"** and **b)** to have a **communication device** for any kind of **design work** within a project.

As a first step our SMURF gem can already render a living stylguide of all the color variables in your Sass code.

An example for a similar tool could be [kss-rails](https://github.com/dewski/kss-rails)

## Goal 3: Developing modules in the browser

Once we have a tool to easily render all our modules the next step is to add the ability to write/change/tweak them right within the browser.  This would have the advantage that you could open the module editor in different browsers to directly account for x-browser differences and you don't have to hit reload again to see the effect of your changes to the frontend code.  One could see it as an equivalent for vim+tmux+autotest for frontend development.

(technology ideas: [voyage-editor](http://voyage-editor.herokuapp.com/), [cloud9](http://c9.io), [fivetastic](https://github.com/makevoid/fivetastic))


# SMURF Gem

Currently the gem can parse your Sass files and display all the color variables your are using in a nice styleguide.

## Prerequisites

* Rails >3.1
* Sass
* Haml

## Installation

Add this to your `Gemfile`, run `bundle install`:

    gem 'smurf-rails'
    
Add an initializer to your Rails project in which you tell SMURF where it can find your Sass files:

    # config/initializers/smurf.rb
    Smurf.sass_directory = Rails.root.join('app', 'assets', 'stylesheets').to_s
    
Mount the SMURF gem in your routes:

    # config/routes.rb
    
    mount Smurf::Engine => "/smurf"
    
Restart your server and you should be able to access the SMURF pages, e.g. `yourapp.com/smurf/styleguide/colors`


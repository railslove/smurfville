SMURF
=====

**S**calable, **M**odular, re**U**sable **R**ails **F**rontends

[![Build Status](https://secure.travis-ci.org/railslove/smurf.png?branch=master)](http://travis-ci.org/railslove/smurf)

The name and the philosophy of SMURF are heavily influenced by the [SMACSS](http://smacss.com) approach by Jonathan Snook ([@snookca](https://twitter.com/snookca)) which stands for Scalable Modular Architecture for CSS.


# SMURF gem

Currently the gem can parse your Sass files and display all the color variables your are using in a nice styleguide.

## Prerequisites

* Rails >3.1
* Sass
* Haml

## Installation

Add this to your `Gemfile`, run `bundle install`:

    gem 'smurf'
    
Add an initializer to your Rails project in which you tell SMURF where it can find your Sass files:

    # config/initializers/smurf.rb
    Smurf.sass_directory = Rails.root.join('app', 'assets', 'stylesheets').to_s
    
Mount the SMURF gem in your routes:

    # config/routes.rb
    
    mount Smurf::Engine => "/smurf"
    
Restart your server and you should be able to access the SMURF pages, e.g. `yourapp.com/smurf/styleguide/colors`


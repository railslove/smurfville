SMURF
=====

*S*calable, *M*odular, re*U*sable *R*ails *F*rontends

[![Build Status](https://secure.travis-ci.org/railslove/smurf.png?branch=master)](http://travis-ci.org/railslove/smurf)

The name and the philosophy of SMURF are heavily influenced by the SMACSS approach by Jonathan Snook (@snookca) (Scalable Modular Architecture for CSS)


# SMURF gem

## Prerequisites

* Rails >3.1
* Sass
* Haml

## Installation

Add this to your Gemfile and restart your sever:

    gem 'smurf'
    
Add an initializer to your Rails project in which you tell SMURF where it can find your Sass files:

    # config/initializers/smurf.rb
    Smurf.sass_directory = Rails.root.join('app', 'assets', 'stylesheets').to_s
    
Mount the SMURF gem in your routes:

    # config/routes.rb
    
    mount Smurf::Engine => "/smurf"
    
Afterwards you should be able to access the SMURF pages, e.g. `yourapp.com/smurf/styleguide/colors`


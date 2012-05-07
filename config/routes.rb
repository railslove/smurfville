Smurf::Engine.routes.draw do
  root :to => "styleguide#colors"

  match "styleguide/colors" => "styleguide#colors"
end

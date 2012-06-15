Smurfville::Engine.routes.draw do
  root :to => "styleguide#colors"

  match "styleguide/colors" => "styleguide#colors"
  match "styleguide/typography" => "styleguide#typography"
end

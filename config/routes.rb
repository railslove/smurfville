Smurfville::Engine.routes.draw do
  root :to => "styleguide#colors"

  match "/colors" => "styleguide#colors"
  match "/typography" => "styleguide#typography"
  match "/modules" => "styleguide#modules"
end

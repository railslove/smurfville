Smurfville::Engine.routes.draw do
  root :to => "styleguide#colors"

  get "/colors" => "styleguide#colors"
  get "/typography" => "styleguide#typography"
end

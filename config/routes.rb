Rails.application.routes.draw do
  get "/contacts" => "contacts#index"
  get "/contacts/:id" => "contacts#show"
  post "/contacts/:id" => "contacts#create"
  patch "contacts/:id" => "contacts#update"
  delete "contacts/:id" => "contacts#destroy"
end

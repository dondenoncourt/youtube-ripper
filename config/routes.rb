Rails.application.routes.draw do
  resources :ripper
  post '/ripper/:id', to: 'ripper#create'
end

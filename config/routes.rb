Rails.application.routes.draw do
  resources :ripper
  post '/ripper/:youtube_id/:bucket_name', to: 'ripper#create'
end

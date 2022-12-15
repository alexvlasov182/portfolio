Rails.application.routes.draw do
  resources :portfolios
  resources :blogs

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
end

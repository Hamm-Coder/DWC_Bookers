Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # homesコントローラーのtopアクションをルートとして設定
  root 'homes#top'
  resources :books
end
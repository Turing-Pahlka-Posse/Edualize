Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get "median_expenditures/totals", to: "median_expenditures/totals#index"
    end
  end
  
  root "docs#index"

end

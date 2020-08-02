Rails.application.routes.draw do
  get 'home/index'
  get 'bring/index'
  get "/locations/csv_import", to: 'locations#csv_import', as: 'csv_import'
  resources :locations do 
    collection do 
      post :import 
    end
  end
  resources :import do 
    collection do 
      post :import_csv 
    end
  end
  get 'import/index'

  root "home#index"
  
end

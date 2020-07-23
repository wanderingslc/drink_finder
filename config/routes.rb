Rails.application.routes.draw do
  get "/locations/csv_import", to: 'locations#csv_import', as: 'csv_import'
  resources :locations do 
    collection do 
      post :import 
    end
  end

  root "locations#index"
  
end

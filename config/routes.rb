Mimascota::Application.routes.draw do  

  get "cargador/ejemploJson"
  get "cargador/testSubirPerroBuscado"
  post "cargador/subirPerroBuscado"

  resources :lost_dog, :noticia, :wanted_dog, :adoption_dog

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the  root of your site routed with "root"
  root to: 'welcome#index'

  get 'observador/obtenerCoincidencias/:id' => 'observador#obtenerCoincidencias'
  get 'observador/perrosEncontrados'
  get 'observador/perrosPerdidos'
  get 'observador/perrosBuscados'
  get 'observador/usuarios'
  get 'observador/loginCelular'
  post 'observador/loginCelular'
  get 'observador/http_authenticate'

  get 'welcome/lost_dogs_json' => 'welcome#lost_dogs_json'
  get 'welcome/wanted_dogs_json' => 'welcome#wanted_dogs_json'
  get 'welcome/adopt_dogs_json' => 'welcome#adopt_dogs_json'
  get 'welcome/found_dogs_json' => 'welcome#found_dogs_json'

  get 'lost_dog/description/:id' => 'lost_dog#description'
  get 'wanted_dog/description/:id' => 'wanted_dog#description'
  get 'adopton_dog/description/:id' => 'adopton_dog#description'
  get 'found_dog/description/:id' => 'found_dog#description'

  post 'lost_dog/new' => 'lost_dog#create'
  post 'wanted_dog/new' => 'wanted_dog#create'
  post 'adoption_dog/new' => 'adoption_dog#create'  
  get 'users/show/:id', to: 'users#show', as: 'user_show'
  get 'users/mi_mascota', to: 'users#my_pet', as: 'user_my_pet'
  get 'users/mis_posibles_macotas', to: 'users#my_possibles', as: 'user_my_possibles'
  resources :found_dog
  
  devise_for :users, :controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'devise_overrides/registrations'
  }

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

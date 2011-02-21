Profile::Application.routes.draw do


  resources :projects do
    resources :pages do
      resources :sections
    end
  end

  root :to => "projects#index"
end

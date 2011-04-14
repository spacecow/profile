# -*- coding: utf-8 -*-
Profile::Application.routes.draw do
  resources :settings

  match 'user/edit' => 'users#edit', :as => :edit_current_user
  match 'signup' => 'users#new', :as => :signup
  match 'logout' => 'sessions#destroy', :as => :logout
  match 'login' => 'sessions#new', :as => :login
  match 'toggle_language' => 'application#toggle_language', :as => :toggle_language
  match 'welcome' => 'projects#index'

  match '~koji', :controller => "pages", :action => "show", :project_id => "~koji", :id => "プロフィール"
  match '~koji/mizuno.html', :controller => "pages", :action => "show", :project_id => "~koji", :id => "プロフィール"
  match '~koji(/:controller(/:id(/:action)))', :project_id => "~koji", :action => "show"

  resources :sessions
  resources :users do
    member do
      get 'edit_roles'
      put 'update_roles'
    end
  end

  resources :projects do
    resources :pages do
      resources :sections
    end
    resources :pictures, :only => :destroy
    resources :papers, :only => [:password,:download,:destroy] do
      member do
        get 'password'
        post 'download'
      end
    end
  end

  root :to => "projects#index"
end

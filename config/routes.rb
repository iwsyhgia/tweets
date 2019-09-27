# frozen_string_literal: true
Rails.application.routes.draw do
  resources :tweets, only: [:create, :index]
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new', as: :new_user_session
    delete 'sign_out', to: 'users/sessions#destroy', as: :destroy_user_session
  end

  root to: 'tweets#index'
end

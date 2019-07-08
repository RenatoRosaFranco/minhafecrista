# frozen_string_literal: true
Rails.application.routes.draw do

  # Authentication
  # @implemented
  devise_for :users

  # Administration
  # @implemented
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # Application
  # @implemented
  root to: 'posts#index'
  resources :posts, only: [:index, :show]
end

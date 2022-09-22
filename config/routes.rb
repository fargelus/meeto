# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new', as: 'sign_up'
  post 'sessions/register', as: 'register'

  get 'sessions/sign_in', as: 'sign_in'
  post 'sessions/authorize', as: 'authorize'
  root 'sessions#welcome'

  resources :meetings
end

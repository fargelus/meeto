# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new', as: 'sign_up'
  post 'sessions/register', as: 'register'
  get 'sessions/welcome', as: 'welcome'

  get 'sessions/sign_in', as: 'sign_in'
  post 'sessions/authorize', as: 'authorize'
  get 'sessions/destroy', as: 'logout'
end

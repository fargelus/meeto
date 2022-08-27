# frozen_string_literal: true

Rails.application.routes.draw do
  root 'meetings#index'

  resources :meetings
end

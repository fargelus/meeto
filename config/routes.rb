# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:sessions)

  root to: "meetings#index"
  resources :meetings
end

# frozen_string_literal: true

Rails.application.routes.draw do
  draw(:sessions)

  resources :meetings
end

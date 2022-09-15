# frozen_string_literal: true

class Account < ApplicationRecord
  authenticates_with_sorcery!

  MIN_PASSWORD_LENGTH = 6
  validates :password, presence: true, length: { minimum: MIN_PASSWORD_LENGTH }, confirmation: true
  validates :password_confirmation, presence: true
  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP }
end

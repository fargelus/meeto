# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @account = Account.new
  end

  def register
    account = Account.new(*account_params)
    return redirect_to sign_up_path, notice: t('account_not_created') unless account.valid?

    account.save
    auto_login(account)
    redirect_to meetings_path
  end

  def sign_in; end

  def authorize
    email = account_params[:email]
    password = account_params[:password]
    return redirect_to meetings_path if login(email, password)

    redirect_to sign_in_path, notice: t('account_not_exist')
  end

  def welcome; end

  def destroy
    logout
    redirect_to welcome_path
  end

  private

  def account_params
    params.require(:account).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end

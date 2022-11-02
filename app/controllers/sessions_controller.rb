# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    @user = User.new
  end

  def register
    user = User.new(*user_params)
    return redirect_to sign_up_path, notice: t("user_not_created") unless user.valid?

    user.save
    auto_login(user)
    redirect_to meetings_path
  end

  def sign_in
  end

  def authorize
    email = user_params[:email]
    password = user_params[:password]
    return redirect_to meetings_path if login(email, password)

    redirect_to sign_in_path, notice: t("user_not_exist")
  end

  def welcome
  end

  def destroy
    logout
    redirect_to welcome_path
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :password_confirmation
    )
  end
end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def not_authenticated
    redirect_to sign_in_path, notice: t("should_login_first")
  end
end

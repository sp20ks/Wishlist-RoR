# frozen_string_literal: true

# class of controller
class ApplicationController < ActionController::Base
  private

  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def autorize
    return if user_signed_in?

    flash[:warning] = 'Вы не вошли в систему'
    redirect_to home_path
  end

  def no_autorize
    return unless user_signed_in?

    flash[:warning] = 'Вы уже вошли в систему'
  end

  helper_method :current_user, :user_signed_in?
end
  
# frozen_string_literal: true

# class of controller
class ApplicationController < ActionController::Base
  around_action :switch_locale

  private

  def switch_locale(&action)
    locale = checked_locale || I18n.default_locale
    I18n.with_locale locale, &action
  end

  def checked_locale
    locale = params[:locale]

    return locale if I18n.available_locales.map(&:to_s).include?(locale)
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def autorize
    return if user_signed_in?

    flash[:warning] = t('application.autorize.msg_auth')
    redirect_to home_path
  end

  def no_autorize
    return unless user_signed_in?

    flash[:warning] = t('application.no_autorize.msg_no_auth')
    redirect_to wishlist_path(current_user.id)
  end

  helper_method :current_user, :user_signed_in?
end

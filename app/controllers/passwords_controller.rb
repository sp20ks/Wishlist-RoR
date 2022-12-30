# frozen_string_literal: true

# controller
class PasswordsController < ApplicationController
  before_action :no_autorize
  def index; end

  def new_password; end

  def forgot
    user = User.find_by login: params[:login]
    if user.present? && user.email_confirmed
      user.generate_password_token!
      PasswordMailer.forgot_password(user).deliver
      redirect_to password_index_path, notice: t('.email_send')
    else
      redirect_to home_path, notice: t('.email_err')
    end
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def reset
    if user_signed_in?
      if user.reset_password!(params[:password],
                              params[:password_confirmation]) then redirect_to info_about_user_path,
                                                                               notice: t('.msg_success')
      else
        redirect_to password_new_password_path, notice: user.errors.full_messages.split.join('. ')
      end
    else
      user = User.find_by_reset_password_token(params[:token])
      return unless user.present?

      if user.reset_password!(params[:password],
                              params[:password_confirmation]) then redirect_to home_path, notice: t('.msg_success')
      else
        redirect_to password_new_password_path(params[:token]), notice: user.errors.full_messages.split.join('. ')
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end

class PasswordsController < ApplicationController
  def index; end

  def new_password; end

  def forgot
    user = User.find_by login: params[:login]
    if user.present? && user.email_confirmed
      user.generate_password_token!
      PasswordMailer.forgot_password(user).deliver
      redirect_to '/password/index', notice: 'На указанную при регистрации почту выслано письмо'
    else
      redirect_to home_path, notice: 'Не существует аккаутна с таким логином'
    end
  end

  def reset
    user = User.find_by_reset_password_token(params[:token])
    return unless user.present?

    if user.reset_password!(params[:password], params[:password_confirmation])
      redirect_to home_path, notice: 'Пароль успешно изменен'
    else
    redirect_to '/password/new_password?id=' + params[:token], notice: user.errors.full_messages.split.join(' и ')
    end
  end
end

class PasswordMailer < ApplicationMailer
  def forgot_password(user)
    @user = user
    mail to: @user.email, subject: 'Сброс пароля'
  end
end

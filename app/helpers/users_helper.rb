module UsersHelper
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password_digest, :l_name, :f_name, :login)
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = 'Добро пожаловать! Вы успешно зарегистрированы. Войдите, чтобы продолжить'
      redirect_to home_path
    else
      flash[:error] = 'Извините. Пользователь с такой почтой не найден'
      redirect_to new_us_path
    end
  end
end

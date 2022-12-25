module UsersHelper
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:f_name, :l_name, :login, :birth, :email, :password, :password_confirmation)
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = 'Добро пожаловать! Вы успешно зарегистрированы'
      session[:user_id] = user.id
      redirect_to wishlist_path(user.id)
    else
      flash[:error] = 'Извините. Пользователь с таким логином не найден'
      redirect_to new_user_path
    end
  end

  def user_params_update
    params.require(:user).permit(:f_name, :l_name, :login, :birth, :email, :password, :password_confirmation)
  end

end

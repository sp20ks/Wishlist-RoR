# frozen_string_literal: true

# helper
module UsersHelper
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:f_name, :l_name, :login, :birth, :email, :password, :password_confirmation)
  end

  def user_params_update
    params.require(:user).permit(:f_name, :l_name, :login, :birth, :email, :password, :password_confirmation)
  end
end

# frozen_string_literal: true

# class of controller
class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[create]
  before_action :autorize, only: :destroy

  def new; end

  def create
    @user = User.find_by(email: params[:email])
    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Вы успешно вошли'
      redirect_to adding_path
    else
      flash[:notice] = 'Попробуйте еще раз. Некорректный пароль или почта'
    end
  end

  def destroy
    session.delete :user_id
    flash[:success] = 'Приходите еще :)'
    redirect_to home_path
  end
end

# frozen_string_literal: true

# class of controller
class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: :destroy

  def new; end

  def create
    user = User.find_by(login: params[:login])
    if !!user && user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to wishlist_path
      else
        flash[:notice] = 'Подтвердите почту, указанную при регистрации'
      end
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

# frozen_string_literal: true

# controller
class UsersController < ApplicationController
  include UsersHelper
  before_action :autorize, only: %i[edit info_about_user show_by_login] 
  #before_action :set_user, only: %i[destroy]

  def new; end

  def edit; end

  def info_about_user; end

  def create
    @user = User.new(user_params)
    if !@user.save
      flash[:warning] = @user.errors.full_messages.join('. ')
      redirect_to new_user_path
    else
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = t('.send_email')
      redirect_to home_path
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:success] = t('.update_data')
    else
      flash[:notice] = @user.errors.full_messages.join('. ')
    end
    redirect_to info_user_path
  end


  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = t('welcome')
      session[:user_id] = user.id
      redirect_to wishlist_path(user.id)
    else
      flash[:error] = 'Извините. Пользователь с таким логином не найден'
      redirect_to new_user_path
    end
  end


  def destroy
    redirect_to home_path, notice: t('.delete_acc') if User.destroy(current_user.id)
  end

  def show
    @users = User.all
  end

  def show_by_login
    @user = User.find_by login: params[:login]
  end
end

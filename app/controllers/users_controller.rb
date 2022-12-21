# frozen_string_literal: true

# controller
class UsersController < ApplicationController
  include UsersHelper
  #before_action :set_user, only: %i[destroy]

  #def show
   # @users = User.all
  #end

  def new; end

  def edit; end

  def info_about_user; end

  def create
    @user = User.new(user_params)
    if !@user.save
      flash[:warning] = @user.errors.full_messages.join(' и ')
      redirect_to new_us_path
    else
      UserMailer.registration_confirmation(@user).deliver
      flash[:success] = 'На указанную почту выслано письмо. Подтвердите почту, пожалуйста.'
      redirect_to home_path
    end
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Данные были успешно обновлены'
      redirect_to info_user_path
    else
      flash[:warning] = current_user.errors.full_messages.join(' и ')
      redirect_to edit_path
    end
  end

  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end
end

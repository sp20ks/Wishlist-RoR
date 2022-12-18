# frozen_string_literal: true

# controller
class UsersController < ApplicationController
  include UsersHelper
  before_action :set_user, only: %i[edit update destroy]

  def show
    @users = User.all
  end

  def new; end

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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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

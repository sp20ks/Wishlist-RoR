# frozen_string_literal: true

# class of controller
class SessionsController < ApplicationController
  before_action :no_autorize, only: %i[new create]
  before_action :autorize, only: :destroy

  def new; end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def create
    user = User.find_by(login: params[:login])
    if !!user && user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        redirect_to wishlist_path(current_user.id)
      else
        flash[:notice] = t('.confirm_email')
      end
    else
      flash[:notice] = t('.try_again')
      redirect_to home_path
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def destroy
    session.delete :user_id
    flash[:success] = t('.come')
    redirect_to home_path
  end
end

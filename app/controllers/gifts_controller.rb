# frozen_string_literal: true

# controller
class GiftsController < ApplicationController
  before_action :set_gift, only: %i[destroy]
  before_action :set_user, only: %i[show show_with_type]
  before_action :autorize
  include GiftsHelper

  def new; end

  def show
    @gifts = Gift.where user_id: @user.id
  end

  def show_with_type
    @gifts = Gift.where user_id: @user.id, wishlist_type_id: params[:id_type]
  end

  def create
    @gift = Gift.new(gift_params)
    redirect_to wishlist_path(current_user.id)
    flash[:notice] = @gift.errors.full_messages.join(' и ') unless @gift.save
  end

  def set_giver
    @gift = Gift.find(params[:id])
    @gift.update(giver_id: current_user.id)
    redirect_to wishlist_path(@gift.user_id.to_s)
  end

  def remove_giver
    @gift = Gift.find(params[:id])
    @gift.update(giver_id: nil)
    redirect_to wishlist_path(@gift.user_id.to_s)
  end

  def giver_presents
    @gifts = Gift.where(giver_id: current_user.id)
  end

  def destroy
    @gift.destroy
    @gifts = Gift.where user_id: @gift.user_id
  end
end

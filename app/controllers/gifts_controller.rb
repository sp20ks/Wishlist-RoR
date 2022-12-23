# frozen_string_literal: true

# controller
class GiftsController < ApplicationController
  before_action :set_gift, only: %i[destroy]
  include GiftsHelper

  def new; end

  def show
    @gifts = Gift.where user_id: current_user.id
  end

  def create
    @gift = Gift.new(gift_params)
    redirect_to wishlist_path
    flash[:notice] = @gift.errors.full_messages.join(' и ') unless @gift.save
  end

  def destroy
    @gift.destroy
  end
end

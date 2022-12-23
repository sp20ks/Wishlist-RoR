# frozen_string_literal: true

# controller
class GiftsController < ApplicationController
  include GiftsHelper
  def show
  end

  def new; end

  def create
    @gift = Gift.new(gift_params)
    redirect_to wishlist_path
    flash[:notice] = @gift.errors.full_messages.join(' и ') unless @gift.save
  end

  def destroy
  end

  def update
  end
end

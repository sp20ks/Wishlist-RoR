# frozen_string_literal: true

# class of controller
class WishlistTypesController < ApplicationController
  def show
    @types = WishlistType.all
  end

  def create
    @type = WishlistType.new(wishlist_type_params)
    redirect_to wishlist_types_show_path
    flash[:notice] = @gift.errors.full_messages.join('. ') unless @type.save
  end

  def new
  end

  def destroy
    WishlistType.find(params[:id]).destroy
    redirect_to wishlist_types_show_path
  end

  private

  def wishlist_type_params
    params.require(:wishlist_type).permit(:name)
  end
end

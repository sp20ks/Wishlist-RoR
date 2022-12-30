# frozen_string_literal: true

# helper
module GiftsHelper
  def gift_params
    params.require(:gift).permit(:name, :link, :description, :user_id, :giver_id, :wishlist_type_id)
  end

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end

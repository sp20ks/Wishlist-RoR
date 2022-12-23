module GiftsHelper
  def gift_params
    params.require(:gift).permit(:name, :link, :description, :user_id, :giver_id)
  end
end

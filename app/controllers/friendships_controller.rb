# frozen_string_literal: true

# class of controller
class FriendshipsController < ApplicationController
  #before_action :set_friendship, only: %i[destroy]
  include FriendshipsHelper
  def create
    @friendship = Friendship.new do |rec|
      rec.user_id = current_user.id
      rec.friend_id = params[:id]
    end
    if @friendship.save!
      redirect_to '/users/show', notice: 'Запрос отправлен успешно'
    else
      redirect_to '/users/show', notice: @friendship.errors.full_messages.split.join(' и ')
    end
  end

  def destroy
    #Friendship.find_by(id: params[:id]).delete
    Friendship.find_by(user_id: current_user.id, friend_id: params[:id]).delete
  end

  def delete_friendship; end
end

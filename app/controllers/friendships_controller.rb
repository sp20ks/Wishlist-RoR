# frozen_string_literal: true

# class of controller
class FriendshipsController < ApplicationController
  include FriendshipsHelper
  before_action :set_friendship, only: %i[destroy]
  before_action :autorize

  # rubocop:disable Metrics/AbcSize
  def create
    @friendship = Friendship.new do |rec|
      rec.user_id = current_user.id
      rec.friend_id = params[:id]
    end
    if @friendship.save!
      redirect_to users_show_path, notice: t('.msg_request')
    else
      redirect_to users_show_path, notice: @friendship.errors.full_messages.split.join('. ')
    end
  end
  # rubocop:enable Metrics/AbcSize

  def destroy
    @friendship.delete
    redirect_to friendships_out_path
  end

  def accept
    @friendship = Friendship.new do |rec|
      rec.user_id = current_user.id
      rec.friend_id = params[:id]
    end
    if @friendship.save!
      redirect_to friendships_show_path
    else
      redirect_to friendships_show_path, notice: @friendship.errors.full_messages.split.join('. ')
    end
  end

  def in; end

  def out; end

  def delete_friendship; end
end

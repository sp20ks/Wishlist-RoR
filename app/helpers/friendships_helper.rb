module FriendshipsHelper
  def friends?(user1, user2)
    !Friendship.where(user_id: user1, friend_id: user2).empty? && !Friendship.where(user_id: user2, friend_id: user1).empty?
  end

  def request_present?(user1, user2)
    (!Friendship.where(user_id: user1, friend_id: user2).empty? ^ !Friendship.where(user_id: user2, friend_id: user1).empty?)
  end

  def is_users_request?(user1, user2)
    !Friendship.where(user_id: user1, friend_id: user2).empty?
  end

  def id_friendship(user1, user2)
    Friendship.find_by(user_id: user1, friend_id: user2).id
  end

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end

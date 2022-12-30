# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FriendshipsHelper do
  include FriendshipsHelper
  it 'returns true because users in relations' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru',
                            password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru',
                             password: 'Qwerty122', password_confirmation: 'Qwerty122')
    Friendship.create(user_id: test_user.id, friend_id: test_user2.id)
    expect(request_present?(test_user, test_user2)).to eq(true)
  end

  it 'returns false because users is not in relations' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru',
                            password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru',
                             password: 'Qwerty122', password_confirmation: 'Qwerty122')
    expect(request_present?(test_user, test_user2)).to eq(false)
  end

  it 'returns true because user1 send request to user2' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru',
                            password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru',
                             password: 'Qwerty122', password_confirmation: 'Qwerty122')
    Friendship.create(user_id: test_user.id, friend_id: test_user2.id)
    expect(is_users_request?(test_user, test_user2)).to eq(true)
  end

  it 'returns false because user1 send request to user2' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru',
                            password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru',
                             password: 'Qwerty122', password_confirmation: 'Qwerty122')
    Friendship.create(user_id: test_user.id, friend_id: test_user2.id)
    expect(friends?(test_user, test_user2)).to eq(false)
  end

  it 'returns true becausethey are friends' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru',
                            password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru',
                             password: 'Qwerty122', password_confirmation: 'Qwerty122')
    Friendship.create(user_id: test_user.id, friend_id: test_user2.id)
    Friendship.create(user_id: test_user2.id, friend_id: test_user.id)
    expect(friends?(test_user, test_user2)).to eq(true)
  end
end

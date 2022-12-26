require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'successfully create friendship' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru', password: 'Qwerty122', password_confirmation: 'Qwerty122')
    a = Friendship.new(user_id: test_user.id, friend_id: test_user2.id)
    expect(a.save).to eq(true)
  end

  it 'can not create friendship because one friend is nil' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    a = Friendship.new(user_id: test_user.id)
    expect(a.save).to eq(false)
  end

  it 'can not create friendship because one friend is nil' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    a = Friendship.new(friend_id: test_user.id)
    expect(a.save).to eq(false)
  end

  it 'delete friendship if user was deleted' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru', password: 'Qwerty122', password_confirmation: 'Qwerty122')
    Friendship.create(user_id: test_user.id, friend_id: test_user2.id)
    test_user.destroy
    test_user2.destroy
    expect(Friendship.last).to eq(nil)
  end

end

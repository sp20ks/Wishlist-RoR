require 'rails_helper'

RSpec.describe Gift, type: :model do
  it 'successfully create gift' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    wishlist_type = WishlistType.create(name: 'test')
    a = Gift.new(name: 'name', link: 'link', user_id: test_user.id, description: 'desc', wishlist_type_id: wishlist_type.id)
    expect(a.save!).to eq(true)
  end

  it 'can not create gift because of relations with WishlistType and User' do
    a = Gift.new(name: 'name', link: 'link', user_id: 1234, description: 'desc', wishlist_type_id: 1234)
    a.save
    expect(a).to_not be_valid
  end

  it 'successfully delete gift' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    wishlist_type = WishlistType.create(name: 'test')
    a = Gift.create(name: 'name', link: 'link', user_id: test_user.id, description: 'desc', wishlist_type_id: wishlist_type.id)
    a.destroy
    expect(Gift.find_by(name: 'name').nil?).to eq(true)
  end

  it 'successfully add giver gift' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user2 = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login2', email: 'example2_test@ya.ru', password: 'Qwerty122', password_confirmation: 'Qwerty122')
    wishlist_type = WishlistType.create(name: 'test')
    a = Gift.create(name: 'name', link: 'link', user_id: test_user.id, description: 'desc', wishlist_type_id: wishlist_type.id)
    a.update(giver_id: test_user2.id)
    expect(a.giver_id.nil?).to eq(false)
  end

  it 'successfully delete gift when user has been deleted' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    wishlist_type = WishlistType.create(name: 'test')
    a = Gift.create(name: 'name', link: 'link', user_id: test_user.id, description: 'desc', wishlist_type_id: wishlist_type.id)
    test_user.destroy
    expect(Gift.find_by(name: 'name').nil?).to eq(true)
  end

  it 'successfully delete gift when wishlist type has been deleted' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    wishlist_type = WishlistType.create(name: 'test')
    a = Gift.create(name: 'name', link: 'link', user_id: test_user.id, description: 'desc', wishlist_type_id: wishlist_type.id)
    wishlist_type.destroy
    expect(Gift.find_by(name: 'name').nil?).to eq(true)
  end
end

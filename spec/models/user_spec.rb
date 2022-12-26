require 'rails_helper'

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength

RSpec.describe User, type: :model do
  it 'successfully create user' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to be_valid
  end

  it 'successfully create user with false in confirmed_email' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user.email_confirmed).to eq(false)
  end

  it 'successfully delete user' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user.destroy
    expect(User.find_by(f_name: 'Имя').nil?).to eq(true)
  end

  it 'successfully update user' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user.update(f_name: 'Name')
    expect(test_user.f_name).to eq('Name')
  end

  it 'successfully create user with a-z first and last name' do
    test_user = User.create(f_name: 'First', l_name: 'Last', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to be_valid
  end

  it 'can not create user because f_name is not valid' do
    test_user = User.create(f_name: 'Имя1', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because l_name is not valid' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия1', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because email is not valid' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_testya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because login is not unique' do
    User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user = User.create(f_name: 'Name', l_name: 'Last', login: 'login1', email: 'example_test2@ya.ru', password: 'Qwerty123', password_confirmation: 'Qwerty123')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because email is not unique' do
    User.create(f_name: 'Имя', l_name: 'Фамилия', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    test_user = User.create(f_name: 'Name', l_name: 'Last', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerty123', password_confirmation: 'Qwerty123')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because password is weak' do
    test_user = User.create(f_name: 'Name', l_name: 'Last', login: 'login1', email: 'example_test@ya.ru', password: 'qwerty1', password_confirmation: 'qwerty1')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because password confirmation is not match password' do
    test_user = User.create(f_name: 'Name', l_name: 'Last', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerrrry1', password_confirmation: 'qwerty1')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because password should be present' do
    test_user = User.create(f_name: 'Name', l_name: 'Last', login: 'login1', email: 'example_test@ya.ru')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because login should be present' do
    test_user = User.create(f_name: 'Имя', l_name: 'Фамилия', email: 'example_test@ya.ru', password: 'Qwerty12', password_confirmation: 'Qwerty12')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because first name should be present' do
    test_user = User.create(l_name: 'Last', login: 'login1', email: 'example_test@ya.ru', password: 'Qwerrrry1', password_confirmation: 'Qwerrrry1')
    expect(test_user).to_not be_valid
  end

  it 'can not create user because first email should be present' do
    test_user = User.create(f_name: 'Имя', l_name: 'Last', login: 'login1', password: 'Qwerrrry1', password_confirmation: 'Qwerrrry1')
    expect(test_user).to_not be_valid
  end
end
# rubocop:enable Metrics/AbcSize,Metrics/MethodLength

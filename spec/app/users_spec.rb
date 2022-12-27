# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  it 'should visit right url' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000')

    expect(driver.current_url).to eq('http://localhost:3000/')
    driver.quit
  end

  it 'should show message about incorrect login or password' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('test')
    driver.find_element(id: 'pass').send_keys('12345')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Try again. Incorrect password or email')
    driver.quit
  end

  it 'should show message about successful create' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en/users/new')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'name').send_keys('Name')
    driver.find_element(id: 'l_name').send_keys('Last')
    driver.find_element(id: 'email').send_keys('test_exam@ya.ru')
    driver.find_element(id: 'log').send_keys('login_test')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'pass_c').send_keys('Qwerty12')
    driver.find_element(id: 'reg_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('A letter has been sent to the specified email address. Please confirm your email.')
    driver.quit
  end

  it 'should show message about error' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en/users/new')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'reg_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq("Password can't be blank. Login can't be blank. Email is invalid. First name can't be blank. First name is invalid. Last name can't be blank. Last name is invalid. Confirmation password can't be blank. Confirmation password doesn't match Password. Password must have at least uppercase, uppercase letters, a number and have a length of more than 8 characters")
    driver.quit
  end

  it 'should show message about taken email and login' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en/users/new')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'name').send_keys('Name')
    driver.find_element(id: 'l_name').send_keys('Last')
    driver.find_element(id: 'email').send_keys('spas.ksusha@gmail.com')
    driver.find_element(id: 'log').send_keys('ksusha')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'pass_c').send_keys('Qwerty12')
    driver.find_element(id: 'reg_btn').click
    driver.manage.timeouts.implicit_wait = 50

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Login has already been taken. Email has already been taken')
    driver.quit
  end

  it 'should show message about tsuccessful exit' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'exit').click

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('Come again :)')
    driver.quit
  end

  it 'should show message about errors in edit' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'account').click
    driver.manage.timeouts.implicit_wait = 50
    driver.find_element(id: 'edit_link').click
    driver.manage.timeouts.implicit_wait = 50
    driver.find_element(id: 'update_btn').click

    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq("Login can't be blank. First name can't be blank. First name is invalid. Last name can't be blank. Last name is invalid. Confirmation password can't be blank. Confirmation password doesn't match Password. Password must have at least uppercase, uppercase letters, a number and have a length of more than 8 characters")
    driver.quit
  end
end
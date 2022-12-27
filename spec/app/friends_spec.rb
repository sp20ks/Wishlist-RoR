# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  it 'should show all users' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'all_users').click
    driver.manage.timeouts.implicit_wait = 50

    expect(driver.find_element(class: 'card').nil?).to eq(false)
    driver.quit
  end

  it 'should send request' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'all_users').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(class: 'card-link').click
    flash = driver.find_element(id: 'flash').text
    expect(flash).to eq('The request was sent successfully')
    driver.quit
   end

  it 'should cancle request' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'friends_link').click
    driver.manage.timeouts.implicit_wait = 50
    driver.find_element(id: 'friends_link').click

    driver.find_element(id: 'out_link').click
    driver.manage.timeouts.implicit_wait = 50
    driver.find_element(class: 'btn-danger').click
    driver.manage.timeouts.implicit_wait = 50

    expect(driver.find_element(id: 'friends').text).to eq('Friends')
    driver.quit
  end

  it 'should search by login' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'all_users').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys(Selenium::WebDriver::Keys::KEYS[:enter])
    driver.manage.timeouts.implicit_wait = 50

    expect(driver.find_element(id: 'res').text).to eq('A user with this username was not found')
    driver.quit
  end
end
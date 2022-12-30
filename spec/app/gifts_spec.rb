# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users' do
  it 'should show new item in wishlist' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(class: 'add_gift_icon').click
    driver.manage.timeouts.implicit_wait = 50
    driver.find_element(id: 'gift_name').send_keys('Name')
    driver.find_element(id: 'gift_link').send_keys('Name')
    driver.find_element(id: 'gift_description').send_keys('Name')
    driver.find_element(id: 'add_btn').click

    driver.manage.timeouts.implicit_wait = 50

    expect(driver.find_element(class: 'card-body').nil?).to eq(false)
    driver.quit
  end

  it 'should delete new item in wishlist' do
    driver = Selenium::WebDriver.for :firefox
    driver.get('localhost:3000/en')
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(id: 'login').send_keys('login1')
    driver.find_element(id: 'pass').send_keys('Qwerty12')
    driver.find_element(id: 'log_btn').click
    driver.manage.timeouts.implicit_wait = 50

    driver.find_element(class: 'btn-danger').click

    driver.manage.timeouts.implicit_wait = 50

    expect(driver.find_element(id: 'gifts').text).to eq('')
    driver.quit
  end
end

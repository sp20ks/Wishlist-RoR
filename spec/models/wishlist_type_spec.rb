require 'rails_helper'

RSpec.describe WishlistType, type: :model do
  it 'successfully create wishlist type' do
    a = WishlistType.new(name: 'name')
    expect(a.save).to eq(true)
  end

  it 'successfully delete wishlist type' do
    a = WishlistType.create(name: 'name')
    a.destroy
    expect(WishlistType.last).to eq(nil)
  end
end

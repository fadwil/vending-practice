require 'rails_helper'

RSpec.describe 'When I visit a snack show page', type: :feature do
  before do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @jims  = @owner.machines.create!(location: "Jim's Mixed Snacks")
    @burger = @dons.snacks.create!(name: "White Castle Burger", price: 3.50)
    @rocks = @dons.snacks.create!(name: "Pop Rocks", price: 1.50)
    @flaming = @jims.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    @snickers = @jims.snacks.create!(name: "Snickers", price: 2.00) 
  end

  it 'I see the name of that snack' do
    visit snack_path(@burger)
    
    expect(page).to have_content("White Castle Burger")
  end
  
  it 'I see the price for that snack' do
    visit snack_path(@burger)
    
    expect(page).to have_content("$3.50")
  end

  it 'I see a list of locations with vending machines that carry that snack' do
    visit snack_path(@burger)
    
    expect(page).to have_content("Locations")
    expect(page).to have_content(@dons.location)
  end
  
  it 'I see the average price for snacks in those vending machines' do
    visit snack_path(@burger)

    expect(page).to have_content("average price of $2.50")
  end
  
  it 'I see a count of the different items in that machine' do
    visit snack_path(@burger)

    expect(page).to have_content("2 kinds of snacks")
  end
end
require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before do
    @owner = Owner.create!(name: "Sam's Snacks")
    @dons  = @owner.machines.create!(location: "Don's Mixed Drinks")
    @jims  = @owner.machines.create!(location: "Jim's Mixed Snacks")
    @burger = @dons.snacks.create!(name: "White Castle Burger", price: 3.50)
    @rocks = @dons.snacks.create!(name: "Pop Rocks", price: 1.50)
    @flaming = @jims.snacks.create!(name: "Flaming Hot Cheetos", price: 2.50)
    @snickers = @jims.snacks.create!(name: "Snickers", price: 2.00) 
    
  end
  it 'they see the location of that machine' do
    
    visit machine_path(@dons)
    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'I see the name of all snacks associated with that machine with their price' do
    visit machine_path(@dons)

    expect(page).to have_content("White Castle Burger: $3.50")
    expect(page).to have_content("Pop Rocks: $1.50")
    expect(page).to_not have_content("Flaming Hot Cheetos: $2.50")
    expect(page).to_not have_content("Snickers: $2.00")
  end

  it 'I see the average price for all snacks in the machine' do
    visit machine_path(@dons)
    expect(page).to have_content("Average Price: $2.50")
  end

  it 'I see a form to add a snack to the machine' do 
    visit machine_path(@dons)

    expect(page).to have_content("Add Snack:")
    
    fill_in :snack_id, with: "#{@rocks.id}"
    click_button "Submit"

    expect(current_path).to eq("/machines/#{@dons.id}")
    expect(page).to have_content("#{@rocks.name}")
    expect(page).to have_content("#{@rocks.price}")
  end
end

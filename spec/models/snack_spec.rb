require "rails_helper"

RSpec.describe Snack, type: :model do
  describe "relationships" do
    it { should have_many :snack_machines }
    it { should have_many(:machines).through :snack_machines }
  end

  describe 'class methods' do
    before do
      Snack.create!(name: "White Castle Burger", price: 3.50 )
      Snack.create!(name: "Pop Rocks", price: 1.50 )
    end

    it '.average_price' do
      expect(Snack.average_price).to eq(2.50)
    end

    it '.total' do
      expect(Snack.total).to eq(2)
    end
  end
end
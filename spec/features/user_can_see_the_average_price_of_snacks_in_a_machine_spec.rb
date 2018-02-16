require "rails_helper"

describe "As a User" do
  before :each do
    owner = Owner.create!(name: "Opakawagalaga")
    @vending = owner.machines.create!(location: "Bolivia")
    snack = Snack.create!(name: "Celery Because That is What is in Vending Machines", price: 400)
    snack_2 = Snack.create!(name: "Whiskey Because That is What is in Vending Machines", price: 600)
    fake_snack_for_testing = Snack.create!(name: "Bamboozle again!", price: 5000)
    Stock.create!(machine: @vending, snack: snack)
    Stock.create!(machine: @vending, snack: snack_2)
  end
  describe "When I visit a specific vending machine page" do
    it "I can see the average price of snacks" do
      visit machine_path(@vending)

      expect(page).to have_content("Average Price: $5.00")
    end
  end
end

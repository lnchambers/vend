require "rails_helper"

describe "As a User" do
  before :each do
    owner = Owner.create!(name: "Opakawagalaga")
    @vending = owner.machines.create!(location: "Bolivia")
    snack = Snack.create!(name: "Celery Because That is What is in Vending Machines", price: 850)
    Stock.create!(machine: @vending, snack: snack)
  end
  describe "When I visit a specific vending machine page" do
    it "I see the name of all snacks associated with that vending machine" do
      visit machine_path(@vending)

      expect(page).to have_content("Celery Because")
    end

    it "I see the price of all snacks associated with that vending machine" do
      visit machine_path(@vending)

      expect(page).to have_content("$8.50")
    end
  end
end

require "rails_helper"

describe "As a User" do
  before :each do
    owner = Owner.create!(name: "Opakawagalaga")
    @vending = owner.machines.create!(location: "Bolivia")
    snack = Snack.create!(name: "Celery Because That is What is in Vending Machines", price: 850)
    fake_snack_for_testing = Snack.create!(name: "Bamboozle again!", price: 5000)
    Stock.create!(machine: @vending, snack: snack)
  end
  describe "When I visit a specific vending machine page" do
    it "I see the name of all snacks associated with that vending machine" do
      visit machine_path(@vending)

      expect(page).to have_content("Celery Because")
      expect(page).to_not have_content("Bamboozle again!")
    end

    it "I see the price of all snacks associated with that vending machine" do
      visit machine_path(@vending)

      expect(page).to have_content("$8.50")
    end
  end
end

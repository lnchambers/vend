require "rails_helper"

describe "As a User" do
  before :each do
    owner = Owner.create!(name: "Opakawagalaga")
    @vending = owner.machines.create!(location: "Bolivia")
    @snack = Snack.create!(name: "Celery Because That is What is in Vending Machines", price: 400)
    @snack_2 = Snack.create!(name: "Whiskey Because That is What is in Vending Machines", price: 600)
    Stock.create!(machine: @vending, snack: @snack)
    Stock.create!(machine: @vending, snack: @snack_2)
  end
  describe "When I visit the snack/:id page" do
    it "I can see the name and price of that snack" do
      visit snack_path(@snack)

      expect(page).to have_content("Celery Because")
      expect(page).to have_content("$4.00")
    end
  end
end

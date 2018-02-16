require "rails_helper"

describe "As a User" do
  describe "When I visit a specific vending machine page" do
    it "I see the name of all snacks associated with that vending machine" do
      owner = Owner.new(name: "Opakawagalaga")
      vending = owner.machine.create!(location: "Bolivia")
      
      visit machine_path(vending)

    end
  end
end

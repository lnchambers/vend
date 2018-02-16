class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.text :name
      t.integer :price

      t.timestamps
    end
  end
end

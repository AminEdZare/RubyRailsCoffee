class RenameCoffeeCup < ActiveRecord::Migration[7.2]
  def change
    rename_table :articles, :coffee_cups
  end
end

class RecreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :coffee_cup, null: false, foreign_key: true

      t.timestamps
    end
  end
end

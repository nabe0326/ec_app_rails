class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :user_id , null: false , unique: true, foreign_key: true

      t.timestamps
    end
  end
end

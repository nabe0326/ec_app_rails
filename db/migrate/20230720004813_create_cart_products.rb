class CreateCartProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_products do |t|
      t.integer :cart_id,null: false, foreign_key: true
      t.integer :product_id,null: false, foreign_key: true

      t.timestamps
    end
  end
end

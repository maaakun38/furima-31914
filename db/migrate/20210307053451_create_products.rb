class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|

      t.timestamps

      t.string :nickname,            null: false
      t.string :titile,              null: false  
      t.integer :price,              null: false
      t.text :description,           null: false
      t.references :user,            foreign_ley: true
      t.integer :category_id,        null: false
      t.integer :condition_id,       null: false
      t.integer :shipping_charge_id, null: false
      t.integer :prefecture_id,      null: false
      t.integer :shipping_date_id,   null: false

    end
  end
end

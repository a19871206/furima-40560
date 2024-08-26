class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.references :order,    null: false, foreign_key: true
      t.string :zip_code,     null: false
      t.integer :region_id,   null: false
      t.string :city,         null: false
      t.string :address,      null: false
      t.string :another
      t.string :phone_number, null: false

      t.timestamps
    end
  end
end

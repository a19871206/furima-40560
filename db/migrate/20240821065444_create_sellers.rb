class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.references :order, null: false, foreign_key: true
      t.string :zip_code
      t.integer :region_id
      t.string :city
      t.string :address
      t.string :another
      t.string :phone_number

      t.timestamps
    end
  end
end

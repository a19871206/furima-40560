class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :user,               null: false, foreign_key: true
      t.string     :title,              null: false
      t.text       :explan,             null: false
      t.integer    :category_id,        null: false
      t.integer    :condition_id,       null: false
      t.integer    :shipping_cost_id,   null: false
      t.integer    :region_id,          null: false
      t.integer    :delivery_date_id,   null: false
      t.integer    :cost,               null: false
     
      t.timestamps
    end
  end
end
class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string     :postal_code,   null: false
      t.integer    :source_id,     null: false
      t.string     :city,          null: false
      t.string     :address_line1, null: false
      t.string     :address_line2
      t.integer    :number,     null: false
      t.references :order,         null: false,foreign_key: true

      t.timestamps
    end
  end
end

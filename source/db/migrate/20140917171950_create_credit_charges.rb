class CreateCreditCharges < ActiveRecord::Migration
  def change
    create_table :credit_charges do |t|
      t.timestamp :created
      t.boolean :paid
      t.integer :amount
      t.string :currency, limit: 3
      t.boolean :refunded
      t.integer :customer_id

      t.timestamps
    end
  end
end

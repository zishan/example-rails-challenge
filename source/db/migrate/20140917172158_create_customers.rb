class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_nm, limit: 50
      t.string :last_nm, limit: 50

      t.timestamps
    end
  end
end

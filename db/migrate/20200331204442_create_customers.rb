class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :email, required: true
      t.string :name
      t.string :identification, required: true

      t.timestamps
    end
  end
end

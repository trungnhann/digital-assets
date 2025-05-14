class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 255
      t.string :full_name, null: false, limit: 50
      t.string :password_digest, null: false
      t.string :role, default: 'customer'
      t.timestamps
    end
  end
end

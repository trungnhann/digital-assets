class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.bigint 'customer_id', null: false
      t.decimal 'total_amount', precision: 10, scale: 1, null: false
      t.string 'status', default: 'pending'
      t.timestamps
      t.index ['customer_id'], name: 'index_orders_on_customer_id'
    end
  end
end

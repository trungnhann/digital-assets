class CreateOrderItems < ActiveRecord::Migration[8.0]
  def change
    create_table :order_items do |t|
      t.bigint 'order_id', null: false
      t.bigint 'asset_id', null: false
      t.decimal 'price', precision: 10, scale: 1, null: false
      t.timestamps
      t.index ['order_id'], name: 'index_order_items_on_order_id'
      t.index ['asset_id'], name: 'index_order_items_on_asset_id'
    end
  end
end

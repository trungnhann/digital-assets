# == Schema Information
#
# Table name: order_items
#
#  id         :bigint           not null, primary key
#  price      :decimal(10, 1)   not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  asset_id   :bigint           not null, indexed
#  order_id   :bigint           not null, indexed
#
# Indexes
#
#  index_order_items_on_asset_id  (asset_id)
#  index_order_items_on_order_id  (order_id)
#
class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :asset

  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

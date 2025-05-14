# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  status       :string           default("pending")
#  total_amount :decimal(10, 1)   not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  customer_id  :bigint           not null, indexed
#
# Indexes
#
#  index_orders_on_customer_id  (customer_id)
#
class Order < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  has_many :order_items, dependent: :destroy
  has_many :assets, through: :order_items

  validates :total_amount, numericality: { greater_than: 0 }

  enum :status, {
    'pending' => 'pending',
    'completed' => 'completed',
    'failed' => 'failed'
  }
end

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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

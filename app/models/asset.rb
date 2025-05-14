# == Schema Information
#
# Table name: assets
#
#  id          :bigint           not null, primary key
#  active      :boolean          default(TRUE)
#  description :text
#  file_url    :string           not null
#  price       :decimal(10, 1)   not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  creator_id  :bigint           not null, indexed
#
# Indexes
#
#  index_assets_on_creator_id  (creator_id)
#
class Asset < ApplicationRecord
  belongs_to :creator, class_name: 'User', dependent: :destroy
  # has_many :order_items, dependent: :restrict_with_error
  # has_many :orders, through: :order_items

  validates :title, :file_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end

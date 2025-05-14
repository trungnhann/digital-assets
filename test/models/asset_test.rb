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
require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

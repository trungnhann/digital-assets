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
class AssetsController < ApplicationController
  before_action :set_asset, only: %i[show update destroy]

  # GET /assets
  def index
    @assets = Asset.all

    render json: @assets
  end

  # GET /assets/1
  def show
    render json: @asset
  end

  # POST /assets
  def create
    @asset = Asset.new(asset_params)

    if @asset.save
      render json: @asset, status: :created, location: @asset
    else
      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /assets/1
  def update
    if @asset.update(asset_params)
      render json: @asset
    else
      render json: @asset.errors, status: :unprocessable_entity
    end
  end

  # DELETE /assets/1
  def destroy
    @asset.destroy!
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_asset
    @asset = Asset.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def asset_params
    params.fetch(:asset, {})
  end
end

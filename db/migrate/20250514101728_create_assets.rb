class CreateAssets < ActiveRecord::Migration[8.0]
  def change
    create_table 'assets', force: :cascade do |t|
      t.bigint 'creator_id', null: false
      t.string 'title', null: false
      t.text 'description'
      t.string 'file_url', null: false
      t.decimal 'price', precision: 10, scale: 1, null: false
      t.boolean 'active', default: true
      t.timestamps
      t.index ['creator_id'], name: 'index_assets_on_creator_id'
    end
  end
end

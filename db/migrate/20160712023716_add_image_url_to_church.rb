class AddImageUrlToChurch < ActiveRecord::Migration[5.0]
  def change
    add_column :churches, :image_prev_url, :string
  end
end

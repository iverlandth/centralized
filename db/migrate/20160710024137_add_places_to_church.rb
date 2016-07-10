class AddPlacesToChurch < ActiveRecord::Migration[5.0]
  def change
    add_column :churches, :country, :string
    add_column :churches, :state, :string
    add_column :churches, :latitude, :float
    add_column :churches, :longitude, :float
  end
end

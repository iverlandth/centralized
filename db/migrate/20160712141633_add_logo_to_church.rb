class AddLogoToChurch < ActiveRecord::Migration[5.0]
  def change
    add_column :churches, :logo, :string
  end
end

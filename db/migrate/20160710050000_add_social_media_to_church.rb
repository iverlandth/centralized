class AddSocialMediaToChurch < ActiveRecord::Migration[5.0]
  def change
    add_column :churches, :twitter_url, :string
    add_column :churches, :facebook_url, :string
  end
end

class AddChurchToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :church, foreign_key: true
  end
end

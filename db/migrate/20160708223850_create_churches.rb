class CreateChurches < ActiveRecord::Migration[5.0]
  def change
    create_table :churches do |t|
      t.string :name
      t.text :address
      t.text :mission
      t.text :vision

      t.timestamps
    end
  end
end

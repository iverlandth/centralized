class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :cellphone
      t.string :telephone
      t.text :address
      t.integer :status
      t.references :church, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

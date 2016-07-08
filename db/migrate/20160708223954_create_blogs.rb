class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :description
      t.references :event, foreign_key: true
      t.references :church, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

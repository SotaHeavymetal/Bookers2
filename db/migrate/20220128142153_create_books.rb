class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.text :title
      t.string :image_id
      t.text :genre
      t.text :body
      t.string :user_id

      t.timestamps
    end
  end
end

class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.integer :genre_id
      t.integer :composer_id
      t.string  :name,        null: false
      t.timestamps
    end
  end
end

class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id,   null: false
      t.integer :song_id,   null: false
      t.string  :title,     null: false
      t.string  :body,      null: false
      t.text    :song_url
      t.string  :star,      null: false
      t.timestamps
    end
  end
end

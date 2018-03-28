class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :description
      t.date :date_post
      t.integer :user_id
      t.integer :battle_id
      t.boolean :status
    end
  end
end


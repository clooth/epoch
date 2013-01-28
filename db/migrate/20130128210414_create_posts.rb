class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.datetime :date_added
      t.datetime :date_posted
      t.text :body
      t.integer :user_id
      t.boolean :consumed

      t.timestamps
    end
  end
end

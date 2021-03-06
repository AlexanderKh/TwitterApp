class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :tweet, foreign_key: true

      t.timestamps

    end

    add_index :likes, [:user_id, :tweet_id], unique: true
  end
end

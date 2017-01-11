class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.string :content, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

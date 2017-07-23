class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.integer :number,unique: true
      t.text :image_url
      t.timestamps
    end
  end
end

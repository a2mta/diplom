class CreateAchivments < ActiveRecord::Migration
  def change
    create_table :achivments do |t|
      t.string :content
      t.string :achive_type
      t.string :start
      t.string :finish
      t.integer :count
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :achivments, [:user_id, :created_at]
  end
end

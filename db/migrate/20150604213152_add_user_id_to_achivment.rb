class AddUserIdToAchivment < ActiveRecord::Migration
  def change
    add_column :achivments, :user_id, :integer
  end
end

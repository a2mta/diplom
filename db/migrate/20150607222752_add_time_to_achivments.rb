class AddTimeToAchivments < ActiveRecord::Migration
  def change
    add_column :achivments, :time, :integer
  end
end

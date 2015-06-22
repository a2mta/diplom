class AddPicToAchivments < ActiveRecord::Migration
  def up
    add_attachment :achivments, :achive_photo
  end

  def down
    remove_attachment :achivments, :achive_photo
  end
end

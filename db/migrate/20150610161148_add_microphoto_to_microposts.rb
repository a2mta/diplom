class AddMicrophotoToMicroposts < ActiveRecord::Migration
  def up
    add_attachment :microposts, :microphoto
  end

  def down
    remove_attachment :microposts, :microphoto
  end
end

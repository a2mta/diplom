class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :achivments, :content, :achive_content
  end
end

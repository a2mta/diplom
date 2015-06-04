class AddAchivmentTypeTable < ActiveRecord::Migration
  def change
    create_table :achivments_type do |t|
      t.string :achivment_description

      t.timestamps
    end
  end
end

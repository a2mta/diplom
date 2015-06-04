class DropAchivmentsTable < ActiveRecord::Migration
  def up
    drop_table :achivments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

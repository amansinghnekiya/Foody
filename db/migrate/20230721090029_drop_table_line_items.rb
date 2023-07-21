class DropTableLineItems < ActiveRecord::Migration[7.0]
  def up
    drop_table :line_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

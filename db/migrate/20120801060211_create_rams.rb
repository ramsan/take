class CreateRams < ActiveRecord::Migration
  def change
    create_table :rams do |t|
      t.string :name

      t.timestamps
    end
  end
end

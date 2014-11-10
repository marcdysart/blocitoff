class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.boolean :destruct, default: true

      t.timestamps
    end
  end
end

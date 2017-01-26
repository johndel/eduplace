class CreateEdutypes < ActiveRecord::Migration[5.0]
  def change
    create_table :edutypes do |t|
      t.string :name

      t.timestamps
    end
  end
end

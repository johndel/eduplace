class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :title
      t.string :site
      t.string :address
      t.integer :postal_code
      t.string :phone
      t.string :fax
      t.string :permission_code
      t.integer :edutype_id, index: true, foreign_key: true
      t.boolean :amea
      t.integer :trainee_capacity
      t.integer :city_id, index: true, foreign_key: true
      t.integer :county_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end

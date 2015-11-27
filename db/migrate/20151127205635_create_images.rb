class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :gallery, index: true, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end

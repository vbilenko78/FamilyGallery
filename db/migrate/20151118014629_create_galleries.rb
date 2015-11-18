class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.references :owner, polymorphic: true, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end

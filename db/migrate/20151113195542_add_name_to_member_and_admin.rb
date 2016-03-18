class AddNameToMemberAndAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :name, :string, null: false
    add_column :members, :name, :string
  end
end

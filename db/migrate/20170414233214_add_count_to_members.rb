class AddCountToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :count, :integer
  end
end

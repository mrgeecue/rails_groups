class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.references :organization, foreign_key: true
      t.references :user, foreign_key: true, :through => :organization

      t.timestamps
    end
  end
end

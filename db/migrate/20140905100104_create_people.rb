class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.column :name, :string
      t.column :specialty, :string
      t.column :email, :string
    end
  end
end

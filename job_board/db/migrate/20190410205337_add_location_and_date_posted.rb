class AddLocationAndDatePosted < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :date_posted, :string
    add_column :jobs, :skill_level, :string
  end
end

class AddEmploymentTypeJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :employment_type, :string
  end
end

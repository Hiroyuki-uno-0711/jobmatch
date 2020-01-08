class CreateJobChecks < ActiveRecord::Migration[5.2]
  def change
    create_table :job_checks do |t|

      t.timestamps
    end
  end
end

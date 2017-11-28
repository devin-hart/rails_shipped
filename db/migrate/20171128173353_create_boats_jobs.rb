class CreateBoatsJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :boats_jobs do |t|
      t.belongs_to :boat
      t.belongs_to :job

    end
  end
end

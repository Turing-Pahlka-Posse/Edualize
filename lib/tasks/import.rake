require 'csv'

desc "Import charter/non-charter files"
task :import_charter_non_charter => [:environment] do
  first_file = "db/data/edu_data_0.csv"

  CSV.foreach(first_file, header: => true) do |row|
    State.create!({
      name: row[0]
      })
    MedianExpenditure.create!({
      total: row[1]
      instruction_related: row[3]
      support_services: row[5]
      school_type_id: 1
      state: State.find_by(name: row[0])
    })
    MedianExpenditure.create!({
      total: row[2]
      instruction_related: row[4]
      support_services: row[6]
      school_type_id: 2
      state: State.find_by(name: row[0])
    })


  end


end

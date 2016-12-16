require 'csv'

desc "Import charter/non-charter files"
task :import_charter_non_charter => [:environment] do
  first_file = "db/data/edu_data_0.csv"

  SchoolType.create(type_of_school: "charter")
  SchoolType.create(type_of_school: "non_charter")

  CSV.foreach(first_file, :headers => true) do |row|
    state = State.create!({
      st_name: row[0]
    })
    puts "#{state.id}: #{state.st_name}"

    exp_char = MedianExpenditure.create!({
      total: row[1],
      instruction_related: row[3],
      support_services: row[5],
      school_type_id: 1,
      state: State.find_by(st_name: row[0])
    })
    puts "#{exp_char.id}: #{exp_char.state}"

    exp_non_char = MedianExpenditure.create!({
      total: row[2],
      instruction_related: row[4],
      support_services: row[6],
      school_type_id: 2,
      state: State.find_by(st_name: row[0])
    })
    puts "#{exp_non_char.id}: #{exp_non_char.state}"
  end

end

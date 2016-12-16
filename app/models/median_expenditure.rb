class MedianExpenditure < ApplicationRecord
  # attr_accessor :total, :instruction_related, :support_services

  belongs_to :school_type
  belongs_to :state

  def self.find_totals_by_school_type
    charter = SchoolType.find_by(type_of_school: "charter")
    non_charter = SchoolType.find_by(type_of_school: "non_charter")
    # charters = MedianExpenditure.joins(:state).where(school_type: charter).pluck(:st_abbrev, :total)
    # non_charters = MedianExpenditure.joins(:state).where(school_type: non_charter).pluck(:st_abbrev, :total)
    schools = MedianExpenditure.joins(:state, :school_type).group("states.st_abbrev", "school_types.type_of_school", :total).pluck(:st_abbrev, :type_of_school, :total)
    format_state_spending(schools)
  end

  def self.format_state_spending(schools)
    schools.reduce({}) do |result, school|
      result[school[0]] ||= {}
      result[school[0]][school[1]] = school[-1]
      result
    end
  end

end

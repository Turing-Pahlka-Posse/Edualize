class MedianExpenditure < ApplicationRecord
  # attr_accessor :total, :instruction_related, :support_services

  belongs_to :school_type
  belongs_to :state

  def self.find_totals_by_school_type
    schools = MedianExpenditure.joins(:state, :school_type)
      .group("states.st_abbrev", "school_types.type_of_school", :total)
      .pluck(:st_abbrev, :type_of_school, :total)
  end


end

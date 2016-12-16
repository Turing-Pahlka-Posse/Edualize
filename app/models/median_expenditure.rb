class MedianExpenditure < ApplicationRecord
  attr_accessor :total, :instruction_related, :support_services

  belongs_to :school_type
  belongs_to :state
end

class MedianExpenditure < ApplicationRecord
  attr_accessor :total, :instruction_related, :support_services
  
  belongs_to :school_type
  belongs_to :state
  validates_presence_of :total
  validates_presence_of :instruction_related
  validates_presence_of :support_services
end

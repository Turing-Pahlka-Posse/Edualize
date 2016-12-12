class Student < ApplicationRecord
  belongs_to :school_type
  belongs_to :state
end

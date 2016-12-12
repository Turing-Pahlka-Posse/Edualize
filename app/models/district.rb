class District < ApplicationRecord
  belongs_to :school_type
  belongs_to :state
end

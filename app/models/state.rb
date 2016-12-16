class State < ApplicationRecord
  validates_presence_of :st_name
  validates_presence_of :st_abbrev

end

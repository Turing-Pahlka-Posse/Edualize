require 'rails_helper'

RSpec.describe State, type: :model do
  it { should validate_presence_of(:st_name) }
  it { should validate_presence_of(:st_abbrev) }
end

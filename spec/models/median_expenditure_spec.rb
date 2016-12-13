require 'rails_helper'

RSpec.describe MedianExpenditure, type: :model do
  it { should respond_to(:school_type) }
  it { should validate_presence_of(:total) }
  it { should validate_presence_of(:instruction_related) }
  it { should validate_presence_of(:support_services) }
  it { should respond_to(:state) }
end

require 'rails_helper'

RSpec.describe District, type: :model do
  it { should respond_to(:school_type) }
  it { should respond_to(:state) }
end

require 'rails_helper'

RSpec.describe District, type: :model do
  context "relationships" do
    it "responds to school_type" do
      school_type = SchoolType.create!(type_of_school: "charter")
      state = State.create!(st_name: "String", st_abbrev: "ST")
      district = District.create!(school_type: school_type, state_id: state.id)

      expect(district).to respond_to(:school_type_id)
    end
  end

  it { should respond_to(:school_type_id) }
  it { should respond_to(:state_id) }
end

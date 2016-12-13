require 'rails_helper'

RSpec.describe District, type: :model do
  context "relationships" do
    it "responds to school_type" do
      school_type = SchoolType.create!(school_type: "charter")
      state = State.create!(st_name: "String", st_abbrev: "ST")
      district = District.create!(school_type: school_type, state_id: 1)

      expect(district).to respond_to(:school_type)
    end
  end

end

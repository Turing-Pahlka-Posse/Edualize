require 'rails_helper'

RSpec.describe District, type: :model do
  context "relationships" do
    it "responds to school_type" do
      school_type = SchoolType.create!(type: "charter")
      district = District.create!(school_type: school_type, state: 1)

      expect(district).to respond_to(school_type)
    end
  end

end

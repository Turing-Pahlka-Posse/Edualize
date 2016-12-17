require 'rails_helper'

RSpec.describe MedianExpenditure, type: :model do
  it { should respond_to(:school_type) }
  it { should respond_to(:state) }

  context "median expenditure methods" do
    context ".find_totals_by_school_type" do
      it "returns a hash with charter and non-charter data per state" do
        state1 = State.create!(st_name: "Deleware", st_abbrev: "DE")
        state2 = State.create!(st_name: "Colorado", st_abbrev: "CO")
        s_type1 = SchoolType.create!(type_of_school: "charter")
        s_type2 = SchoolType.create!(type_of_school: "non_charter")
        med_exp = MedianExpenditure.create!(total: 1234, school_type: s_type1, state: state1)
        med_exp = MedianExpenditure.create!(total: 4321, school_type: s_type2, state: state1)

        med_exp = MedianExpenditure.create!(total: 3333, school_type: s_type1, state: state2)
        med_exp = MedianExpenditure.create!(total: 4444, school_type: s_type2, state: state2)

        schools = MedianExpenditure.find_totals_by_school_type

        expect(schools).to be_a(Hash)
        expect(schools[state2.st_abbrev]).to be_a(Hash)
        expect(schools[state2.st_abbrev]['charter']).to be_a(Integer)
        expect(schools[state2.st_abbrev]['non_charter']).to be_a(Integer)
      end
    end

    context ".format_state_spending" do
      it "formats an array into an organized hash" do
        schools = [["CO", "charter", 3333], ["DE", "charter", 1234], ["DE", "non_charter", 4321], ["CO", "non_charter", 4444]]

        formatted = MedianExpenditure.format_state_spending(schools)
        expect(schools).to be_a(Array)
        expect(formatted).to be_a(Hash)
        expect(formatted).to have_key(schools[0][0])
      end
    end


  end


end

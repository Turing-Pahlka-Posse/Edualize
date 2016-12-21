require 'rails_helper'

describe MedianExpenditure, type: :model do
  it { should respond_to(:school_type) }
  it { should respond_to(:state) }

  context "median expenditure methods" do
    context ".find_totals_by_school_type" do
      it "returns a hash with charter and non-charter data per state" do
        state1 = State.create!(st_name: "Deleware", st_abbrev: "DE")
        state2 = State.create!(st_name: "Colorado", st_abbrev: "CO")
        s_type1 = SchoolType.create!(type_of_school: "charter")
        s_type2 = SchoolType.create!(type_of_school: "non_charter")
        med_exp1 = MedianExpenditure.create!(total: 1234, school_type: s_type1, state: state1)
        med_exp2 = MedianExpenditure.create!(total: 4321, school_type: s_type2, state: state1)

        med_exp3 = MedianExpenditure.create!(total: 3333, school_type: s_type1, state: state2)
        med_exp4 = MedianExpenditure.create!(total: 4444, school_type: s_type2, state: state2)

        schools = MedianExpenditure.find_totals_by_school_type

        expect(schools).to be_a(Array)
        expect(schools[0]).to be_a(Array)
        expect(schools[0][0]).to eq(state1.st_abbrev)
        expect(schools[0][1]).to eq(s_type1.type_of_school)
        expect(schools[0][-1]).to eq(med_exp1.total)
      end
    end
  end

end

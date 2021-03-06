require "rails_helper"

describe "median_expenditures endpoints" do
  context "GET /total" do
    it "returns the total expenditures for charter/non-charter per state" do
      state1 = State.create!(st_name: "Deleware", st_abbrev: "DE")
      state2 = State.create!(st_name: "Colorado", st_abbrev: "CO")
      s_type1 = SchoolType.create!(type_of_school: "charter")
      s_type2 = SchoolType.create!(type_of_school: "non_charter")
      med_exp = MedianExpenditure.create!(total: 1234, school_type: s_type1, state: state1)
      med_exp = MedianExpenditure.create!(total: 4321, school_type: s_type2, state: state1)

      med_exp = MedianExpenditure.create!(total: 3333, school_type: s_type1, state: state2)
      med_exp = MedianExpenditure.create!(total: 4444, school_type: s_type2, state: state2)

      get "/api/v1/median_expenditures/totals"

      totals = JSON.parse(response.body)

      expect(response).to be_success
      expect(totals).to be_a(Array)
      expect(totals.count).to eq(4)
      expect(totals[0]).to have_key('state')
      expect(totals[0]).to have_key('type')
      expect(totals[0]).to have_key('total')
      expect(totals[0]['state']).to eq(state1.st_abbrev)
      expect(totals[0]['type']).to eq(s_type1.type_of_school)
      expect(totals[0]['total']).to eq(1234)

    end
  end
end

class Api::V1::MedianExpenditures::TotalsController < ApplicationController

  def index
    state_spending = MedianExpenditure.find_totals_by_school_type
    render json: state_spending
  end

end

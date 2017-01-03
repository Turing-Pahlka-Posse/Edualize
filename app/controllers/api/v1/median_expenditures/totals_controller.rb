class Api::V1::MedianExpenditures::TotalsController < ApplicationController

  def index
    state_spending = MedianExpenditure.find_totals_by_school_type
    formatted = FormatMedExpResponse.format_totals(state_spending)
    render json: formatted
  end

end

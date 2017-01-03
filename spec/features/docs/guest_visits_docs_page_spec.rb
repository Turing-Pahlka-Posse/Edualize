require 'rails_helper'

describe "the API docs pages" do
  context "a guest visits the docs page" do
    scenario "they see API documentation" do
      visit root_path

      expect(page).to have_content("Welcome to Edualize!")
      expect(page).to have_content("This is an API designed to collect and simplify")
      expect(page).to have_content("Pahlka Posse")
      expect(page).to have_content("Funding Data Requests")
      expect(page).to have_content("GET")
      expect(page).to have_content("https://edualize.herokuapp.com/api/v1/median_expenditures/totals")
    end
  end
end
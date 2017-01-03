# Edualize

This is an API designed to collect and simplify US Education data, created by [Pahlka Posse](https://github.com/Turing-Pahlka-Posse) (a civic tech group at [Turing School of Software and Design](https://www.turing.io)). We'll be updating it as we include new data sources, so check back soon!

### Technical Details

A Rails API storing data in a PostgreSQL database. Data was scraped from a PDF using our home-grown [PDF scraper](https://github.com/Turing-Pahlka-Posse/pdf-translate) and imported with a custom rake task. CSS is customized [Spectre](https://picturepan2.github.io/spectre/) and testing is handled by RSpec + Capybara.

## How to use:

You can access our web-based API (see [here](https://edualize.herokuapp.com)) via the commands below, or download and run the app locally. Either way, you'll need the following info:

### Get median expenditures for all schools

Send a GET request to (for example) https://edualize.herokuapp.com/api/v1/median_expenditures/totals. Replace edualize.herokuapp.com with your own localhost preference.

#### Data source
This data comes from the [National Center for Education Statistics](https://nces.ed.gov/ccd/pub_pubdistricts.asp) and is from the fiscal year 2013.

## How to install locally

#### Clone down and prep the repo!

`git clone https://github.com/Turing-Pahlka-Posse/Edualize`
`cd Edualize`
`bundle install`

#### Prep the database!

Still within the Edualize directory, do the following:

1. Make sure you have PostgreSQL running. 
2. `rake db:create db:migrate db:test:prepare`

#### Import education data from the included CSV file!

Run `rake import_charter_non_charter`

#### Run tests to make sure everything works!

`rspec`

#### You're done!

If you run into any problems, feel free to get in touch with us or file an issue.
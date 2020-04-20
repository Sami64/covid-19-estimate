# covid_impact

A app just getting some mock estimates from the api I built during the BUILDSDG assessment with Andela.

## API ENDPOINT
https://covid-19-dev-c.herokuapp.com/api/v1/on-covid-19

Endpoint makes use of a POST request in json format


# mock post request data
# Content-Type : application/json

{

  "region": {
  
    "name": "Africa",
    "avgAge": 19.7,
    "avgDailyIncomeInUSD": 5,
    "avgDailyIncomePopulation": 0.71
  },
  
  
  "periodType": "days",
  
  "timeToElapse": 58,
  
  "reportedCases": 674,
  
  "population": 66622705,
  
  "totalHospitalBeds": 1380614
  
}

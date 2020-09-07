Feature: To verify weather details

  Background:

    * url apiBaseURL
    * def jsonFromCsv = read('interactions/api/readfrom.csv')

    * def temp0 = jsonFromCsv[0]["main/temp"]
    * def temp1 = jsonFromCsv[1]["main/temp"]
    * def temp2 = jsonFromCsv[2]["main/temp"]

    * def tempmin0 = jsonFromCsv[0]["main/temp_min"]
    * def tempmin1 = jsonFromCsv[1]["main/temp_min"]
    * def tempmin2 = jsonFromCsv[2]["main/temp_min"]

    * def tempmax0 = jsonFromCsv[0]["main/temp_max"]
    * def tempmax1 = jsonFromCsv[1]["main/temp_max"]
    * def tempmax2 = jsonFromCsv[2]["main/temp_max"]

    * def pressure0 = jsonFromCsv[0]["main/pressure"]
    * def pressure1 = jsonFromCsv[1]["main/pressure"]
    * def pressure2 = jsonFromCsv[2]["main/pressure"]

    * def sealevel0 = jsonFromCsv[0]["main/sea_level"]
    * def sealevel1 = jsonFromCsv[1]["main/sea_level"]

  Scenario: To verify the GET service API is returning 200 response
    Given path apiPathURL
    And param q = city
    And param appid = applicationid
    When method GET
    # Asserting the status is 200
    Then status 200

    # Printing the response
    Then print response

    # Asserting the csv values with the reponse values
    * match temp0 == response.list[0].main.temp
    * match temp1 == response.list[1].main.temp
    * match temp2 == response.list[2].main.temp

    * match tempmin0 == response.list[0].main.temp_min
    * match tempmin1 == response.list[1].main.temp_min
    * match tempmin2 == response.list[2].main.temp_min

    * match tempmax0 == response.list[0].main.temp_max
    * match tempmax1 == response.list[1].main.temp_max
    * match tempmax2 == response.list[2].main.temp_max

    * match pressure0 == response.list[0].main.pressure
    * match pressure1 == response.list[1].main.pressure
    * match pressure2 == response.list[2].main.pressure

    * match sealevel0 == response.list[0].main.sea_level
    * match sealevel1 == response.list[1].main.sea_level

    # Printing the values to a new CSV file

    * table output
      | Expected Result | Actual Result                   |
      | temp0           | response.list[0].main.temp      |
      | temp1           | response.list[1].main.temp      |
      | temp2           | response.list[2].main.temp      |
      | tempmin0        | response.list[0].main.temp_min  |
      | tempmin1        | response.list[1].main.temp_min  |
      | tempmin2        | response.list[2].main.temp_min  |
      | tempmax0        | response.list[0].main.temp_max  |
      | tempmax1        | response.list[1].main.temp_max  |
      | tempmax2        | response.list[2].main.temp_max  |
      | pressure0       | response.list[0].main.pressure  |
      | pressure1       | response.list[1].main.pressure  |
      | pressure2       | response.list[2].main.pressure  |
      | sealevel0       | response.list[0].main.sea_level |
      | sealevel1       | response.list[1].main.sea_level |

    * karate.write(output,'examples/users/readto.csv')
















Feature: Videogame DB Test Script
for API specification, see https://videogamedb.uk/swagger-ui/index.html

  Background: 
    * url 'https://videogamedb.uk/api/v2'

Scenario: get all videogames and then get the first game by id
    Given path 'videogame'
    When method get 
    Then status 200 

    * def firstGame = response[0] 

    Given path 'videogame' , firstGame.id
    When method get 
    Then status 200 

Scenario: create a videogame
    * def vidGame = 
    """
    {
        "category": "Platform",
        "name": "Mario Party",
        "rating": "Adventure",
        "releaseDate": "2012-05-04",
        "reviewScore": 75
    }
    """
     Given path 'videogame'
     And request vidGame
     When method post 
     Then status 200 

     * def addGame = response.id


   



    

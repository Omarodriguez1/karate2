Feature: API Cotización
  
  Background: 
  	* url "http://18.144.161.96:8080/mx-par-quotation-service-0.0.1-SNAPSHOT"  

  Scenario: Validar Code 200 
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    #Then status 200
     And print response
    #response of validation(json)
    And match response == "#object"
    And match response == "#notnull"
    And match response == {"total": "#number","data": "#present", "notifications": "#notnull"}
    And match response.data.productId == "#notnull"
    And match response.notifications == "#present"
    And match response.notifications == [{"code": 601, "message": "#notnull", "timestamp": "#present"}]
    And print "response: ", response
    
    
 
  Scenario: Validar Code 400
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data2.json")
    When method post
    Then status 400
    
    
    
  @quotation
  Scenario: Validar Code 500
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data1.json")
    When method post
    Then status 500
    
    #response of validation(json)
    And match response == "#object"
    And match response == "#notnull"
    And print "response: ", response
    
   
  Scenario: Validar Response (Json)
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200
    And match response == "#object"
    And match response == "#notnull"
    And match response == {"total": "#number","data": "#present", "notifications": "#notnull"}

   
    Scenario: Validar productId 
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200    
    And match response.data.productId == "#notnull"
    And match response.data.productId contains "#number" , "#present"
    
  
    Scenario: Validar primera sección plans 
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"} 
    And request read("data.json")
    When method post 
    Then status 200    
    And match response.data.plans[0] == "#notnull"
    And match response.data.plans[0].planId == "#notnull"
    And match response.data.plans[0].planId contains "#number" , "#present"
    And match response.data.plans[0].name == "#notnull"
    And match response.data.plans[0].name contains "#string" , "#present"
    And match response.data.plans[0].status == "#notnull"
    And match response.data.plans[0].status contains "#string" , "#present"
    And match response.data.plans[0].paymentFrequency == "#notnull"
    
    
    Scenario: Validar primera sección paymentFrequency 
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200    
    And match response.data.plans..paymentFrequency == "#notnull"
    #And match response.data.plans[0].paymentFrequency..frequency == [{"id":2,"value":"MENSUAL"}] 
    And match response.data.plans[0].paymentFrequency..frequency == [{"id": "#notnull" , "value": "#notnull"}]
    And match response.data.plans[0].paymentFrequency..frequency == [{"id": "#number" , "value": "#string" , "value": "MENSUAL"}]
    #And match response.data.plans[0].paymentFrequency..premiumType == [{"id":1,"value":"MONTO"}] 
    And match response.data.plans[0].paymentFrequency..premiumType == [{"id": "#notnull" , "value": "#notnull"}]
    And match response.data.plans[0].paymentFrequency..premiumType == [{"id": "#number" , "value": "#string" , "value": "MONTO" }]
    And match response.data.plans[0].paymentFrequency..premiumValue contains "#number" , "#present" , "#notnull"
        
    
    Scenario: Validar sección coverageAssistance
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200 
    And match response.data.plans..coverageAssistance == "#notnull"
    #And match response.data.plans[0].coverageAssistance..type == [{"id":1,"value":"COBERTURA"}]  
    And match response.data.plans[0].coverageAssistance..type == [{"id": "#notnull" , "value": "#notnull"}]
    And match response.data.plans[0].coverageAssistance..type == [{"id": "#number" , "value": "#string"}]
    #And match response.data.plans[0].coverageAssistance..name == [{"id":3,"value":"COBERTURA AMPLIA"}]  
    And match response.data.plans[0].coverageAssistance..name == [{"id": "#notnull" , "value": "#notnull"}]
    And match response.data.plans[0].coverageAssistance..name == [{"id": "#number" , "value": "#string"}]
    And match response.data.plans[0].coverageAssistance..sinceAmount contains "#number" , "#present" , "#notnull"
    And match response.data.plans[0].coverageAssistance..toAmount contains "#number" , "#present" , "#notnull"
    #And match response.data.plans[0].coverageAssistance..premiumType == [{"id":1,"value":"MONTO"}]  
    And match response.data.plans[0].coverageAssistance..premiumType == [{"id": "#notnull" , "value": "#notnull"}]
    And match response.data.plans[0].coverageAssistance..premiumType == [{"id": "#number" , "value": "#string"}]    
    And match response.data.plans[0].coverageAssistance..premiumValue contains "#number" , "#present" , "#notnull"
    
 
    Scenario: Validar sección collection
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200
    And print response
    And match response.data.plans[0].collection..type.id contains "#number" , "#present" , "#notnull"
    And match response.data.plans[0].collection..type.value contains "#number" , "#present" , "#notnull"
    And match response.data.plans[0].collection..type..fields[0] == [{"id": "#number" , "value": "#string"}]
    And match response.data.plans[0].collection..type..fields[1] == [{"id": "#number" , "value": "#string"}]
    And match response.data.plans[0].collection..type..fields[2] == [{"id": "#number" , "value": "#string"}] 
    
    And match response.data.plans[0].collection..type..fields[0] == [{"id": "#number" , "value": "NOMBRE PRODUCTO"}]
    And match response.data.plans[0].collection..type..fields[1] == [{"id": "#number" , "value": "DESCRIPCION PRODUCTO"}] 
    And match response.data.plans[0].collection..type..fields[2] == [{"id": "#number" , "value": "COSTO PRODUCTO"}]
    
  
    Scenario: Validar sección notifications
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200
    And match response.notifications..code contains "#number" , "#present" , "#notnull"
    And match response.notifications..message contains "#string" , "#present" , "#notnull"
    And match response.notifications..timestamp contains "#string" , "#present" , "#notnull"
    
    
    
    Scenario: Validar sección Total
    Given path "/api/v1/quotation"
    * configure headers = {Content-Type: application/json, Authorization: "lala"}
    And request read("data.json")
    When method post
    Then status 200
    And match response..total contains "#number" , "#present" , "#notnull"
    And match response..total == [3] 
    And print response 
 				
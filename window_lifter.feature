Feature: Service Window Lifter

 Scenario: No window movement without window approval
	Given I do not grant window approval
    When I send event moveRequest
		| parameter  | value  |
		| requenst   | "OPEN" |
		| request    | "CLOSE"|
    Then nothing happens
	
 Scenario: Open the window
	Given I grant window approval
    When I try to open the window
    Then command is sent to open the window
	
 Scenario: Close the window
	Given I grant window approval
    When I try to close the window
    Then command is sent to close the window
	
 Scenario: Stop the window
	Given I grant window approval
    AND  I send event moveRequest 
    	| parameter  | value  |
		| requenst   | "OPEN" |
		| request    | "CLOSE"|
    When I try to stop any window movement
    Then command is sent to stop the window
    
 Scenario: Move Request "open the window" is itempotent
	Given I grant window approval
    AND  I try to open the window
    When I try to open the window
    Then command is sent to open the window
    
 Scenario: Stop the window when window approval is withdrawn
	Given I grant window approval
    When  I withdraw window approval
    Then command is sent to stop the window
Feature: Service Window Lifter

 Scenario Outline: No window movement without window approval
	Given I do not grant window approval
    When I send event moveRequest with request=<movement>
    Then nothing happens
    
    Examples:
    | movement |
    | "OPEN"   |
    | "CLOSE"  |
	
 Scenario: Open the window
	Given I grant window approval
    When I try to open the window
    Then command is sent to open the window
	
 Scenario: Close the window
	Given I grant window approval
    When I try to close the window
    Then command is sent to close the window
	
 Scenario Outline: Stop the window
	Given I grant window approval
    AND  I send event moveRequest with request=<movement>
    When I try to stop any window movement
    Then command is sent to stop the window
    
    Examples:
    | movement |
    | "OPEN"   |
    | "CLOSE"  |
    
 Scenario: Move requests are itempotent
	Given I grant window approval
    AND  I try to open the window
    When I try to open the window
    Then command is sent to open the window
    
 Scenario: Window is stopped when window approval is withdrawn
	Given I grant window approval
    When  I withdraw window approval
    Then command is sent to stop the window
Feature: Service Window Lifter

 Scenario Outline: No window movement without window approval
	Given I do nothing
    When I send event moveRequest with request=<movement>
    Then event moveCommand is not fired
    
    Examples:
    | movement |
    | "OPEN"   |
    | "CLOSE"  |
	
 Scenario: Open the window
	Given I send event windowApprovalOnChange with hasWindowApproval=True
    When I send event moveRequest with request="OPEN"
    Then event moveCommand is fired with command="OPEN"
	
 Scenario: Close the window
	Given I send event windowApprovalOnChange with hasWindowApproval=True
    When I send event moveRequest with request="CLOSE"
    Then event moveCommand is fired with command="CLOSE"
	
 Scenario Outline: Stop the window
	Given I send event windowApprovalOnChange with hasWindowApproval=True
    AND  I send event moveRequest with request=<movement>
    When I send event moveRequest with request="NONE"
    Then event moveCommand is fired with command="NONE"
    
    Examples:
    | movement |
    | "OPEN"   |
    | "CLOSE"  |
    
 Scenario: Move requests are itempotent
	Given I send event windowApprovalOnChange with hasWindowApproval=True
    AND  I send event moveRequest with request="OPEN"
    When I send event moveRequest with request="OPEN"
    Then event moveCommand is fired with command="OPEN"
    
 Scenario: Window is stopped when window approval is withdrawn
	Given I send event windowApprovalOnChange with hasWindowApproval=True
    When  I send event windowApprovalOnChange with hasWindowApproval=False
    Then event moveCommand is fired with command="NONE"
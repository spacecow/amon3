Feature:

Scenario: Login
When I go to the login page
And I fill in "Username" with "dover"
And I fill in "Password" with "secret"
And I press "Login"
Then I should see "Invalid login or password." as alert flash message

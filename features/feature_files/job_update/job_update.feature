Feature: View Job Status
  As an staff member
  So that I can see the overall summary of all the jobs
  I want to be able to see a graph based summary

  Background: users have been added to database
    Given the following users exist:
      | email                   | firstname | lastname   | partnershipnumber |
      | chemsworth@tamu.edu     | Claire    | Hemsworth  | 1A                |

    Given the following jobs exist:
      | JobNumber               | Partnership | Status          | JobDescription |
      | 2019-0000               | 1A          | Not Completed   | Paints         |
      | 2019-0001               | 1A          | Submitted to CM | Paints         |
      | 2019-0002               | 1A          | Submitted to EX | Paints         |


  Scenario: Log in as SA
    Given I, "chemsworth@tamu.edu", am an "SA" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "2019-0000 JobPage"
    When I follow "Schedule Job Check"
    Then I should be on the "2019-0000 JobPage"
    And I should see the following field entries: "status:Job Check Scheduled"
    When I follow "Complete Job Check"
    Then I should be on the "2019-0000 JobPage"
    And I should see the following field entries: "status:Completed by SA"
    When I follow "Submit to CM"
    Then I should be on the "2019-0000 JobPage"
    And I should see the following field entries: "status:Submitted to CM"

  Scenario: Log in as CM
    Given I, "chemsworth@tamu.edu", am an "CM" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "2019-0001 JobPage"
    When I follow "Submit to EX"
    Then I should be on the "2019-0001 JobPage"
    And I should see the following field entries: "status:Submitted to EX"

  Scenario: Delete the test set jobs from the database
    When I delete the jobs "2019-0000"
    Then I should not see the the jobs "2019-0000"
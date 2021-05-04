Feature: View Job Status
  As an Executive
  So that I can see the overall summary of all the jobs
  I want to be able to see a graph based summary

  Background: users have been added to database
    Given the following users exist:
      | email                   | firstname | lastname   | partnershipnumber |
      | chemsworth@tamu.edu     | Claire    | Hemsworth  | 1A                |

  Scenario: Log in as Executive
    Given I, "chemsworth@tamu.edu", am an "EX" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "HomePage"
    When I follow "Job Year"
    Then I should be on the "2021 JobYearPage"
    And I should see the following: "Export to CSV"


  Scenario: Delete the test set jobs from the database
    When I delete the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
    Then I should not see the the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
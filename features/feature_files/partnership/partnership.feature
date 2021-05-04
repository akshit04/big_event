Feature: View partnerships
  As a staff member
  So that I can see the job details under my partnerships
  I want to be able to go though all jobs and navigate to the edit page

Background: users have been added to database
    Given the following users exist:
      | email                   | firstname | lastname   | partnershipnumber |
      | chemsworth@tamu.edu     | Claire    | Hemsworth  | 1A                |
      | csembera@tamu.edu       | Canyon    | Sembera    | 2A                |
      | example@tamu.edu        | Example   | Example    | 1A                |

    Given the following jobs exist:
      | JobNumber               | Partnership | Status   |
      | 2019-0000               | 1A          | NEW      |
      | 2019-0001               | 1B          | TEST     |
      | 2019-0002               | 2A          | NEW      |
      | 2019-0003               | 2B          | NEW      |
      | 2019-0004               | 1C          | COMPLETE |

  Scenario: Log in as Executive
    Given I, "chemsworth@tamu.edu", am an "EX" level
    When I log in as "chemsworth@tamu.edu"
    And I follow "Committee Services"
    Then I should be on the "1A  PartnershipPage"
    And I should see the following: "Welcome Claire Hemsworth!" "Log out" "Staff Directory"
    And I should see the following: "2019-0000" "NEW"
    And I should not see the following: "2019-0001" "TEST"

  Scenario: Delete the test set jobs from the database
    When I delete the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
    Then I should not see the the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
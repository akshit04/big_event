Feature: Edit Job
  As an staff member
  So that I can edit the job
  I want to be able to make changes to job

  Background: users have been added to database
    Given the following users exist:
      | email                   | firstname | lastname   | partnershipnumber |
      | chemsworth@tamu.edu     | Claire    | Hemsworth  | 1A                |

    Given the following jobs exist:
      | JobNumber               | Partnership | Status          | JobDescription |
      | 2019-0000               | 1A          | Not Completed   | Paints         |
      | 2019-0001               | 1A          | Submitted to CM | Paints         |
      | 2019-0002               | 1A          | Submitted to EX | Paints         |

  Scenario: Go to edit job page
    Given I, "chemsworth@tamu.edu", am an "SA" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "2019-0000 JobPage"
    Then I should see the following field entries: "job_description:Paints"
    When I follow "Edit"
    Then I should be on the "2019-0000 JobEditPage"

  Scenario: Edit job
    Given I, "chemsworth@tamu.edu", am an "SA" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "2019-0000 JobEditPage"
    Then I should see the following field entries: "JobDescription:Paints"
    When I fill in the following entries: "JobDescription:Clean"
    And I press "Update Job Info"
    Then should be on the "2019-0000 JobPage"
    And I should see the following field entries: "job_description:Clean


  Scenario: Delete the test set jobs from the database
    When I delete the jobs "2019-0000 2019-0001 2019-0002"
    Then I should not see the the jobs "2019-0000 2019-0001 2019-0002"
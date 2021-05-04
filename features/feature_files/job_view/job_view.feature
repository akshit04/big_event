Feature: View Jobs
  As a staff member
  So that I can see the job details of a particular job
  I want to be able to go though the job details and approve the job

  Background: users have been added to database
    Given the following users exist:
      | email                   | firstname | lastname   | partnershipnumber |
      | chemsworth@tamu.edu     | Claire    | Hemsworth  | 1A                |
      | csembera@tamu.edu       | Canyon    | Sembera    | 2A                |
      | example@tamu.edu        | Example   | Example    | 1A                |

    Given the following jobs exist:
      | JobNumber               | Partnership | Status          | JobDescription |
      | 2019-0000               | 1A          | Not Completed   | Paints      |
      | 2019-0001               | 1B          | Submitted to CM | Clean       |
      | 2019-0002               | 2A          | Not Completed   | Carry       |
      | 2019-0003               | 2B          | Not Completed   | Yard        |
      | 2019-0004               | 1C          | Not Completed   | Garden      |

  Scenario: Log in as Executive
    Given I, "chemsworth@tamu.edu", am an "EX" level
    And I am logged in as "chemsworth@tamu.edu"
    And I am on the "1A PartnershipPage"
    When I follow "2019-0000"
    Then I should be on the "2019-0000 JobPage"
    And I should see the following: "FlatShovels" "GardenSpades" "Gloves" "Hammers" "HandClippers" "Cancel"
    And I should see the following: “Yard Sign” “Years participated in The Big Event” “Recipient Biography”
    And I should see the following: “Is there a pet at the residence?” “If yes, what type of pet?” “Overall, is there a risk?” “If so, what is the risk?”
    And I should see the following: “Is this a media job?” “Is Job Site Checklist Complete?” “Is Risk Eval Complete?”
    And I should see the following: “Is Recipient Biography Complete?” “Is Waiver/Indemnation Form Complete?”
    And I should see the following field entries: "job_description:Paints"
    And I should see the following field entries: "status:Not Completed"
    And I should not see the following field entries: "job_description:Clean" "job_description:Carry" "job_description:Yard" "job_description:Garden"


  Scenario: Delete the test set jobs from the database
    When I delete the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
    Then I should not see the the jobs "2019-0000, 2019-0001, 2019-0002, 2019-0003, 2019-0004"
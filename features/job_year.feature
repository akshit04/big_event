Feature: display the details of a job for a given year
  As a concerned executive
  So that I can quickly see the details of a job assigned to a partnership
  
Background: jobs have been added to database
  Given the following jobs exist:
  | JobNumber               | Partnership | Status   |
  | 2018-0000               | 1A          | NEW      |
  | 2021-0001               | 1B          | TEST     |
  | 2020-0002               | 2A          | NEW      |
  | 2021-0003               | 2B          | NEW      |
  | 2022-0004               | 1C          | COMPLETE |

  Scenario: Job Year page displays all jobs from 2021
    When I am on the Job Year page
    Then I should see the job "2021-0001"
    And I should see the job "2021-0003"
    And I should not see the the jobs "2018-0000, 2020-0002, 2022-0004"
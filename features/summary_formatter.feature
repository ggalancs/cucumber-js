Feature: Summary Formatter
  In order to get a quick overview of Cucumber test run
  Developers should be able to see a high level summary of the scenarios that were executed

  Scenario: with no scenarios
    Given a file named "features/a.feature" with:
      """
      Feature: some feature
      """
    When I run cucumber.js with `-f summary`
    Then it outputs this text:
      """
      0 scenarios
      0 steps
      <duration-stat>
      """

  Scenario: with a scenarios
    Given a file named "features/a.feature" with:
      """
      Feature: some feature
        Scenario: some scenario
          Given a step
          And another step
      """
    And a file named "features/step_definitions/cucumber_steps.js" with:
      """
      var cucumberSteps = function() {
        this.Given(/^a step$/, function() {});
        this.Given(/^another step$/, function() {});
      };
      module.exports = cucumberSteps;
      """
    When I run cucumber.js with `-f summary`
    Then it outputs this text:
      """
      1 scenario (1 passed)
      2 steps (2 passed)
      <duration-stat>
      """

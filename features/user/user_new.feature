Feature: Add a new member
  In order to use the forum more better
  As a user
  I want to became the member of the forum
  
  @wip
  Scenario: should register as a new member
    When I go to the new user page
    Then I fill in the following in the "user" table:
      | username              | wangxia                   |
      | email                 | michellewang514@gmail.com |
      | password              | password                  |
      | password_confirmation | password                  |
      | gender                | 女                         |
      | qq_number             | 249312390                 |
      | skype                 | wangxia401                |
      | question              | 你的生日是？                    |
      | answer                | 13/06/1984                |
    And I press "提交"
    Then I am on the user page
    And I should see "注册成功，欢迎加入我们！"
  
  
  

  

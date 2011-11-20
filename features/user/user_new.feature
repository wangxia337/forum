Feature: Add a new member
  In order to use the forum more better
  As a user
  I want to become the member of the forum
  
  @javascript
  Scenario: should register as a new member
    When I go to the new user page
    Then I fill in or select the following in the "user" table:
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
    And I should see "注册成功，欢迎加入我们！"
  
  
  

  

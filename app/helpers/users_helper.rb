module UsersHelper
  def gender_options
    [t("user.gender.male"), t("user.gender.female")]
  end
  
  def question_options
    [t("user.question.question_one"), t("user.question.question_two"), t("user.question.question_three"), t("user.question.question_four"), t("user.question.question_five"), t("user.question.question_six")]
  end
end
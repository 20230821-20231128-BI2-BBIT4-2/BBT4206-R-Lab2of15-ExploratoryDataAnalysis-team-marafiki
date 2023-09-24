# Installing the required packages
if (!is.element("formatR", installed.packages()[, 1])) {
  install.packages("formatR", dependencies = TRUE,
                   repos="https://cloud.r-project.org")
}
require("formatR")


#readr - Load datasets from CSV files ----
if (!is.element("readr", installed.packages()[, 1])) {
  install.packages("readr", dependencies = TRUE,
                   repos="https://cloud.r-project.org")
}
require("readr")

##Loading the student performance dataset
student_performance_dataset <-
  readr::read_csv(
    "data/20230412-20230719-BI1-BBIT4-1-StudentPerformanceDataset.CSV", # nolint
    col_types =
      readr::cols(
        class_group =
          readr::col_factor(levels = c("A", "B", "C")),
        gender = readr::col_factor(levels = c("1", "0")),
        YOB = readr::col_date(format = "%Y"),
        regret_choosing_bi =
          readr::col_factor(levels = c("1", "0")),
        drop_bi_now =
          readr::col_factor(levels = c("1", "0")),
        motivator =
          readr::col_factor(levels = c("1", "0")),
        read_content_before_lecture =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        anticipate_test_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        answer_rhetorical_questions =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        find_terms_I_do_not_know =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        copy_new_terms_in_reading_notebook =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        take_quizzes_and_use_results =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        reorganise_course_outline =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        write_down_important_points =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        space_out_revision =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        studying_in_study_group =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        schedule_appointments =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        goal_oriented =
          readr::col_factor(levels =
                              c("1", "0")),
        spaced_repetition =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        testing_and_active_recall =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        interleaving =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        categorizing =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        retrospective_timetable =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        cornell_notes =
          readr::col_factor(levels =
                              c("1", "2", "3", "4")),
        sq3r = readr::col_factor(levels =
                                   c("1", "2", "3", "4")),
        commute = readr::col_factor(levels =
                                      c("1", "2",
                                        "3", "4")),
        study_time = readr::col_factor(levels =
                                         c("1", "2",
                                           "3", "4")),
        repeats_since_Y1 = readr::col_integer(),
        paid_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        free_tuition = readr::col_factor(levels =
                                           c("0", "1")),
        extra_curricular = readr::col_factor(levels =
                                               c("0", "1")),
        sports_extra_curricular =
          readr::col_factor(levels = c("0", "1")),
        exercise_per_week = readr::col_factor(levels =
                                                c("0", "1",
                                                  "2",
                                                  "3")),
        meditate = readr::col_factor(levels =
                                       c("0", "1",
                                         "2", "3")),
        pray = readr::col_factor(levels =
                                   c("0", "1",
                                     "2", "3")),
        internet = readr::col_factor(levels =
                                       c("0", "1")),
        laptop = readr::col_factor(levels = c("0", "1")),
        family_relationships =
          readr::col_factor(levels =
                              c("1", "2", "3", "4", "5")),
        friendships = readr::col_factor(levels =
                                          c("1", "2", "3",
                                            "4", "5")),
        romantic_relationships =
          readr::col_factor(levels =
                              c("0", "1", "2", "3", "4")),
        spiritual_wellnes =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        financial_wellness =
          readr::col_factor(levels = c("1", "2", "3",
                                       "4", "5")),
        health = readr::col_factor(levels = c("1", "2",
                                              "3", "4",
                                              "5")),
        day_out = readr::col_factor(levels = c("0", "1",
                                               "2", "3")),
        night_out = readr::col_factor(levels = c("0",
                                                 "1", "2",
                                                 "3")),
        alcohol_or_narcotics =
          readr::col_factor(levels = c("0", "1", "2", "3")),
        mentor = readr::col_factor(levels = c("0", "1")),
        mentor_meetings = readr::col_factor(levels =
                                              c("0", "1",
                                                "2", "3")),
        `Attendance Waiver Granted: 1 = Yes, 0 = No` =
          readr::col_factor(levels = c("0", "1")),
        GRADE = readr::col_factor(levels =
                                    c("A", "B", "C", "D",
                                      "E"))),
    locale = readr::locale())

#Display number of observations and variables
dim(student_performance_dataset)

#Display quartiles for each numeric variable
summary(student_performance_dataset)

##Measures of frequency(categorical variables)
student_performance_freq <- student_performance_dataset$class_group
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$gender
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$regret_choosing_bi
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$drop_bi_now
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$motivator
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$read_content_before_lecture
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$anticipate_test_questions
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$answer_rhetorical_questions
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$find_terms_I_do_not_know
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$copy_new_terms_in_reading_notebook
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$take_quizzes_and_use_results
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$reorganise_course_outline
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$write_down_important_points
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$space_out_revision
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$studying_in_study_group
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$schedule_appointments
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$goal_oriented
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$spaced_repetition
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$testing_and_active_recall
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$interleaving
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$categorizing
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$retrospective_timetable
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$cornell_notes
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$sq3r
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$commute
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$study_time
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$repeats_since_Y1
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$paid_tuition
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$free_tuition
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$extra_curricular
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$sports_extra_curricular
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$exercise_per_week
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$meditate
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$pray
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$internet
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$laptop
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$family_relationships
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$romantic_relationships
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$spiritual_wellnes
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$financial_wellness
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$health
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$day_out
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$night_out
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$alcohol_or_narcotics
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$mentor
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$mentor_meetings
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$`A - 1. I am enjoying the subject`
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

student_performance_freq <- student_performance_dataset$`A - 2. Classes start and end on time`
cbind(frequency = table(student_performance_freq),
      percentage = prop.table(table(student_performance_freq)) * 100)

##Measures of central tendency
###Calculating Mode---
student_performance_class_group_mode <- names(table(student_performance_dataset$class_group))[
  which(table(student_performance_dataset$class_group) == max(table(student_performance_dataset$class_group)))
]
print(student_performance_class_group_mode)

student_performance_gender_mode <- names(table(student_performance_dataset$gender))[
  which(table(student_performance_dataset$gender) == max(table(student_performance_dataset$gender)))
]
print(student_performance_gender_mode)

student_performance_regret_choosing_bi_mode <- names(table(student_performance_dataset$regret_choosing_bi))[
  which(table(student_performance_dataset$regret_choosing_bi) == max(table(student_performance_dataset$regret_choosing_bi)))
]
print(student_performance_regret_choosing_bi_mode)

student_performance_drop_bi_now_mode <- names(table(student_performance_dataset$drop_bi_now))[
  which(table(student_performance_dataset$drop_bi_now) == max(table(student_performance_dataset$drop_bi_now)))
]
print(student_performance_drop_bi_now_mode)

student_performance_motivator_mode <- names(table(student_performance_dataset$motivator))[
  which(table(student_performance_dataset$motivator) == max(table(student_performance_dataset$motivator)))
]
print(student_performance_motivator_mode)

student_performance_read_content_before_lecture_mode <- names(table(student_performance_dataset$read_content_before_lecture))[
  which(table(student_performance_dataset$read_content_before_lecture) == max(table(student_performance_dataset$read_content_before_lecture)))
]
print(student_performance_read_content_before_lecture_mode)

student_performance_anticipate_test_questions_mode <- names(table(student_performance_dataset$anticipate_test_questions))[
  which(table(student_performance_dataset$anticipate_test_questions) == max(table(student_performance_dataset$anticipate_test_questions)))
]
print(student_performance_anticipate_test_questions_mode)

student_performance_find_terms_mode <- names(table(student_performance_dataset$find_terms_I_do_not_know))[
  which(table(student_performance_dataset$find_terms_I_do_not_know) == max(table(student_performance_dataset$find_terms_I_do_not_know)))
]
print(student_performance_find_terms_mode)

student_performance_copy_new_terms_mode <- names(table(student_performance_dataset$copy_new_terms_in_reading_notebook))[
  which(table(student_performance_dataset$copy_new_terms_in_reading_notebook) == max(table(student_performance_dataset$copy_new_terms_in_reading_notebook)))
]
print(student_performance_copy_new_terms_mode)

student_performance_take_quizzes_mode <- names(table(student_performance_dataset$take_quizzes_and_use_results))[
  which(table(student_performance_dataset$take_quizzes_and_use_results) == max(table(student_performance_dataset$take_quizzes_and_use_results)))
]
print(student_performance_take_quizzes_mode)

student_performance_reorganize_course_outline_mode <- names(table(student_performance_dataset$reorganise_course_outline))[
  which(table(student_performance_dataset$reorganise_course_outline) == max(table(student_performance_dataset$reorganise_course_outline)))
]
print(student_performance_reorganize_course_outline_mode)

##Standard Deviation of each Variable
selected_columns <- student_performance_dataset[, c(1:100)]
selected_columns <- sapply(selected_columns, as.numeric)
standard_deviations <- sapply(selected_columns, sd)
print(standard_deviations)

##Measure the variance of each variable
variance <- sapply(selected_columns, var)
print(variance)

##Kurtosis of each variable
library(moments)

if (!is.element("e1071", installed.packages()[, 1])) {
  install.packages("e1071", dependencies = TRUE)
}
require("e1071")
selected_columns_filtered <- selected_columns[sapply(selected_columns, function(col) sum(!is.na(col)) >= 4)]
kurtosis <- sapply(selected_columns_filtered, kurtosis, type = 2)
print(kurtosis)

##Skewness of each variable
skewness <- sapply(selected_columns, skewness)
print(skewness)

##Covariance between variables
student_performance_cov <- cov(selected_columns)
View(student_performance_cov)

##Correlation between variables
student_performance_cor <- cor(selected_columns)
View(student_performance_cor)



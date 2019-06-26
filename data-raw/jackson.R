# "https://ndownloader.figshare.com/files/100890"

df1 <- readr::read_csv("data-raw/data.csv")

df1$gender <- factor(df1$gender, levels = c(1:3), labels = c("male", "female", "other"))

df1[, 1:50][df1[, 1:50] == 0] <- NA

jackson_items <- list(
    N = c("q3", "q8", "q13", "q18", "q23", "q28", "q33", "q38", "q43", "q48"),
    E = c("q0", "q5", "q10", "q15", "q20", "q25", "q30", "q35", "q40", "q45"),
    O = c("q4", "q9", "q14", "q19", "q24", "q29", "q34", "q39", "q44", "q49"),
    A = c("q1", "q6", "q11", "q16", "q21", "q26", "q31", "q36", "q41", "q46"),
    C = c("q2", "q7", "q12", "q17", "q22", "q27", "q32", "q37", "q42", "q47"),
    rev_item = c("q5", "q15", "q25", "q35", "q45", "q1", "q11", "q21", "q31",
                 "q7", "q17", "q27", "q37", "q8", "q18", "q9", "q19", "q29"))

df1[, jackson_items$rev_item] <- 6 - df1[, jackson_items$rev_item]

psych::alpha(df1[, jackson_items$N])

jackson <- df1

usethis::use_data(jackson, jackson_items, overwrite = TRUE)

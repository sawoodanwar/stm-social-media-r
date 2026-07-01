library(quanteda)
library(quanteda.textstats)
library(stm)
library(dplyr)
library(readr)

base_dir <- here::here()
data_file <- file.path(base_dir, "data", "sample", "sample_posts.csv")
results_dir <- file.path(base_dir, "results", "tables")
dir.create(results_dir, recursive = TRUE, showWarnings = FALSE)

df <- read_csv(data_file)

clean_text <- function(text) {
  text <- tolower(text)
  text <- gsub("http\\S+|www\\S+", "", text)
  text <- gsub("@\\w+", "", text)
  text <- gsub("#", "", text)
  text <- gsub("[^a-z\\s]", " ", text)
  text <- gsub("\\s+", " ", text)
  trimws(text)
}

df$clean_text <- sapply(df$text, clean_text)

corp <- corpus(df, text_field = "clean_text", docid_field = "id")
toks <- tokens(corp, remove_punct = TRUE, remove_numbers = TRUE) %>%
  tokens_remove(stopwords("en")) %>%
  tokens_wordstem()

dfmat <- dfm(toks) %>% dfm_trim(min_termfreq = 1, min_docfreq = 1)
stm_input <- convert(dfmat, to = "stm")

k <- 5
stm_model <- stm(
  documents = stm_input$documents,
  vocab = stm_input$vocab,
  K = k,
  data = stm_input$meta,
  init.type = "Spectral",
  verbose = TRUE
)

topic_labels <- labelTopics(stm_model)
topic_summary <- data.frame(
  topic = 1:k,
  top_terms = sapply(1:k, function(i) paste(topic_labels$prob[i, ], collapse = ", "))
)

write_csv(topic_summary, file.path(results_dir, "topic_info.csv"))

doc_topics <- as.data.frame(stm_model$theta)
colnames(doc_topics) <- paste0("topic_", 1:k)
doc_topics$id <- df$id
write_csv(doc_topics, file.path(results_dir, "documents_with_topics.csv"))

cat("Saved:\n")
cat(file.path(results_dir, "topic_info.csv"), "\n")
cat(file.path(results_dir, "documents_with_topics.csv"), "\n")

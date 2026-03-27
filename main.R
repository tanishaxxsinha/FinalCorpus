library(tidyverse)
library(compmus)
library(tidyr)
library(dplyr)

high <- read.csv("C:/Users/TanTemp/Downloads/Corpus_High.csv")
low <- read.csv("C:/Users/TanTemp/Downloads/Corpus_Low.csv")
corpus <-
  bind_rows(
    high |> mutate(Category = "High"),
    low |> mutate(Category = "Low")
  )


songs_long <- corpus |>
  pivot_longer(
    cols = c(Danceability, Energy, Tempo, Speechiness,
             Acousticness, Instrumentalness, Liveness, Valence),
    names_to = "feature",
    values_to = "value"
  )


songs_long <- corpus |>
  select(Category, Acousticness, Danceability, Energy, Valence) |>
  pivot_longer(
    cols = -Category,
    names_to = "Features",
    values_to = "Value"
  )

ggplot(songs_long, aes(Features, Value, fill = Category)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#FF4E50", "#2EC4B6")) +
  labs(title = "Audio Feature Comparison Across High and Low Categories of the Corpus",
       fill = NULL) +
  theme_minimal() +
  theme(legend.position = "top")
                                                                 
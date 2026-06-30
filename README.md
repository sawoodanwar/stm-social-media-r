# Topic Modeling for Social Media Text Analysis (R)

A reproducible R workflow for topic modeling on social media text using the `stm` (Structural Topic Model) package, with embedding-based extensions via `text` and `reticulate`.

## Overview
This repository presents a public-safe R workflow for analyzing short-form social media text: preprocessing, document-term matrix construction, structural topic modeling, and topic interpretation. It complements the Python BERTopic repository and is built for R-based computational communication research.

## Objectives
- Preprocess social media text
- Build document-feature matrices
- Fit structural topic models (STM)
- Inspect and label topics
- Visualize topic prevalence
- Export interpretable results

## Tools
- R
- quanteda
- stm
- tidytext
- ggplot2
- text (optional, for transformer embeddings via reticulate)

## Repository Structure
- `data/sample/` - small public or synthetic sample data
- `notebooks/` - R Markdown workflow notebooks
- `scripts/R/` - reusable R scripts
- `results/figures/` - topic plots and visuals
- `results/tables/` - exported topic tables
- `renv/` or `environment/` - dependency management files

## Reproducibility
This repository shares code, workflow structure, and sample data only. It does not include restricted datasets, private thesis materials, or sensitive social media data.

## Quick Start

### 1. Clone the repository
```bash
git clone https://github.com/sawoodanwar/stm-social-media-r.git
cd stm-social-media-r
```

### 2. Restore the R environment
```r
install.packages("renv")
renv::restore()
```

### 3. Run the main script
```r
source("scripts/R/topic_model.R")
```

## Example workflow
1. Load sample posts from `data/sample/sample_posts.csv`
2. Clean and tokenize text with `quanteda`
3. Build a document-feature matrix
4. Fit an STM model with `stm`
5. Save topic summaries to `results/tables/topic_info.csv`

## Outputs
Expected outputs include:
- Topic summary tables
- Top terms per topic
- Topic prevalence plots
- Representative documents per topic

## Future Extensions
- Compare STM with LDA (`topicmodels` package)
- Add sentiment analysis by topic
- Add temporal topic evolution
- Integrate transformer embeddings via `text`/`reticulate`
- Adapt pipeline for Facebook or news-comment datasets

## Author
Sawood Anwar  
PhD in Text and Communication Sciences  
University of Urbino Carlo Bo

## Links
- GitHub Profile: https://github.com/sawoodanwar
- LinkedIn: https://www.linkedin.com/in/sawood-anwar/
- Google Scholar: https://scholar.google.com/citations?hl=en&user=GgsMu3sAAAAJ

## License
MIT License

# R Shiny App – Analysis of Plastic Waste Around the World

An interactive R Shiny web application designed for exploring and presenting the analysis of a lesser-known dataset on plastic waste generation and management around the world.

---

## About this project

This project was created as part of a university assignment. The goal was:

1. To find and use lesser-known, publicly available data  
2. To build a clear, well-documented presentation in RMarkdown including:
- Information about the data
- Explanation of the analytical method
- Results and interpretations, making the most of RMarkdown features (plots, code, tables, text)
3. To develop a Shiny app that performs and presents the analysis interactively

---

## Dataset

- **Topic:** Plastic Waste Around the World
- **Source:** Public data collected from online resources, aiming to highlight an environmental topic that is often overlooked.
- The data includes:
  - Country-level statistics
  - Plastic waste generation (kg/person/year)
  - Mismanaged waste
  - Recycling rates

---

## Method

The analysis combines:
- **Data cleaning and transformation in R**
- **Descriptive statistics**
- **Visualization**: bar plots, tables, interactive elements in the Shiny app
- **User interactivity**: filtering by country, comparing indicators

---

## Results

The project explores:
- Which countries generate the most plastic waste per capita
- Rates of mismanaged waste
- Comparisons of recycling efficiency

Results are visualized both in the RMarkdown presentation and interactively in the Shiny app. The goal is to make insights accessible and clear to the user.

---

## App Functionality

The Shiny app:
- Loads and preprocesses the dataset
- Lets users explore different plastic waste indicators
- Presents dynamic plots and summary tables
- Offers an intuitive interface for investigating country-level differences

---

## Files in this repository

- `ProjektR/ui.R` – User interface for the Shiny app
- `ProjektR/server.R` – Server-side R code for app logic
- `daneR/Plastic Waste Around the World.csv` – The dataset used in the analysis

---

## Technologies

- R
- R Shiny
- Tidyverse
- RMarkdown

---

## How to Run

1. Clone this repository:
    ```bash
    git clone https://github.com/aleksandrak671/R-Shiny.git
    ```
2. Open the `ProjektR` folder in RStudio.
3. Launch the Shiny app:
    ```R
    shiny::runApp()
    ```

---

## Author

Aleksandra Konopelska – 2025  –  Created as part of the university course **Programowanie w R (N24)**

**Data source** ➡️ [Global Plastic Waste 2023 – A Country Wise Analysis (Kaggle)](https://www.kaggle.com/datasets/prajwaldongre/global-plastic-waste-2023-a-country-wise-analysis)

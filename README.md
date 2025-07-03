# R Shiny App – Analysis of Plastic Waste Around the World

An interactive R Shiny web application for exploring and analyzing a dataset on global plastic waste generation and management.

---

## 🌐 Live App

[**Click here to launch the Shiny app**](https://aleksandrak67.shinyapps.io/projektr/)

---

## About This Project

This project was created as part of a university course **Programowanie w R (N24)**.  

**Goal:**  
- Use lesser-known, publicly available data  
- Document the analysis in **RMarkdown** with:
  - Details about the dataset
  - Explanation of analytical methods
  - Results with rich formatting (plots, code, tables, text)  
- Develop an **R Shiny app** to allow interactive data exploration

---

## Dataset

- **Topic:** Plastic waste around the world
- **Source:** [Global Plastic Waste 2023 – Kaggle](https://www.kaggle.com/datasets/prajwaldongre/global-plastic-waste-2023-a-country-wise-analysis)
- **Features include:**
  - Country-level statistics
  - Plastic waste generation (kg/person/year)
  - Mismanaged waste
  - Recycling rates

---

## Methodology

The analysis uses:  
- **Data cleaning & transformation in R**  
- **Descriptive statistics**  
- **Visualizations:** bar plots, tables, interactive filtering  
- **Interactivity:** filter by country, compare indicators  

---

## Results

The project addresses:  
- Countries with highest plastic waste per capita  
- Rates of mismanaged waste  
- Comparisons of recycling efficiency  

Results are shown in both **RMarkdown** documents and this **interactive Shiny app**, making the findings accessible to any user.

---

## App Functionality

The deployed Shiny app allows you to:
- Load and preprocess the dataset
- Explore plastic waste indicators interactively
- View dynamic plots and summary tables
- Intuitively compare country-level differences

---

## Instructions for Using the Live App

1. Click the **Live App** link above.  
2. Wait for the app to load.  
3. Use the **sidebar** or **filters** to select:
   - Country or region
   - Indicator (e.g., waste per capita, recycling rate)
4. View:
   - Updated plots
   - Data tables
   - Summaries based on your selection
5. Try different combinations to explore trends and comparisons!

---

## Files in This Repository

- `ProjektR/ui.R` – User interface of the Shiny app
- `ProjektR/server.R` – Server logic for data processing and reactivity
- `daneR/Plastic Waste Around the World.csv` – Source dataset

---

## Technologies Used

- **R**
- **R Shiny**
- **Tidyverse**
- **RMarkdown**

---

## How to Run Locally

1. Clone this repository:
    ```bash
    git clone https://github.com/aleksandrak671/R-Shiny.git
    ```
2. Open the **ProjektR** folder in **RStudio**.
3. Launch the app:
    ```R
    shiny::runApp()
    ```

---

## Author

Aleksandra Konopelska – 2025  
Created for the university course **Programowanie w R (N24)**  

**Data Source:**  
➡️ [Global Plastic Waste 2023 – A Country Wise Analysis (Kaggle)](https://www.kaggle.com/datasets/prajwaldongre/global-plastic-waste-2023-a-country-wise-analysis)

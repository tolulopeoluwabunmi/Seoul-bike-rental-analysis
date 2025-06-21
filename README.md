# 🚲 Seoul Bike Rental Analysis

This project explores the relationship between weather/time-based variables and bike rental demand in Seoul using **multiple linear regression** in **R**.

---

## 📌 Objective

To build a regression model that predicts **hourly rented bike counts** using environmental and temporal variables, and to draw insights that can support:
- Urban planners
- Bike-share operators
- Mobility researchers

---

## 📂 Dataset

- Source: UCI Machine Learning Repository  
- Records: 8,760 rows (1 per hour of the year 2017)  
- Features: Temperature, Rainfall, Hour of Day, Holiday Status, Season, Day of the Week

---

## 🛠️ Methods

- Data Cleaning & Feature Engineering in R
- Categorical encoding (Holiday, Season, Day of Week)
- Multicollinearity check using `vif()`
- Built two models:
  - `model_all`: full variable set
  - `model_final`: refined model using key variables

---

## 📊 Key Variables in Final Model

- **Hour** (0–23)
- **Temperature** (°C)
- **Rainfall** (mm)
- **Holiday** (binary)
- **Season** (factor)
- **Day of the Week** (factor)

---

## 📈 Insights

- Bike rentals increase with **temperature** and during **commuting hours**.
- Rentals **drop significantly on holidays and rainy days**.
- **Winter** and **weekends** show notably lower demand.
- Final model explains **~45% of variance** (R² ≈ 0.448)

---

## 📂 Files

| File | Description |
|------|-------------|
| `Seoul_bike_sharing.R` | Main R script with cleaning, modeling, and plots |
| `Presentation1.pptx` | Slide deck summarizing the full analysis |

---

## 🧠 Skills Demonstrated

- R Programming  
- Multiple Linear Regression  
- Data Wrangling & EDA  
- Data Visualization (base R + ggplot2)  
- Model Diagnostics  

---

## 🔗 Author

Tolulope Oluwabunmi – [GitHub](https://github.com/tolulopeoluwabunmi) | [LinkedIn](www.linkedin.com/in/tolulopeo11)


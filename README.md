````markdown
# TirtaMart Retail Data Analysis Project

This project simulates a retail business analysis for a fictional retail chain, **"TirtaMart"**, to showcase skills in data modeling, SQL analytics, and dashboard visualization using PostgreSQL and Power BI.

---

## 📁 Datasets

The dataset is entirely dummy and generated via [Mockaroo](https://mockaroo.com) to simulate real-world transactional retail data.

- `products.csv` → 1000 Products (`P0001`–`P1000`)
- `stores.csv` → 100 Stores (`S001`–`S100`)
- `customers.csv` → 1000 Customers (`C0001`–`C1000`)
- `sales_data.csv` → 10,000 Sales Records

---

## 🛠 Tools Used

- PostgreSQL with DBeaver (data storage & relational modeling)
- SQL (for data analysis and transformation)
- Power BI (interactive dashboards)
- Mockaroo (dummy data generation)

---

## 📊 Dashboard Highlights

An interactive Power BI dashboard was built to answer key business questions:

### 🔹 Weekly & Monthly Sales
- Visualized using line and bar charts
- Aggregated sales (`SUM(price)`) per week and per month

### 🔹 Region-Based Sales Map
- Revenue by region using map and filled map visuals
- Heatmap of store performance by city and region

### 🔹 Sales Trend by Product Category
- Category-wise revenue over time
- Helps identify seasonality and top-performing categories

### 🔹 KPI Metrics
- **Total Revenue**
- **Average Margin per Category**
- **Month-over-Month (MoM) Growth**
- **Top & Bottom 10 Selling Products**

---

## 🧠 SQL Analysis Highlights

**Weekly Sales:**
```sql
SELECT DATE_TRUNC('week', date) AS week_start, SUM(price) AS total_sales
FROM sales_data
GROUP BY 1
ORDER BY 1;
````

**Profit Margin per Category:**

```sql
SELECT p.category, SUM(sd.price - (p.cost_price * sd.quantity)) AS total_margin
FROM sales_data sd
JOIN products p ON sd.product_id = p.product_id
GROUP BY p.category;
```

**Top 10 Best-Selling Products:**

```sql
SELECT p.name, SUM(sd.quantity) AS total_sold
FROM sales_data sd
JOIN products p ON sd.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 10;
```

**Bottom 10 Selling Products:**

```sql
SELECT p.name, SUM(sd.quantity) AS total_sold
FROM sales_data sd
JOIN products p ON sd.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold ASC
LIMIT 10;
```

**Region-Based Revenue:**

```sql
SELECT s.region, SUM(sd.price) AS total_sales
FROM sales_data sd
JOIN stores s ON sd.store_id = s.store_id
GROUP BY s.region;
```

---

## 📈 Insights & Recommendations

* Categories like **Makanan** and **Minuman** contribute significantly to total sales but show varying margins.
* **Banten region** had the highest sales in Q2 – indicates potential expansion opportunity.
* Some products showed low volume and low margin → could be improved with bundling or discount strategies.
* Sales dips in certain months suggest a need for seasonal promotions.

---

## 📂 Project Structure

```
tirta-retail-analysis/
│
├── data/
│   ├── products.csv
│   ├── stores.csv
│   ├── customers.csv
│   └── sales_data.csv
│
├── sql/
│   ├── create_tables.sql
│   └── analysis_queries.sql
│
├── hasil-analyst
├── dashboard/
│   └── powerbi_dashboard.png
│
└── README.md
```

---

## 🔗 Connect with Me

* 📧 [your.email@email.com](mailto:your.email@email.com)
* 💼 [LinkedIn](https://linkedin.com/in/your-profile)
* 💻 [GitHub](https://github.com/yourusername/tirtamart-analysis)

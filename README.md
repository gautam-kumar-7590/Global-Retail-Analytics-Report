# Global Retail Analysis 2011-2014

## What This Project Is About

For this project I worked on the Global Superstore dataset containing 51,290 order line items spanning 4 years across 7 international markets. The goal was to clean the data, run a full SQL analysis and build an interactive Power BI dashboard to surface real business insights.

1. Microsoft SQL Server for data cleaning and analysis (Instance: GAUTAMOP\SQLEXPRESS)
2. Power BI Desktop for interactive dashboard visualization

---

## File Summary

### <ins>SQL Server - Database: Super_store | Table: [Super store Analysis]</ins>

- NULL check across all 21 columns - zero missing values found
- Duplicate removal using ROW_NUMBER() CTE partitioned by product, dates, customer, category and quantity
- Sales and profit totals by product, category, region, country and market
- Top 10 revenue products, top 5 products per region using window functions
- Year-by-year growth, category by year, top 10 customers, avg shipping cost by priority

  ![Image Alt]()

### <ins>Power BI - Global Retail Analytics Report.pbix | 2 Pages</ins>

- Page 1 Global Retail Analytics: KPI cards, bar charts, donut charts, area chart, global map, treemap, region slicer
- Page 2 Product and Sales Performance: Top 5 products, year-by-year growth, shipping cost by category and segment, units by priority, Year/Region/Category slicers

### <ins>Dataset - SuperStoreOrders.csv | 51,290 rows | 21 columns | 2011-2014</ins>

---

## Key Performance Indicators

| Total Sales = $12,642,905 | Total Profit = $1,468,035 | Profit Margin = 11.7% |
|---|---|---|
| Total Orders = 51,290 | Avg Order Value = $245 | Avg Shipping Cost = $26.41 |
| Profit CAGR = +26.7% | Sales CAGR = ~24% | Total Countries = 147 |

---

## Year-by-Year Growth (2011-2014)

| YEAR | TOTAL SALES | TOTAL PROFIT | MARGIN |
|------|-------------|--------------|--------|
| 2011 | $2,259,511 | $248,941 | 11.0% |
| 2012 | $2,677,493 | $307,415 | 11.5% |
| 2013 | $3,405,860 | $408,513 | 12.0% |
| 2014 | $4,300,041 | $504,166 | 11.7% |

Revenue nearly doubled in 4 years. Profit grew faster than sales every year meaning the business was becoming more efficient not just bigger. 2013 was the strongest margin year at 12.0%.

---

## Sales and Profit by Category

| CATEGORY | SALES | PROFIT | MARGIN |
|----------|-------|--------|--------|
| Technology | $4,744,691 | $663,779 | 14.0% << Best margin |
| Office Supplies | $3,787,330 | $518,474 | 13.7% |
| Furniture | $4,110,884 | $286,782 | 7.0% << Weakest margin |

Technology is the engine of this business. Best revenue and best margin. Furniture sells well but its 7% margin is dragged down almost entirely by Tables which is the only sub-category running at a loss.

---

## Sub-Category: Top 5 Profit vs Bottom 5

### <ins>Top 5 Most Profitable Sub-Categories</ins>

| SUB-CATEGORY | PROFIT | MARGIN |
|---|---|---|
| Copiers | $258,568 | 17.1% |
| Phones | $216,717 | 12.7% |
| Bookcases | $161,924 | 11.0% |
| Chairs | $141,974 | 9.5% |
| Appliances | $141,681 | 14.0% |

### <ins>Bottom 5 Sub-Categories (Watch List)</ins>

| SUB-CATEGORY | PROFIT | MARGIN |
|---|---|---|
| Tables | -$64,083 LOSS | -8.5% << Only loss-maker |
| Fasteners | $11,525 | 13.8% << Lowest revenue base |
| Labels | $15,011 | 20.4% |
| Supplies | $22,583 | 9.3% |
| Envelopes | $29,601 | 17.3% |

Tables is the only sub-category in the entire dataset with a net loss. $757K in sales but still loses $64K. Root cause is excessive discounting - avg discount on loss orders is 45.1% vs 4.3% on profitable orders.

---

## Country Performance: Top 5 and Bottom 5 by Profit

### <ins>Top 5 Countries by Profit</ins>

| COUNTRY | PROFIT | MARGIN |
|---|---|---|
| United States | $286,397 | 12.5% |
| China | $150,683 | 21.5% |
| India | $129,072 | 21.9% |
| United Kingdom | $111,900 | 21.2% |
| France | $109,029 | 12.7% |

### <ins>Bottom 5 Countries by Profit (All Loss-Making)</ins>

| COUNTRY | LOSS | MARGIN | AVG DISCOUNT |
|---|---|---|---|
| Turkey | $98,447 loss | 90.7% | 60.0% avg discount |
| Nigeria | $80,751 loss | 148.6% | 70.0% avg discount |
| Netherlands | $41,070 loss | 53.0% | 48.2% avg discount |
| Honduras | $29,482 loss | 32.7% | 40.7% avg discount |
| Pakistan | $22,447 loss | 38.1% | 44.5% avg discount |

The pattern is undeniable - every single loss-making country has a high average discount. Nigeria loses more money than it makes in sales (-148.6% margin) purely because of 70% average discounting. This is not a market problem it is a discount policy problem.

---

## Shipping Cost Analysis

### <ins>Shipping Cost by Order Priority</ins>

| PRIORITY | TOTAL COST | AVG PER ORDER | ORDERS | TOP SHIP MODE |
|---|---|---|---|---|
| Critical | $234,824 | $59.72 | 3,932 | First Class (44%) |
| High | $509,547 | $32.87 | 15,501 | Standard Class (44%) |
| Medium | $542,816 | $18.44 | 29,433 | Standard Class (73%) |
| Low | $65,633 | $27.08 | 2,424 | Standard Class (100%) |

Critical costs 3x more per order than Medium. Low priority uses Standard Class exclusively - 100% of the time. Medium is by far the highest volume tier at 29,433 orders and accounts for the most total shipping spend.

### <ins>Top 5 Products by Shipping Cost</ins>

| PRODUCT | TOTAL COST | AVG PER ORDER |
|---|---|---|
| Motorola Smart Phone, Full Size | $8,817 | $232.04 |
| Apple Smart Phone, Full Size | $8,028 | $157.41 |
| Nokia Smart Phone, Full Size | $7,853 | $167.08 |
| Cisco Smart Phone, Full Size | $7,065 | $185.93 |
| Harbour Creations Executive Leather Armchair | $6,548 | $167.90 |

Smartphones dominate the highest shipping costs. Motorola at $232 avg per order is nearly 9x the overall average. Armchairs appear because of their weight and size. These are high-value bulky items being shipped internationally.

### <ins>Top 5 Countries by Total Shipping Cost</ins>

| COUNTRY | TOTAL COST | AVG PER ORDER | ORDERS |
|---|---|---|---|
| United States | $238,174 | $23.83 | 9,994 << Highest volume |
| Australia | $100,359 | $35.38 | 2,837 |
| France | $95,388 | $33.74 | 2,827 |
| China | $78,957 | $42.00 | 1,880 << Most expensive per order |
| Mexico | $67,660 | $25.59 | 2,644 |

### <ins>Bottom 5 Countries by Total Shipping Cost</ins>

| COUNTRY | TOTAL COST | AVG | ORDERS |
|---|---|---|---|
| Equatorial Guinea | $9 | $3.13 avg | 3 orders |
| Eritrea | $9 | $4.28 avg | 2 orders |
| Armenia | $14 | $4.50 avg | 3 orders |
| Tajikistan | $18 | $6.03 avg | 3 orders |
| Burundi | $19 | $9.25 avg | 2 orders |

US leads total spend simply due to volume. China is the most expensive large market per order at $42 avg. The bottom 5 countries are micro markets with 2-3 orders each - barely any shipping footprint in the business.

---

## Country: Volume, Discount and Priority

### <ins>Top 5 Countries by Quantity Purchased</ins>

| COUNTRY | UNITS | ORDERS | SALES |
|---|---|---|---|
| United States | 37,873 units | 9,994 orders | $2,297,354 |
| France | 10,804 units | 2,827 orders | $858,930 |
| Australia | 10,673 units | 2,837 orders | $925,257 |
| Mexico | 10,011 units | 2,644 orders | $622,620 |
| Germany | 7,745 units | 2,065 orders | $628,857 |

US buys 37,873 units - more than 3.5x the next country France. The top 5 countries by volume are all profitable which makes sense as high volume without heavy discounting drives strong returns.

### <ins>Top 5 Countries Getting Highest Discounts</ins>

| COUNTRY | AVG DISCOUNT | ORDERS | PROFIT |
|---|---|---|---|
| Nigeria | 70.0% avg discount | 905 orders | -$80,751 |
| Kazakhstan | 70.0% avg discount | 101 orders | -$7,100 |
| Zimbabwe | 70.0% avg discount | 80 orders | -$5,429 |
| United Arab Emirates | 70.0% avg discount | 14 orders | -$1,037 |
| Lithuania | 70.0% avg discount | 50 orders | -$8,966 |

Every country receiving 70% average discount is loss-making. No exceptions. This confirms the discount policy is the root cause of losses in these markets not the markets themselves.

### <ins>Order Priority Preference - Top 5 Countries</ins>

| COUNTRY | MEDIUM | HIGH | CRITICAL | LOW |
|---|---|---|---|---|
| United States | 57% | 31% | 8% | 4% |
| France | 57% | 30% | 8% | 5% |
| Australia | 57% | 32% | 8% | 3% |
| Mexico | 57% | 29% | 8% | 5% |
| Germany | 59% | 26% | 8% | 6% |

Every country without exception prefers Medium priority. The split is almost identical across all countries - roughly 57% Medium, 30% High, 8% Critical, 5% Low. This is a global pattern not specific to any one market.

---

## Data Quality Findings

- Zero missing values - all 51,290 rows across all 21 columns fully populated
- Mixed date formats - M/D/YYYY and DD-MM-YYYY mixed across rows, handled in SQL with YEAR() and FORMAT()
- 677 loss-making products out of 3,788 unique products - driven by high discounts
- 457 product IDs mapped to multiple product names - ID system is not a reliable unique key
- 59 product names had hidden non-breaking spaces, 16 had whitespace, 32 had double spaces
- 2,104 orders had discounts of 70% or more - mostly Binders and Tables

---

## Use of AI

I used Claude AI as an analytical assistant throughout this project, not to do the work for me. Here is how:

- Validated SQL query logic especially ROW_NUMBER() window functions and CTEs
- Confirmed the discount-to-loss relationship with actual data calculations
- I used it to double check my analysis. For example, asking whether my KPI numbers looked correct given the dataset size
- I gave AI structure and content. I wanted and reviewed the output myself, editing and adjusting to make sure it reflects what I actually did
- Took assistance for complex formula or to double check the effectiveness of the formula

---

## Conclusion

This project successfully processed 51,290 orders across 4 years and 7 international markets delivering clear business insights through SQL analysis and interactive Power BI dashboards.

The middle ground - markets like LATAM ($2.16M sales, 10.2% margin), Southeast Asia (2.0% margin) and the Caribbean (10.7% margin) are not failing but they are not thriving either. These are the markets that need monitoring. One bad quarter of heavy discounting and Southeast Asia goes negative. LATAM has volume but the margin gap vs APAC and EU suggests pricing could be stronger there.

Countries like Vietnam, Dominican Republic, Myanmar and Thailand sit in the mid-tier - decent volume, slightly negative or near-zero profit, modest discounts. These are recoverable markets. A small discount reduction of 10-15% would likely flip them profitable.

**Key action points:**

- Cap discounts at 20-25% maximum - this single change would eliminate the majority of loss-making orders across all countries and products
- Exit or restructure pricing in Turkey and Nigeria - losing nearly $180K combined with no path to profitability at current discount levels
- Double down on Technology - highest revenue, best margin, consistently growing
- Investigate Tables sub-category - $757K in sales but still loses $64K, consider removing deep discounts or discontinuing low-margin SKUs
- Watch Southeast Asia closely - 2.0% margin means it is one bad quarter away from becoming a loss region
- Canada is a hidden opportunity - tiny revenue today ($67K) but 26.6% margin, the highest of any market

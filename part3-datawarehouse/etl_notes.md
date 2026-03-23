## ETL Decisions

### Decision 1 — Date Standardization
Problem:
The raw dataset contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and text formats.

Resolution:
All dates were converted into a standard ISO format (YYYY-MM-DD). A separate `dim_date` table was created with derived fields like year, month, and day to support time-based analysis.


### Decision 2 — Handling NULL Values
Problem:
Some records had NULL values in important fields such as quantity or price, which could break aggregation queries.

Resolution:
NULL values were either:
- Replaced with default values (e.g., quantity = 1), or
- Rows were excluded if critical data like price was missing.
This ensured accurate calculations in the fact table.


### Decision 3 — Category Normalization
Problem:
Product categories had inconsistent casing and naming (e.g., "electronics", "ELECTRONICS", "Electronics").

Resolution:
All category values were standardized to proper case (e.g., "Electronics", "Clothing") before loading into `dim_product`. This avoids duplicate groupings during analysis.
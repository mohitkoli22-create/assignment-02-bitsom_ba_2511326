**## Storage Systems**



To meet the hospital’s four goals, a hybrid Data Lakehouse architecture is most suitable.



For predicting patient readmission risk, historical structured data (treatments, admissions) is stored in a Data Warehouse (e.g., Snowflake). This ensures clean, structured, and query-optimized data for training ML models. Raw medical records and semi-structured data (JSON, logs) are first stored in a Data Lake (e.g., Amazon S3), then processed and transformed before entering the warehouse.



To support natural language queries by doctors, a Vector Database is used. Patient records and doctor notes are embedded into vectors, enabling semantic search such as “cardiac event history.” This allows fast and context-aware retrieval compared to traditional SQL queries.



For monthly reporting, a Data Warehouse is ideal due to its optimized OLAP capabilities. It supports aggregations like bed occupancy rates and department-wise costs efficiently, enabling tools like Power BI or Tableau to generate dashboards.



For real-time ICU vitals, a streaming data pipeline (Kafka/Kinesis) feeds into a Data Lake for storage and a real-time processing engine (Spark Streaming/Flink). Recent vitals may also be stored in a fast-access NoSQL database (e.g., Cassandra) for alerting systems.



**## OLTP vs OLAP Boundary**



The OLTP system includes the hospital’s operational database , where real-time transactions occur—patient admissions, treatments, billing, and updates from ICU devices.



The boundary between OLTP and OLAP is defined at the data ingestion layer. Data is extracted (via ETL/ELT pipelines) from OLTP systems and moved into the Data Lake and Data Warehouse.



OLTP (Transactional): Real-time operations, normalized schema, fast inserts/updates

OLAP (Analytical): Historical analysis, denormalized schema, aggregation queries



This separation ensures that analytical workloads (ML training, reporting) do not impact critical hospital operations.



**## Trade-offs**



A key trade-off in this design is system complexity vs flexibility.



Using multiple systems (Data Lake, Warehouse, Vector DB, Streaming engine) increases architectural complexity, maintenance effort, and cost. However, it provides flexibility to handle diverse data types—structured, unstructured, and streaming—which is essential in healthcare.





This balances scalability, performance, and maintainability while supporting all four hospital goals effectively.


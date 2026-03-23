## Vector DB Use Case

A traditional keyword-based database search would not be sufficient for a system where lawyers query large contracts using natural language. Keyword search relies on exact word matching, meaning it may fail when the query uses different wording than the document. For example, a lawyer might search for "termination clauses," while the document might phrase it as "conditions for ending the agreement.

In contrast, a vector database enables semantic search by converting both the contract text and user queries into embeddings. These embeddings capture the meaning of the text rather than just the exact words. As a result, even if the wording differs, the system can still retrieve relevant sections based on similarity in meaning.

In this system, the 500-page contracts would first be broken into smaller chunks (e.g., paragraphs) and converted into vector embeddings. These embeddings would then be stored in a vector database. When a lawyer asks a question in plain English, the query is also converted into an embedding and compared against stored vectors using similarity measures like cosine similarity.

The vector database efficiently retrieves the most relevant sections, which can then be presented directly or passed to a language model for summarization. This approach significantly improves accuracy, usability, and search relevance compared to traditional keyword-based systems.
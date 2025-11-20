# Incident Brief

Revenue dipped on August 15th after a run of failed checkouts and timeouts in the reporting backend.
Analysts need fast answers to the following questions:

1. Which customer regions saw the most failed transactions between 09:14 and 09:20 UTC?
2. How many unique IPs received HTTP 401 or 500 responses?
3. Which ETL step should be prioritized for hardening based on the warnings in `etl-pipeline.log`?
4. Which sensor devices are sending malformed readings and need firmware attention?

Use the files inside `data-lab/` to extract the answers.

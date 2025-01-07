# Movie Database Schema
## This project defines the database schema for a movie database and provides functionality to interact with it programmatically using Java.

## Tables Included
BirthLocation
Movie
University
Director
Actor
Department
MovieActor
Genre
MovieGenre
Cinema
Ticket
ShowTime
Award
Category

## Features
Normalized database structure with primary and foreign key constraints.
Cascading updates and deletions for maintaining data integrity.
pgAdmin was used to design and manage the database schema.
Java integration with JDBC for performing SQL operations, including:
Inserting data into tables.
Querying data with filtering and parameterized queries.
Handling and displaying query results with support for multiple parameters.

# Java Files

## q3.java

This file inserts data into multiple tables, including:

BirthLocation
ShowTime
University
Director
Actor
Department
Genre
Cinema
Ticket
Award
Category
Key Features:

Uses PreparedStatement to insert data.
Manages connections to the database using JDBC.
Example inserts include adding a director, actor, genre, and cinema ticket details.

## q4.java

This file performs various queries on the database, including:
Fetching directors born in Canada.
Listing movies directed by a specific director (e.g., David Lynch).
Fetching actors in movies with a budget greater than $1M, including currency conversions (USD, CAD, JPY, RUB, EUR, CHF).
Retrieving directors with surnames starting with 'A' or 'D'.
Listing all actors with cursor-based retrieval.

## Key Features:

Uses both Statement and PreparedStatement for executing queries.
Supports parameterized queries with dynamic filtering.
Demonstrates advanced SQL operations, including joins and conditional filters.

Currency conversion calculations included in queries.

Usage
Run the SQL script in a PostgreSQL database using pgAdmin to create the schema.

Use the Java files to:

Populate the database with sample data (q3.java).

Query and retrieve meaningful data from the database (q4.java).
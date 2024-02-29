from neo4j import GraphDatabase

# Neo4j connection settings
neo4j_uri = "bolt://localhost:7687"
neo4j_user = "neo4j"
neo4j_password = "automatch"

# Initialize the Neo4j driver
driver = GraphDatabase.driver(neo4j_uri, auth=(neo4j_user, neo4j_password))

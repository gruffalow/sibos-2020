from database import connection as db_con


def setup_tables():
    db = db_con.connect_database()
    cursor = db.cursor()
    cursor.execute(
        "DROP TABLE IF EXISTS account_relationships")
    cursor.execute(
        "CREATE TABLE account_relationships (id VARCHAR(255) PRIMARY KEY, document TEXT)")
    db.close()

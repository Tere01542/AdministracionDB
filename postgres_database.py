import psycopg2


if _name_ == "_main_":
    try:
        url = "host='{0}' dbname='{1}' user='{2}' password='{3}'".format('localhost', 'postgres', 'postgres', '123')


        conn = psycopg2.connect(url)


        cursor = conn.cursor()

        sql = """SELECT datname FROM pg_database"""

        cursor.execute(sql)

        for row in cursor:
            print(row[0])


        cursor.close()
    except (Exception, psycopg2.DatabaseError) as e:
        print(e)

import psycopg2

# Abre la conexion con la db y un usuario concreto.
conn = psycopg2.connect("dbname=BankDB user=DanielSN")
# Concede un 'cursor' con el que trabajar contra la base de datos.
cur = conn.cursor()

# Crea una nueva tabla.
cur.execute(
    "CREATE TABLE test (id serial PRIMARY KEY, num integer, data varchar);")
# A la tabla anterior, introduce datos.
cur.execute("INSERT INTO test (num, data) VALUES (%s, %s)", (100, "abc'def"))
# Obten una lista en base al 'Select'.
cur.execute("SELECT * FROM test;")
# Iterando sobre la lista previa, retorna el primer elemento.
cur.fetchone()

# Convierte en persistentes los cambios realizados en la base de datos.
conn.commit()

# Cerrar el cursor y la propia conexion.
cur.close()
conn.close()

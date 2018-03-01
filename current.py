import pymysql as sql
import datetime

connection = sql.connect(host='localhost', user='root', db = 'finance')

with connection.cursor() as cursor:
    scheme_names = "select name from schemes;"
    cursor.execute(scheme_names)
    names = cursor.fetchall()
    names = map(lambda x: x[0], list(names))

sort = raw_input("What type of transaction? i or e? ")
quantity = raw_input("How much? ")
txn_date = raw_input("What was the date of the transaction? yyyy-mm-dd? ")
date_added = datetime.datetime.now()
while True:
    scheme = raw_input("What allocation scheme would you like to use? ")
    if scheme not in names:
        print "Not a valid scheme.  Try again."
    else:
        break
desc = raw_input("Please enter a description of the transaction: ")

with open('../current.txt', 'a') as f:
    f.write("|".join([sort, quantity, txn_date, date_added.strftime('%Y-%m-%d'), scheme, desc]))
    f.write("\n")


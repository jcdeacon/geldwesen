import pymysql as sql
import ast

result = {}

def include(k, n, i):
    if i:
        if k in result:
            result[k] += n
        else:
            result[k] = n
    else:
        if k in result:
            result[k] -= n
        else:
            result[k] = -n

def sort_txn(num, d, prefix, i):
    for key in d:
        new_prefix = prefix + (len(prefix)>0) * "." + key
        if type(d[key]) == int:
            include(new_prefix, float(d[key] * num)/100.0, i)
        else:
            sort_txn(float(d[key][0] * num)/100.0, d[key][1], new_prefix, i)

connection = sql.connect(host='localhost', user='root', db = 'finance')
with connection.cursor() as cursor:
    joins = "select scheme, sort, quantity from schemes join transactions on schemes.name = transactions.scheme_name;"
    cursor.execute(joins)
    data = cursor.fetchall()

categories = {}
for txn in data:
    assert(txn[1] == 'i' or 'e')
    income = txn[1] == 'i'
    amt = txn[2]
    sort_txn(amt, ast.literal_eval(txn[0]), "", income)

for key in sorted(result):
    print key + ": " + str(result[key])



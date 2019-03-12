import binascii
from urllib.parse import unquote
import base64
from datetime import datetime as dt

log_file = open("ch13.txt", "r")
querys = []
dates = []

for line in log_file:
    query = line[line.find("order=") + len("order="):line.find("HTTP/1.1")]
    uncode_query = base64.b64decode(unquote(query))
    querys.append(uncode_query)

    date = line[line.find("[")+1:line.find("]")].split(" ")[0]
    hour = date[date.find(':')+1:]
    dates.append(hour)

cont = 0
fmt = '%H:%M:%S'
a = ""
password = ""
for i in range(len(dates)-1):
    d1 = dt.strptime(dates[i], fmt)
    d2 = dt.strptime(dates[i+1], fmt)
    diff_time = (d2-d1).seconds
    cont += 1
    if cont == 4:
        if diff_time == 2:
            a += "0"
        else:
            a += "1"
        a += "0"
        a = a[::-1]
        d = int(a,2)
        b = chr(d)
        print(d)#, d, b)
        password += b
        #print(a)
        cont = 0
        a = ""
    else:
        if diff_time == 0:
            a += "00"
        elif diff_time == 2:
            a += "1"
            a += "0"
        elif diff_time == 4:
            a += "0"
            a += "1"
        else:
            a += "11"
#    print(a)
print(password)

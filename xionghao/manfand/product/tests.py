from django.test import TestCase

# Create your tests here.

import time
import datetime

def Caltime(date1,date2):

    date1=time.strptime(date1,"%Y年%m月%d日 %H:%M")
    date2=time.strptime(date2,"%Y年%m月%d日 %H:%M")
    print(date1)
    date1=datetime.datetime(date1[0],date1[1],date1[2])
    date2=datetime.datetime(date2[0],date2[1],date2[2])
    return (date2-date1).days

print(Caltime('2018年5月12日 19:20','2018年6月26日 19:20'))
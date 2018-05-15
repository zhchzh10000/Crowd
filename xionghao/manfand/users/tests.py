
# from django.test import TestCase
# # # coding : utf-8
# # # Create your tests here.
# # import requests
# # url = 'http://xyzfgjj.xys.gov.cn/chaxun_geren.asp'
# # response = requests.get(url)
# # # 乱码
# # print (response.content.decode('GBK')) # 乱码

def test():
    try:
        raise ValueError('something wrong')
    except ValueError as e:
        print('Error occurred!')
        return  # 返回
    finally:
        print('Done')


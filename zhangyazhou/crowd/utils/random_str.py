import random

STR = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'


def random_str(num):
    num_list = random.sample(STR,num)
    str1 = ''
    for nu in num_list:
        str1 += nu
    return str1
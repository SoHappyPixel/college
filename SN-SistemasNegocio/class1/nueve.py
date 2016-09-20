#!/usr/bin/env python

import random
from datetime import datetime

random.seed(datetime.now())
user_num = ''

while True :
    user_num = raw_input("Tell me a number:  ")
    if user_num == 'q':
        print "\nSe acabo el programa"
        exit()
    elif user_num.isdigit() :
        roulette = random.randint(0,9)
        if int(user_num) == roulette :
            print "R: {r} | Y: {y}. You win! :D".format(r=roulette,y=user_num)
        else :
            print "R: {r} | Y: {y}. You lose! :(".format(r=roulette,y=user_num)
    else :
        print "Haha! Nice try but... Try again."

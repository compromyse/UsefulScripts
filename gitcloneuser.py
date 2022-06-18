#!/usr/bin/env python3
import requests
import json
import os
import argparse
import sys

parser = argparse.ArgumentParser(description='Clone all repositories from a github user.')
parser.add_argument('-u','--user', help='Specify github user.', required=True)
args = vars(parser.parse_args())

user = args['user']

repos_list = json.loads(requests.get(f'https://api.github.com/users/{user}/repos').text)

for i in range(0,len(repos_list)):
    try:
        url = repos_list[i]['ssh_url']
    except:
        print('An error occoured. Please check the username again.')
        sys.exit(1)
    os.system(f'git clone {url}')

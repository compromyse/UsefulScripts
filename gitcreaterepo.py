from github import Github
import argparse
import os

parser = argparse.ArgumentParser(description='Create and clone a Github repository.')
parser.add_argument('-n','--name', help='Specify repository name.', required=True)
parser.add_argument('-t','--token', help='Specify Github personal access token.', required=True)
args = vars(parser.parse_args())

name = args['name']
token = args['token']

g = Github(token)
user = g.get_user()

print(f'[+] Creating repository {name}...\n')

try:
    repo = user.create_repo(
        name=name,
        private=False
    )
except:
    print('An error occoured creating the repository, maybe it is an invalid name or it already exists on the account?')
    exit(1)

repo.create_file("README.md", "initial upload", f'# {repo.name}')

os.system(f'git clone {repo.clone_url}')

print(f'\n[+] Link to repository: {repo.url}')
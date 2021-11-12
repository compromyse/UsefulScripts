#!/usr/bin/env python3
import os

dirs = os.listdir()

for i in dirs:
	os.chdir(i)
	print(f'Folder: {i}')
	os.system('git pull')
	os.chdir('../')
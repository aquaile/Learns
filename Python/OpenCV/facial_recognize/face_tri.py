# -*- coding:utf-8 -*-
import cv2
import sys
import os
import shutil
import glob

# make dir
dir_path = 'face'
if os.path.isdir(dir_path):
	shutil.rmtree(dir_path)
os.mkdir(dir_path)
# args = sys.argv
# argc = len(args)

# if(argc != 2):
# 	print ''
# 	quit()

# image_path = args[1]
files = glob.glob('./iltest/*.jpg')
num = 1
# while True:
for file in files:
	# if num>2:
	# 	break
	#image_path = "base_data/nkmr_lab_"+str(num).zfill(4)+".jpg"
	image_path = file
	print file

	# if os.path.exists(image_path)!=True:
	# 	break

	cascade_path = "haarcascade_frontalface_alt.xml"

	# load file
	image = cv2.imread(image_path)
	if(image is None):
		print '画像を開けません。'
		quit()

	# gray scale
	image_gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

	# cascade
	cascade = cv2.CascadeClassifier(cascade_path)

	# face check
	facerect = cascade.detectMultiScale(image_gray, scaleFactor=1.2, minNeighbors=2, minSize=(10, 10))

	print "face rectangle"
	print facerect

	path = os.path.splitext(image_path)
	# if len(facerect) > 0:
	# 	path = os.path.splitext(image_path)
	# 	#dir_path = path[0] + '_face's
	# 	dir_path = 'face'
	# 	if os.path.isdir(dir_path):
	# 		shutil.rmtree(dir_path)
	# 	os.mkdir(dir_path)

	i = 0;
	for rect in facerect:
		#save face only
		x = rect[0]
		y = rect[1]
		width = rect[2]
		height = rect[3]
		dst = image[y:y+height, x:x+width]
		#new_image_path = dir_path + '/' + str(i) + path[1];
		new_image_path = dir_path + '/' + str(num) + "_" + str(i) + path[1];
		cv2.imwrite(new_image_path, dst)
		i += 1
	num += 1
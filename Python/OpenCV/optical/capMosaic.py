#coding:utf-8

import numpy as np
import cv2

cap = cv2.VideoCapture(0)

#顔探索用のカスケード型分類器を取得
face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')

while(True):
    # Capture frame-by-frame
    ret, frame = cap.read()
    ret, mosaic = cap.read()

    # Our operations on the frame come here
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    #分類器で顔を認識する
    face = face_cascade.detectMultiScale(gray,1.3,5)

    if 0 < len(face):
    	print "get face"

    	for (x,y,w,h) in face:
    		#顔の部分だけ切り抜いてモザイク処理をする
    		cut_img = frame[y:y+h,x:x+w]
    		cut_face = cut_img.shape[:2][::-1]
    		#10分の1にする
    		cut_img = cv2.resize(cut_img,(cut_face[0]/10, cut_face[0]/10))
    		#画像を元のサイズに拡大
    		cut_img = cv2.resize(cut_img,cut_face,interpolation = cv2.INTER_NEAREST)
    		#モザイク処理した部分を重ねる
    		mosaic[y:y+h,x:x+w] = cut_img

    else:
    	
    	print "no face"


    # Display the resulting frame
    cv2.imshow('frame',mosaic)
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
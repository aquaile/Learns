# -*- coding: utf-8 -*-
import numpy as np
import cv2

cap = cv2.VideoCapture(0)

while(True):
    # Capture frame-by-frame
    ret, frame = cap.read()
    # grayscaleをかける
    prvs = cv2.cvtColor(frame,cv2.COLOR_BGR2GRAY)
    hsv = np.zeros_like(frame)
    hsv[...,1] = 255

    # Our operations on the frame come here
    # gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    # gray = cv2.cvtColor(frame, 0)
    # gray = cv2.Canny(frame,100,200)
    # gray = cv2.GaussianBlur(frame,(9,9),0)

    while(1):
        ret, _frame = cap.read()
        next = cv2.cvtColor(_frame, cv2.COLOR_BGR2GRAY)
        
        flow = cv2.calcOpticalFlowFarneback(prvs,next, None, 0.5, 3, 15, 3, 5, 1.2, 0)
        
        mag, ang = cv2.cartToPolar(flow[...,0],flow[...,1])
        hsv[...,0] = ang*180/np.pi/2
        hsv[...,2] = cv2.normalize(mag,None,0,255,cv2.NORM_MINMAX)
        rgb = cv2.cvtColor(hsv,cv2.COLOR_HSV2BGR)
        # Display the resulting frame
        cv2.imshow('_frame',rgb)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

# When everything done, release the capture
cap.release()
cv2.destroyAllWindows()
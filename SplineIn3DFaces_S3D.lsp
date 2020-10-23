;;;;;; Generate SPLINE objects in every 3DFACE.

(prompt "\nType S3D to run SplineIn3DFaces...")

(defun c:S3D (/ )

(prompt "\n***SplineIn3DFaces is an application developed by ALEJANDRO BURGUENO DIAZ***")

(princ "\n Select ONLY 3DFACES to work with .. ")
(setq SSET (ssget))
(setq CNT -1)

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))

(setq OBJENT (entget OBJ))

(setq 3POINT (cdr(assoc 12 OBJENT)) )
(setq 4POINT (cdr(assoc 13 OBJENT)) )

(cond ((equal 3POINT 4POINT)
 
(setq P1X (nth 1 (assoc 10 OBJENT)) ) 
(setq P1Y (nth 2 (assoc 10 OBJENT)) ) 
(setq P1Z (nth 3 (assoc 10 OBJENT)) ) 

(setq P2X (nth 1 (assoc 11 OBJENT)) ) 
(setq P2Y (nth 2 (assoc 11 OBJENT)) ) 
(setq P2Z (nth 3 (assoc 11 OBJENT)) ) 

(setq P3X (nth 1 (assoc 12 OBJENT)) ) 
(setq P3Y (nth 2 (assoc 12 OBJENT)) ) 
(setq P3Z (nth 3 (assoc 12 OBJENT)) ) 

;;--------------
(setq P12X (rtos(/ (+ P1X P2X) 2) )) 
(setq P12Y (rtos(/ (+ P1Y P2Y) 2) )) 
(setq P12Z (rtos(/ (+ P1Z P2Z) 2) ))

(setq P23X (rtos(/ (+ P2X P3X) 2) )) 
(setq P23Y (rtos(/ (+ P2Y P3Y) 2) )) 
(setq P23Z (rtos(/ (+ P2Z P3Z) 2) ))

(setq P31X (rtos(/ (+ P3X P1X) 2) )) 
(setq P31Y (rtos(/ (+ P3Y P1Y) 2) )) 
(setq P31Z (rtos(/ (+ P3Z P1Z) 2) ))

(setq P12 (strcat P12X "," P12Y "," P12Z) )
(setq P23 (strcat P23X "," P23Y "," P23Z) )
(setq P31 (strcat P31X "," P31Y "," P31Z) )

(command "_spline" P12 P23 P31 "_close" "")
)
;end of first condition

(t
(setq P1X (nth 1 (assoc 10 OBJENT)) ) 
(setq P1Y (nth 2 (assoc 10 OBJENT)) ) 
(setq P1Z (nth 3 (assoc 10 OBJENT)) ) 

(setq P2X (nth 1 (assoc 11 OBJENT)) ) 
(setq P2Y (nth 2 (assoc 11 OBJENT)) ) 
(setq P2Z (nth 3 (assoc 11 OBJENT)) ) 

(setq P3X (nth 1 (assoc 12 OBJENT)) ) 
(setq P3Y (nth 2 (assoc 12 OBJENT)) ) 
(setq P3Z (nth 3 (assoc 12 OBJENT)) ) 

(setq P4X (nth 1 (assoc 13 OBJENT)) ) 
(setq P4Y (nth 2 (assoc 13 OBJENT)) ) 
(setq P4Z (nth 3 (assoc 13 OBJENT)) ) 

;;--------------
(setq P12X (rtos(/ (+ P1X P2X) 2) )) 
(setq P12Y (rtos(/ (+ P1Y P2Y) 2) )) 
(setq P12Z (rtos(/ (+ P1Z P2Z) 2) ))

(setq P23X (rtos(/ (+ P2X P3X) 2) )) 
(setq P23Y (rtos(/ (+ P2Y P3Y) 2) )) 
(setq P23Z (rtos(/ (+ P2Z P3Z) 2) ))

(setq P34X (rtos(/ (+ P3X P4X) 2) )) 
(setq P34Y (rtos(/ (+ P3Y P4Y) 2) )) 
(setq P34Z (rtos(/ (+ P3Z P4Z) 2) ))

(setq P41X (rtos(/ (+ P4X P1X) 2) )) 
(setq P41Y (rtos(/ (+ P4Y P1Y) 2) )) 
(setq P41Z (rtos(/ (+ P4Z P1Z) 2) ))

(setq P12 (strcat P12X "," P12Y "," P12Z) )
(setq P23 (strcat P23X "," P23Y "," P23Z) )
(setq P34 (strcat P34X "," P34Y "," P34Z) )
(setq P41 (strcat P41X "," P41Y "," P41Z) )

(command "_spline" P12 P23 P34 P41 "_close" "")
)
;end last condition t
)
;end of cond statement


)
;end while

(princ)
)

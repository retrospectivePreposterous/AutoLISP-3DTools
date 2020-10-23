;; Generate 3DPOLYLINES with a specific NUMBER OF SEGMENTS along selected 
;; ARCS, CIRCLES, 3DPOLYLINES, 2DPOLYLINES or ELLIPSES. 

(prompt "\nType QDZ to run QuickDiscretization...")

(defun c:QDZ (/ OLDCE OLDSN HEIGHT SSET CNT OBJ OBJENT OBJLAY FACES)

(prompt "\n***QuickDiscretization is an application developed by ALEJANDRO BURGUENO DIAZ***")

;;--------------------------------------------------------------------------------------------------

(vl-load-com)

(setq DIVNUMB (getint (strcat "\n Enter Number of Segments: ")))
(print DIVNUMB)
(princ "\n Select 2DPOL, 3DPOL, ARCS, CIRCLES or ELLIPSES to divide.. ")
(setq SSET (ssget))
(setq CNT -1)

(setq OLDCE (getvar "cmdecho"))
(setvar "cmdecho" 0)
(setq OLDSN (getvar "osmode"))
(setvar "osmode" 0)

(command "_-layer" "_make" "alBd4retrPrep3pzw" "_color" "1" "alBd4retrPrep3pzw" "")
(command "_-layer" "_make" "Segment_Lines" "_color" "3" "Segment_Lines" "")


(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))

	(command "_-layer" "_set" "alBd4retrPrep3pzw" "")
	(command "_divide" OBJ DIVNUMB "") 
	(setq DIVPOINTS (ssget "_X" '((0 . "POINT") (8 . "alBd4retrPrep3pzw"))))
	(setq SECCNT -1)

	(setq OBJLAX (vlax-ename->vla-object OBJ))
	(setq STPT (vlax-curve-getStartPoint OBJLAX))
	(setq EDPT (vlax-curve-getEndPoint OBJLAX))
	
	;Following code specifies a 3dpoly containing a loop alogn its points:
	(command "_-layer" "_set" "Segment_Lines" "")
	(command "_3dpoly")
	(command EDPT)
	(while (setq OBJPOINT (ssname DIVPOINTS (setq SECCNT (1+ SECCNT))))
		(command (cdr (assoc 10 (entget OBJPOINT))))
	)
	(command STPT)
	(command "")

	(command "_erase" DIVPOINTS "" "")
)

(command "_-laydel" "name" "alBd4retrPrep3pzw" "" "_yes")
(setvar "cmdecho" OLDCE)
(setvar "osmode" OLDSN)
(princ)
)
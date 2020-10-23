;;;;;; Generate 3DSOLID objects with specific THICKNESS from selected SURFACES.

(prompt "\nType STS to run SurfacesToSolids...")

(defun c:STS (/ OLDCE OLDSN HEIGHT SSET CNT OBJ OBJENT OBJLAY FACES)

(prompt "\n***SurfacesToSolids is an application developed by ALEJANDRO BURGUENO DIAZ***")

;;----------------------------------------------------------------

(setq HEIGHT (getdist (strcat "\n Enter Height value: ")))
(setq PT1 (list 0 0 (- 0 HEIGHT)))

(princ "\n Select ONLY SURFACES to extrude .. ")
(setq SSET (ssget))
(setq CNT -1)

(setq OLDCE (getvar "cmdecho"))
(setvar "cmdecho" 0)
(setq OLDSN (getvar 'osmode))
(setvar "osmode" 0)

(command "_-layer" "_make" "alBd4retrPrep3pzw" "")

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))
	(setq OBJENT (entget OBJ))
	(setq OBJLAY (cdr (assoc 8 OBJENT)) ) 

	(command "_-layer" "_set" "alBd4retrPrep3pzw" "")
	(command "_extrude" "_mode" "_surface" OBJ "" "_direction" "0,0,0" PT1 "")
	(setq FACES (ssget "_X" '((8 . "alBd4retrPrep3pzw"))) )
	(command "_copy" OBJ "" "0,0,0" PT1 "") 
	(command "_-layer" "_set" OBJLAY "")
	(command "_surfsculpt" OBJ FACES "_last" "")
)
(command "_-laydel" "name" "alBd4retrPrep3pzw" "" "_yes")
(setvar "cmdecho" OLDCE)
(setvar "osmode" OLDSN)
(princ)
)
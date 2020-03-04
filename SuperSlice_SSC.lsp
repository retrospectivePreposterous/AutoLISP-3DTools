;;;;;; Slice several Solids or Surfaces with a Polyline in Plan View.

(prompt "\nType SSC to run SuperSlice...\n")

(defun c:SSC (/ OLDCE SSET PL1 PL2 SRF CNT)

(prompt "\n***SuperSlice is an application developed by ALEJANDRO BURGUENO DIAZ***\n")
  (setq OLDCE (getvar "cmdecho"))
  (setvar "cmdecho" 0)

  (princ "\n Select solids or surfaces to be Sliced .. ")
  (setq SSET (ssget))
  (setq CNT -1)

  (setq PL1 (entsel "\n Select a 2D or 3D Polyline .. " ))


(command "_.copy" PL1 "" "0,0,0" "0,0,-2500000" "")
(setq PL2 (entlast))
(command "_.extrude" "_mode" "_surface" PL2 "" "_DIRECTION" "0,0,0" "0,0,5000000" "")
(setq SRF (entlast))

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))
	(command "_.slice" OBJ "" "_surface" SRF "")
)

(command "_erase" SRF "" "")
(command "_erase" PL2 "" "")


(setvar "cmdecho" OLDCE)
(princ)

)
 
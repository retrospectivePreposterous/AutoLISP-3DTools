;;;;;; Subtract several objects from multiple 2D objects in plan

(prompt "\nType SSH to run SuperHollow...\n")

(defun c:SSH (/ OLDCE SSET CNT SSETB EXTRUIDOS)
(prompt "\n***SuperHollow is an application developed by ALEJANDRO BURGUENO DIAZ***\n")

  (setq OLDCE (getvar "cmdecho"))
  (setvar "cmdecho" 0)

  (princ "\n Select solids, surfaces, and regions to subtract from .. ")
  (setq SSET (ssget))
  (setq CNT -1)

  (princ "\n Select closed polylines or 2D objects to subtract .. ")
  (setq SSETB (ssget))

 (entmake
   (list
     (cons 0 "LAYER")
     (cons 100 "AcDbSymbolTableRecord")
     (cons 100 "AcDbLayerTableRecord")
     '(2 . "xygh57wMX002315vvuiopw")		
     '(70 . 0)
     '(62 . 10)  				
     '(6 . "Continuous")
     )
   )

(command "_.laymch" SSETB "" "_name" "xygh57wMX002315vvuiopw" "")
(command "_.laymcur" SSETB "")
(command "_.move" SSETB "" "0,0,0" "0,0,-2500000" "")
(command "_.extrude" "_mode" "_solid" SSETB "" "_DIRECTION" "0,0,0" "0,0,5000000" "")
(setq EXTRUIDOS (ssget "_X" '((0 . "3DSOLID") (8 . "xygh57wMX002315vvuiopw"))))
(command "_.laymch" EXTRUIDOS "" "_name" "0" "")
(command "_.laymcur" EXTRUIDOS "")
(command "_.union" EXTRUIDOS  "")
(command "_.copybase" "0,0,0" EXTRUIDOS  "")

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))
(command "_.pasteclip" "0,0,0" "")
(command "_.subtract" OBJ "" "_last" "")
)
(setvar "cmdecho" OLDCE)
(command "_.laymch" EXTRUIDOS "" "_name" "xygh57wMX002315vvuiopw" "")
(command "_.laydel" EXTRUIDOS "" "_yes" "")
(princ)
)
 
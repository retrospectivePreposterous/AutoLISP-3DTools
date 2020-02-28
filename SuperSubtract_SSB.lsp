;;;;;; Subtract several objects from several elements WITHOUT MERGING THEM.

(prompt "\nType SSB to run SuperSubtract...")

(defun c:SSB (/ OLDCE SSET CNT SSETB)
(prompt "\n***SuperSubtract is an application developed by ALEJANDRO BURGUENO DIAZ***")
(setq OLDCE (getvar "cmdecho"))
(setvar "cmdecho" 0)

  (princ "\n Select solids, surfaces, and regions to subtract from .. ")
  (setq SSET (ssget))
  (setq CNT -1)

  (princ "\n Select solids, surfaces, and regions to subtract .. ")
  (setq SSETB (ssget))

(command "_.union" SSETB "")
(command "_.copybase" "0,0,0" SSETB "")
(command "_.erase" SSETB "")

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))
	(command "_.pasteclip" "0,0,0" "")
	(command "_.subtract" OBJ "" "_last" "")
 )
(setvar "cmdecho" OLDCE)
(princ)
)
 
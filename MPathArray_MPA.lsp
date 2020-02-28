;;;; Performs Multiple Path Arrays of a BLOCK.
;;;; Note the BLOCK must be facing RIGHT to properly get oriented automatically.

(prompt "\nType MPA to run MPathArray...")

(defun c:MPA (/ OLDCE SSET CNT OBJ)
(prompt "\n***MPathArray is an application developed by ALEJANDRO BURGUENO DIAZ***")

  (setq OLDCE (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  (princ "\n Select Paths: ")
  (setq SSET (ssget))
  (setq CNT -1)

(setq BBLOCK (vla-get-effectivename (vlax-ename->vla-object (car (entsel "\n Select block: ")))))
(setq BLENGTH (getdist (strcat "\n Distance from block origin to next block origin")))

(while (setq OBJ (ssname SSET (setq CNT (1+ CNT))))
	(command "_.measure" OBJ "_b" BBLOCK "_y" BLENGTH)
)

(setvar "cmdecho" OLDCE)
(princ)
)
 
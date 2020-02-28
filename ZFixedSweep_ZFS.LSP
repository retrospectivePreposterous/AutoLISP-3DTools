;;;;;; Sweep a rectangular shape MAINTAINING Z (not twisting) along several paths.

(prompt "\nType ZFS to run ZFixedSweep...")

(defun c:ZFS (/ OLDCE SSET CNT BOBJ BSURF BHEIGHT BWIDTH)
(prompt "\n***ZFixedSweep is an application developed by ALEJANDRO BURGUENO DIAZ***")
(setq BWIDTH (getdist (strcat "\n Enter Width value")))
(setq BHEIGHT (getdist (strcat "\n Enter Height value")))

  (setq OLDCE (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  (princ "\n Select Paths: ")
  (setq SSET (ssget))
  (setq CNT -1)


(while (setq BOBJ (ssname SSET (setq CNT (1+ CNT))))

	(command "_extrude" "_mode" "_surface" BOBJ "" BHEIGHT "")
	(command "_surfoffset" "_last" "" "_b" "_s" BWIDTH "")
	(command "_erase" BSURF "")
 )

(setvar "cmdecho" OLDCE)
(princ)
)
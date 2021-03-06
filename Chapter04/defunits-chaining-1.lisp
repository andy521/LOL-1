(in-package #:com.blogspot.beta-reduction.programs-that-program)

(defun defunits-chaining% (u units &optional (acc 1))
  (let ((spec (find u units :key #'car)))
    (if (null spec)
	(error "Unknown unit ~A" u)
	(let ((chain (cadr spec)))
	  (if (numberp chain)
	      (* chain acc)
	      (defunits-chaining% (cadr chain) units (* (car chain) acc)))))))

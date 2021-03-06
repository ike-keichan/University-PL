(defun rotate (x n)
    (cond
        ((= n 0) x)
        ((= n (length x)) x)
        ((< n 0) (rotate x (+ (length x) n)))
        ((> n 0) (rotate (append (cdr x) (car x)) (- n 1)))
    )
)
(clear)
(rotate '(1 2 3 4 5 6 7 8 9) 2)
(rotate '(1 2 3 4 5 6 7 8 9) -3)
(rotate '(1 2 3 4 5 6 7 8 9) 9)
(rotate '(1 2 3 4 5 6 7 8 9) -18)
(rotate '(1 2 3 4 5 6 7 8 9) 0)

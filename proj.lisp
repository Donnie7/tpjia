;#######################################
;variaveis globais
;#######################################
(setf l-tabuleiro 18)
(setf c-tabuleiro 10)


;#######################################
;2.1.1 Tipo Accao
;#######################################
(defun cria-accao (int array)
	(cons int array))

(defun accao-coluna (accao)
	(car accao))

(defun accao-peca (accao)
	(cdr accao))


;#######################################
;2.1.2 Tipo Tabuleiro
;#######################################
(defun cria-tabuleiro ()
	(make-array (list l-tabuleiro c-tabuleiro)))

(defun copia-tabuleiro (tab)
	(let* ((linhas (array-dimension tab 0))
 	       (colunas (array-dimension tab 1))
	       (novo-array (make-array (list linhas colunas) :initial-element T)))
	  (dotimes (l linhas)
	      (dotimes (c colunas)
		   (setf (aref novo-array l c) (aref tab l c))))novo-array))
		
(defun tabuleiro-preenchido-p (tab l c)
	(eq (aref tab l c) 'T))

(defun tabuleiro-altura-coluna (tab c)
	(let* ((linhas (array-dimension tab 0))
	       (i linhas ))
	   (dotimes (l linhas)
	       (cond ((eq (aref tab l c) T) (return)))
	       (decf i 1))
	  i))

(defun tabuleiro-linha-completa-p (tab l)
	(let* ((colunas (array-dimension tab 1))
	       (linha-total T))
	    (dotimes (c colunas)
		(cond ((eq (aref tab l c) nil) 
			   (setf linha-total nil)(return))))
	  linha-total))

(defun tabuleiro-preenche! (tab l c)
	(let* ((linhas (array-dimension tab 0))
	       (colunas (array-dimension tab 1))
	       (res 'passed))
	      (cond ((< c 0)nil)
		    ((> c (- colunas 1))nil)
		    ((< l 0)nil) 
		    ((> l (- linhas 1))nil)
		    ((setf (aref tab l c) T)T)))) 
		     

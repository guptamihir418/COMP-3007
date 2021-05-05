; Mihir Gupta
; 101172281

(define (make-graph)
(define Contents '())
(define true #t)
(define false #f)


; HELPER FUNCTIONS

;  This function is used to check if a Node exists in the given graph. Item1 is the Node and Item2 is the graph.
(define (utility_fun_A Item1 Item2)
  (cond ((zero? (length Item2)) false)
        ((equal? Item1 (caar Item2)) true)
        (else (utility_fun_A Item1 (cdr Item2)))))

; This function is used to check if an Item is a member of a given list. Item1 represents the item and Item2 represents the list.  
(define (utility_fun_B Item1 Item2)
  (cond ((zero? (length Item2)) false)
        ((equal? Item1 (car Item2)) true)
        (else (utility_fun_B Item1 (cdr Item2)))))

; This function is used to check if an edge is present in the graph. Item1 represents Node1, Item2 represents Node2 and Z represents the graph.
(define (utility_fun_C Item1 Item2 Z)
  (cond ((zero? (length Z)) false)
        ((and (equal? Item1 (caar Z)) (utility_fun_B Item2 (cadar Z))) true)
        (else (utility_fun_C Item1 Item2 (cdr Z)))))

; This function is used to add a edge in the graph. Item1 represents Node1, Item2 represents Node2 and Z represents the graph.
(define (utility_functionA Item1 Item2 Z)
  (cond ((zero? (length Z)) Z)
        ((equal? Item1 (caar Z)) (cons (cons Item1 (list (cons Item2 (cadar Z)))) (utility_functionA Item1 Item2 (cdr Z))))
        (else (cons (car Z) (utility_functionA Item1 Item2 (cdr Z))))))

; This function is used to delete a node from the graph. Item1 is the Node and Item2 is the graph. 
(define (utility_functionB Item1 Item2)
  (cond ((zero? (length Item2)) Item2)
        ((equal? Item1 (caar Item2)) (utility_functionB Item1 (cdr Item2)))
        (else (cons (cons (caar Item2) (list (utility_functionC Item1 (cadar Item2)))) (utility_functionB Item1 (cdr Item2))))))
  
; This function is used to delete a given item from a list. Item1 represents the item and Item2 represents the list. 
(define (utility_functionC Item1 Item2)
  (cond ((zero? (length Item2)) Item2)
        ((equal? Item1 (car Item2)) (utility_functionC Item1 (cdr Item2)))
        (else (cons (car Item2) (utility_functionC Item1 (cdr Item2))))))

; This function is used to delete an edge from the graph. Item1 represents Node1, Item2 represents Node2 and Z represents the graph. 
(define (utility_functionD Item1 Item2 Z)
  (cond ((zero? (length Z)) Z)
        ((equal? Item1 (caar Z)) (cons (cons Item1 (cons (utility_functionC Item2 (cadar Z)) '()))  (utility_functionD Item1 Item2 (cdr Z))))
        (else (cons (car Z) (utility_functionD Item1 Item2 (cdr Z))))))

; This function is used to display the edges of a given node.
(define (utility_functionE Item1)
  (cond ((zero? (length Item1)) (display ""))
        (else (display (car Item1)) (display " ") (utility_functionE (cdr Item1)))))
  
; This function is used to display the nodes and the edges of the given graph. Item1 represents the graph.
(define (displayUtil Item1)
  (cond ((zero? (length  Item1)) (display ""))
        (else (display (caar Item1)) (display ": ") (utility_functionE (reverse (cadar Item1))) (display "\n") (displayUtil (cdr Item1)))))




; REQUIRED FUNCTIONS
  
; This function will add a given node (symbol/value) to the graph if it does not already exist.
(define (funAddNode Item1)
  (cond ((utility_fun_A Item1 Contents) false)
        (else (set! Contents (cons (cons Item1 (cons '() '())) Contents)) true)))

; This function will add a directed edge from node x to node y in the graph if both nodes exist and the edge does not.
(define (funAddEdge Item1 Item2)
  (cond  ((and (utility_fun_A Item1 Contents) (utility_fun_A Item2 Contents) (not (utility_fun_C Item1 Item2 Contents)))
          (set! Contents (utility_functionA Item1 Item2 Contents)) true)
         (else false)))

; This function will remove the given node from the graph if it exists. All links to the given node should be removed as well.
(define (funRemoveNode Item1)
  (cond ((utility_fun_A Item1 Contents) (set! Contents (utility_functionB Item1 Contents)) true)
        (else false)))

; This function will remove the given edge from the graph if it exists. 
(define (funRemoveEdge Item1 Item2)
  (cond ((utility_fun_C Item1 Item2 Contents) (set! Contents (utility_functionD Item1 Item2 Contents)) true)
        (else false)))

; This will display the contents of the graph to the user in the format: "node: edge edge edge", one node per line.
(define (funDisplay) (displayUtil (reverse Contents)))

(define (main m) (cond
                   ((eq? m 'remove-node) funRemoveNode)
                   ((eq? m 'remove-edge) funRemoveEdge)
                   ((eq? m 'display) funDisplay)
                   ((eq? m 'add-node) funAddNode) ((eq? m 'add-edge) funAddEdge)
                   (else (lambda() (display "Command not valid: ") (display m) (display "\n"))))) main)



; Testing
(define Contents (make-graph))
((Contents 'add-node) 'a)       ;=> #t
((Contents 'add-node) 'b)       ;=> #t
((Contents 'add-node) 'c)       ;=> #t
((Contents 'add-node) 'a)       ;=> #f
((Contents 'add-edge) 'a 'b)    ;=> #t
((Contents 'add-edge) 'a 'c)    ;=> #t
((Contents 'add-edge) 'b 'b)    ;=> #t
((Contents 'add-edge) 'b 'c)    ;=> #t
((Contents 'add-edge) 'c 'd)    ;=> #f
((Contents 'display))           ;=>> a: b c
                              ;b: b c
                              ;c:
((Contents 'remove-edge) 'a 'c) ;=> #t
((Contents 'remove-node) 'c)    ;=> #t
((Contents 'display))           ;=>> a: b
                              ;b: b
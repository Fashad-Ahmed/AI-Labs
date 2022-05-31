cube :- write('Enter the number to cube: '),read(X),calc(X).
calc(stop) :- !.
calc(X) :- write('Answer: '),C is X*X*X,write(C),nl,cube. /* COMMENT! */


out :- write(hello), tab(1), write('there.'),nl.
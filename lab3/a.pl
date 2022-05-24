male(pat).
male(tom).
male(bob).
male(cash).
male(john).

female(ann).
female(pam).


parent(tom,bob).
parent(tom,cash).
parent(bob,ann).
parent(bob,pat).
parent(cash,john).

mother(X,Y):-parent(X,Y),female(X).
father(X,Y):-parent(X,Y),male(X).
sister(X,Y):-parent(Z,X),parent(Z,Y),female(X),X\==Y.
brother(X,Y):-parent(Z,X),parent(Z,Y),male(X),X\==Y.
haschild(X):-parent(X,_).
grandparent(X,Y):- parent(X,Z),parent(Z,Y).
grandmother(X,Y):-mother(X,Y),parent(Y,Z).
grandfather(X,Y):-father(X,Y),parent(Y,Z).
sibling(X,Y):-parent(Z,X),parent(Z,Y),X\==Y.
daughter(X,Y):-parent(Y,X),female(X).
son(X,Y):-parent(Y,X),male(X).
uncle(X,Y):-brother(X,P),parent(P,Y).
aunt(X,Y):-sister(X,P),parent(P,Y).
cousin(X,Y):-grandparent(Z,Y),grandparent(Z,Y),X\==Y.
husband(X,Y):-father(X,Z),mother(Y,Z),male(X),female(Y).
wife(X,Y) :- father(X,Z),mother(Y,Z), female(X),male(Y).
uncle(X,Z) :- brother(X,Y), parent(Y,Z).
stepfather(X,Y):-mother(Y,A),wife(Y,X),father(K,Y),K\==X, male(X).
stepmother(X,Y):-father(Y,A),husband(Y,X),female(X).
stepbrother(X,Y):-father(Y,A);mother(Y,A),sibling(Y,X),male(X).
stepsister(X,Y):-father(Y,A);mother(Y,A),sibling(Y,X),female(X).
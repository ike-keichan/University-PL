?-remove.
hanoi(N) :-
        hanoi(N,left,right,center).
hanoi(1,X,Y,Z) :-
        move(1,X,Y).
hanoi(N,X,Y,Z) :-
        -(N, 1, M),
        hanoi(M, X, Z, Y),
        move(N, X, Y),
        hanoi(M, Z, Y, X).
move(N,X,Y) :-
        write("move disc-"),
        write(N),
        write(" from "),
        write(X),
        write(" to "),
        write(Y),
        nl.
?- clear, listing.
?- hanoi(3).

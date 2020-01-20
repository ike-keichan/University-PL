?- remove.
connect(entrance,a).
connect(a,b).
connect(a,d).
connect(b,c).
connect(b,e).
connect(c,f).
connect(d,e).
connect(e,f).
connect(d,exit).
connect(f, exit).
route(exit,P,R) :- 
        reverse(P,R).
route(X,P,R) :- 
	connect(X, Next),
        not(member(Next, P)),
        route(Next, [Next|P], R).
route(X,P,R) :- 
        connect(Next, X),
   	not(member(Next, P)),
        route(Next, [Next|P], R).
route(R) :- 
        route(entrance,[entrance],R).
?- clear.
?- route(X).


?- remove.
connect(entrance,a).
connect(a,b).
connect(a,h).
connect(b,c).
connect(b,i).
connect(c,j).
connect(d,e).
connect(d,k).
connect(e,f).
connect(f,g).
connect(f,m).
connect(h,i).
connect(h,o).
connect(i,j).
connect(j,k).
connect(j,q).
connect(k,l).
connect(k,r).
connect(m,n).
connect(m,t).
connect(p,w).
connect(r,y).
connect(s,t).
connect(s,z).
connect(t,u).
connect(v,w).
connect(w,x).
connect(x,y).
connect(v,exit).
connect(z,exit).
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


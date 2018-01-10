rule(sasiad(A,B) => sasiad(B,A)).
rule(not_sasiad(A,B) => not_sasiad(B,A)).
rule(lezy_miedzy(X,Y,Z) => lezy_miedzy(X,Z,Y)).
rule(sasiad(X,Y) and sasiad(X,Z) and not_sasiad(Y,Z) => lezy_miedzy(X,Y,Z)).
rule(stolica(A,B) => lezy_w(A,B)).
rule(not_lezy_w(A,Z) => not_stolica(A,Z)).
rule(lezy_w(A,B) => not_sasiad(A,B)).
rule(stolica(A,B) and lezy_w(B,C) => lezy_w(A,C)).
rule(lezy_miedzy(X,Y,Z) and stolica(A,X) and noeq(Y,Z) => not_stolica(A,Z)).
rule(noeq(A,B) => noeq(B,A)).

/*
declared(Opole).
declared(woj_slaskie).
declared(woj_dolnoslaskie).
declared(woj_opolskie).
declared(polska).*/

fact(sasiad(opolskie,dolnoslaskie)).
fact(sasiad(slaskie,opolskie)).
fact(not_sasiad(dolnoslaskie,slaskie)).
fact(stolica(opole,opolskie)).
fact(lezy_w(opolskie,polska)).
fact(noeq(opolskie,dolnoslaskie)).
fact(noeq(opolskie,slaskie)).
fact(noeq(slaskie,dolnoslaskie)).
fact(noeq(opole,opolskie)).
fact(noeq(opole,dolnoslaskie)).
fact(noeq(opole,slaskie)).
fact(noeq(opole,polska)).
fact(noeq(polska,slaskie)).
fact(noeq(polska,dolnoslaskie)).
fact(noeq(polska,opolskie)).

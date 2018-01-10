:- dynamic used/1.

:- op(800,xfx,=>).
:- op(300,xfy,and).

:- consult('rules.pl').
:- consult('facts.pl').

write_proved(X) :- write(X), write(" is proved"), nl.
write_true(X) :- write(X), write(" is true"), nl.

backward(X) :- backward(X,[]).
backward(X) :- fact(X), nl, write_true(X).
backward(X,Used) :- fact(X).
backward(X,Used) :- rule(Y => X), \+member(Y => X,Used), add_elem(Used,Y => X,Newused), backward(Y,Newused), \+fact(X), assert(fact(X)), write_proved(X).
backward(X and Y,Used) :- backward(X,Used), backward(Y,Used).

forward(X) :- (search -> true; fact(X), nl, write_true(X)).
search :- new_fact(Y), !, assert(fact(Y)), write_proved(Y), search.

new_fact(X) :- provable(_=>X), \+fact(X).

provable(X=>Y) :- rule(X=>Y), satisfied(X).

satisfied(X) :- fact(X).
satisfied(X and Y) :- satisfied(X), satisfied(Y).

add_elem(List,X,Newlist) :- bagof(Y,add_fun(Y,X,List),Newlist).
add_fun(Y,X,List) :- member(Y,List); Y=X.



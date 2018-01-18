:- op(800,xfx,=>).	%dodatkowy operator implikacji
:- op(300,xfy,and).	%dodatkowy operator koniunkcji

:- consult('rules.pl').
:- consult('facts.pl').

write_proved(X) :- write(X), write(" is proved"), nl.
write_true(X) :- write(X), write(" is true"), nl.

%%%%%%%%%%%%%%%%%%%%%%   Wnioskowanie wstecz  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
backward(X) :- backward(X,[]).							%inicjuje obliczenia
backward(X) :- fact(X), nl, write_true(X).					%wypisuje wynik

backward(X,Used) :- fact(X).							%zwraca prawdę dla już udowodnionych

backward(X,Used) :- rule(Y => X), 						%szuka reguły dowodzącej
                    \+member(Y => X,Used), add_elem(Used,Y => X,Newused), 	%sprawdza i uzupełnia zbiór użytych reguł
                    backward(Y,Newused), 					%próbuje dowieść hipotezę
                    \+fact(X), assert(fact(X)), write_proved(X).		%dodaje nowy fakt, jeśli go nie było

backward(X and Y,Used) :- backward(X,Used), backward(Y,Used).			%rozbija koniunkcję
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%  Wnisokowanie w przód  %%%%%%%%%%%%%%%%%%%%%%%%%%%% 
forward(X) :- (search -> true; fact(X), nl, write_true(X)).			%inicjuje obliczenia, wypisuje wynik
search :- new_fact(Y), !, assert(fact(Y)), write_proved(Y), search.		%właściwa pętla dowodząca kolejne fakty

new_fact(X) :- provable(_=>X), \+fact(X).					%szuka nowego faktu, który daje się dowieść

provable(X=>Y) :- rule(X=>Y), satisfied(X).					%sprawdza możliwość dowiedzenia stwierdzenia

satisfied(X) :- fact(X).							%
satisfied(X and Y) :- satisfied(X), satisfied(Y).				%razem sprawdzają prawdziwość zbioru faktów połączonych koniunkcją
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%  Funkcja pomocnicza (dodaje element do listy)  %%%%%%%%%%%%%%
add_elem(List,X,Newlist) :- bagof(Y,add_fun(Y,X,List),Newlist).			
add_fun(Y,X,List) :- member(Y,List); Y=X.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


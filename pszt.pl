/*i (,)
lub (;)*/

/*by mieć mozliwość dodawania lub usuwania faktow*/
 
:- dynamic lezy/2.
:- dynamic not_lezy/2. 
:- dynamic sasiad_woj/2. 
:- dynamic stolica/2.
:- dynamic not_stolica/2. 
:- dynamic lezy_pomiedzy/3.
:- dynamic drawinski_PK/3.

print_facts :- write('Fakty'), nl, 
write('sasiad_woj(mazowieckie, podlaskie)'), nl, 
write('stolica(warszawa, mazowieckie)'), nl,
write('drawinski_PK(lubuskie, zachodniopomorskie, wielkopolskie)').

sasiad_woj(mazowieckie, podlaskie).
sasiad_woj(mazowieckie, lodzkie).
stolica(warszawa, mazowieckie).
drawinski_PK(lubuskie, zachodniopomorskie, wielkopolskie).

/*assert (fact(c)) dodaje fact(c) do znanych faktów*/

klauzula(1) :- stolica(warszawa, mazowieckie), assert(lezy(warszawa, mazowieckie)), 
write('Dowod lezy(Warszawa, mazowieckie)'), nl.
klauzula(2) :- sprawdz(klauzula_1), assert(lezy(warszawa, polska)), 
write('Dowod lezy(Warszawa, Polska)'), nl.
klauzula(3) :- stolica(warszawa, mazowieckie), sprawdz(klauzula_2), assert(lezy(mazowieckie, polska)),
write('Dowod lezy(mazowieckie, Polska)'), nl.
klauzula(4) :- sasiad_woj(mazowieckie, podlaskie), sprawdz(klauzula_3), assert(lezy(podlaskie, polska)),
write('Dowod lezy(podlaskie, Polska)'), nl.
klauzula(5) :- stolica(warszawa, mazowieckie), sasiad_woj(mazowieckie, podlaskie), assert(not_stolica(warszawa, podlaskie)), 
write('Dowod not stolica(warszawa, podlaskie)'), nl.
klauzula(6) :- stolica(warszawa, mazowieckie), sprawdz(klauzula_5), assert(not_lezy(warszawa, podlaskie)), 
write('Dowod not lezy(Warszawa, podlaskie)'), nl.
klauzula(7) :- sasiad_woj(mazowieckie, podlaskie), assert(not_lezy(mazowieckie, podlaskie)), 
write('Dowod not lezy(mazowieckie, podlaskie)'), nl.
klauzula(8) :- sasiad_woj(mazowieckie, podlaskie), sasiad_woj(mazowieckie, lodzkie), not(sasiad_woj(lodzkie, podlaskie)), assert(lezy_pomiedzy(mazowieckie, lodzkie, podlaskie)), write('Dowod lezy_pomiedzy(mazowieckie, lodzkie, podlaskie)'), nl.
klauzula(9) :- sprawdz(klauzula_8), stolica(warszawa, mazowieckie), assert(not_stolica(warszawa, lodzkie)), 
write('Dowod not stolica(warszawa, lodzkie)'), nl.
klauzula(10) :- drawinski_PK(lubuskie, zachodniopomorskie, wielkopolskie), assert(sasiad_woj(lubuskie, zachodniopomorskie)),
write('Dowod sasiad_woj(lubuskie, zachodniopomorskie)'), nl.
klauzula(11) :- drawinski_PK(lubuskie, zachodniopomorskie, wielkopolskie), assert(sasiad_woj(lubuskie, wielkopolskie)),
write('Dowod sasiad_woj(lubuskie, wielkopolskie)'), nl.
klauzula(12) :- drawinski_PK(lubuskie, zachodniopomorskie, wielkopolskie), sprawdz(klauzula_10), sprawdz(klauzula_11), assert(sasiad_woj(zachodniopomorskie, wielkopolskie)), write('Dowod sasiad_woj(zachodniopomorskie, wielkopolskie)'), nl.


sprawdz(klauzula_1) :- lezy(warszawa, mazowieckie) -> true ; klauzula(1).
sprawdz(klauzula_2) :- lezy(warszawa, polska) -> true ; klauzula(2).
sprawdz(klauzula_3) :- lezy(mazowieckie, polska) -> true ; klauzula(3).
sprawdz(klauzula_4) :- lezy(podlaskie, polska) -> true ; klauzula(4).
sprawdz(klauzula_5) :- not_stolica(warszawa, podlaskie) -> true ; klauzula(5).
sprawdz(klauzula_6) :- not_lezy(warszawa, podlaskie) -> true ; klauzula(6).
sprawdz(klauzula_7) :- not_lezy(mazowieckie, podlaskie) -> true ; klauzula(7).
sprawdz(klauzula_8) :- lezy_pomiedzy(mazowieckie, lodzkie, podlaskie) -> true ; klauzula(8).
sprawdz(klauzula_9) :- not_stolica(warszawa, lodzkie) -> true ; klauzula(9).
sprawdz(klauzula_10) :- sasiad_woj(lubuskie, zachodniopomorskie) -> true ; klauzula(10).
sprawdz(klauzula_11) :- sasiad_woj(lubuskie, wielkopolskie) -> true ; klauzula(11).
sprawdz(klauzula_12) :- sasiad_woj(zachodniopomorskie, wielkopolskie) -> true ; klauzula(12).

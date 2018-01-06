# PSZT
Prolog

Instalacja prologa:
sudo apt-get update
sudo apt-get install swi-prolog

Uruchomienie programu:
prolog pszt.pl

Następnie w konsoli:
- wywołanie faktów:
print_facts.
- wnioskowanie w przód:
sprawdz(X). %po każdym wyniku ;
            %jeżeli prolog skończy wnioskowanie to po ostatniej komendzie postawi .
- wnioskowanie w tył (przykład):
sprawdz(klauzula(6).

Natychmiastowe przerwanie programu: Ctr+z

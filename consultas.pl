:- consult('reglas.pl').

menu2 :- write('*** Menu de Consultas ***'), nl,
         write('1. Planetas con vida basica.'), nl,
         write('2. Planetas con vida compleja.'), nl,
         write('3. Planetas con vida inteligente.'), nl,
         write('4. Planetas habitables.'), nl,
         write('5. Planetas con civilizaciones avanzadas.'), nl,
         write('6. Volver'), nl,
         write('Selecciona una opcion: (1-6): '),
         read(Option), consultas(Option).

consultas(1) :- writeln('*** Planetas con vida basica ***'),
                (inferir(vida_basica, _) -> %si se encuentran planetas se ejecuta el bloque...
                    forall(inferir(vida_basica, Planeta), format('~w~n', [Planeta])) %para cada vez que se cumpla la consulta, ejecuta format...
                    ; % si no hay planetas ejecutar este otro bloque...
                    writeln('No se encontraron planetas con vida basica...')),
                    nl, menu2.


consultas(2) :- write('seleccionaste la consulta 2'), nl, menu2.
consultas(3) :- write('seleccionaste la consulta 3'), nl, menu2.
consultas(4) :- write('seleccionaste la consulta 4'), nl, menu2.
consultas(5) :- write('seleccionaste la consulta 5'), nl, menu2.
consultas(_) :- write('Volviendo al inicio...'), nl, menu.





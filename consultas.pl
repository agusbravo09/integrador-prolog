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


consultas(2) :- writeln('*** Planetas con vida compleja ***'),
                (inferir(vida_compleja, _) ->
                    forall(inferir(vida_compleja, Planeta), format('~w~n', [Planeta]))
                    ;
                    writeln('No se encontraron planetas con vida compleja...')),
                nl, menu2.

consultas(3) :- writeln('*** Planetas con vida inteligente ***'),
                (inferir(vida_inteligente, _) ->
                    forall(inferir(vida_inteligente, Planeta), format('~w~n', [Planeta]))
                    ;
                    writeln('No se encontraron planetas con vida inteligente...')),
                nl, menu2.
                
consultas(4) :- writeln('*** Planetas habitables ***'),
                (inferir(habitable, _) ->
                    forall(inferir(habitable, Planeta), format('~w~n', [Planeta]))
                    ;
                    writeln('No se encontraron planetas que sean habitables...')),
                nl, menu2.
                
consultas(5) :- writeln('*** Planetas con civilizaciones avanzadas ***'),
                (inferir(civilizacion_avanzada, _) ->
                    forall(inferir(civilizacion_avanzada, Planeta), format('~w~n', [Planeta]))
                    ;
                    writeln('No se encontraron planetas con civilizaciones avanzadas...')),
                nl, menu2.
                
consultas(_) :- write('Volviendo al menu principal...'), nl, menu.


menu_explicaciones :-
    write('*** Menu de Explicaciones ***'), nl,
    write('1. Explicar vida basica de un planeta'), nl,
    write('2. Explicar vida compleja de un planeta'), nl,
    write('3. Explicar vida inteligente de un planeta'), nl,
    write('4. Explicar habitabilidad de un planeta'), nl,
    write('5. Volver'), nl,
    write('Selecciona una opcion: (1-5): '),
    read(Option), explicaciones(Option).

explicaciones(1) :- ingresar_planeta(Planeta), hola(Planeta).
explicaciones(2) :- writeln('ni idea ajaj').
explicaciones(3) :- writeln('ni idea ajaj').
explicaciones(4) :- writeln('ni idea ajaj').
explicaciones(5) :- writeln('Volviendo al menu principal... '), menu.



ingresar_planeta(Planeta) :- writeln('Escriba el nombre del planeta: '), read(Planeta).



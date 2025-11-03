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
                
consultas(6) :- write('Volviendo al menu principal...'), nl, menu.
consultas(_) :- writeln('La opcion ingresada no es valida... Pruebe nuevamente'), nl, menu2.


menu_explicaciones :-
    write('*** Menu de Explicaciones ***'), nl,
    write('1. Explicar vida basica de un planeta'), nl,
    write('2. Explicar vida compleja de un planeta'), nl,
    write('3. Explicar vida inteligente de un planeta'), nl,
    write('4. Explicar habitabilidad de un planeta'), nl,
    write('5. Explicar civilizacion avanzada de un planeta'), nl,
    write('6. Volver'), nl,
    write('Selecciona una opcion: (1-5): '),
    read(Option), explicaciones(Option).

explicaciones(1) :- ingresar_planeta(Planeta), por_que(vida_basica, Planeta, _Explicacion).
explicaciones(2) :- ingresar_planeta(Planeta), por_que(vida_compleja, Planeta, _Explicacion).
explicaciones(3) :- ingresar_planeta(Planeta), por_que(vida_inteligente, Planeta, _Explicacion).
explicaciones(4) :- ingresar_planeta(Planeta), por_que(habitable, Planeta, _Explicacion).
explicaciones(5) :- ingresar_planeta(Planeta), por_que(civilizacion_avanzada, Planeta, _Explicacion).
explicaciones(6) :- writeln('Volviendo al menu principal... '), menu.
explicaciones(_) :- writeln('La opcion ingresada no es valida... Pruebe nuevamente'), menu_explicaciones.

ingresar_planeta(Planeta) :- writeln('Escriba el nombre del planeta: '), read(Planeta).

% Explicaciones

% hago uso de If-Else
% la estructura es asi (Condicion -> true ; false)

por_que(vida_basica, Planeta, Explicacion) :-
    writeln('*** ANALIZANDO VIDA BASICA ***'),
    (vida_basica(Planeta) ->
        writeln('El planeta TIENE vida basica porque:'),
        tiene_hecho(Planeta, tiene_atmosfera),
        tiene_hecho(Planeta, tiene_agua_liquida),
        tiene_hecho(Planeta, tiene_elementos_biogenicos),
        Explicacion = 'El planeta tiene vida basica'
    ;
        writeln('El planeta NO tiene vida basica porque:'),
        tiene_hecho(Planeta, tiene_atmosfera),
        tiene_hecho(Planeta, tiene_agua_liquida),
        tiene_hecho(Planeta, tiene_elementos_biogenicos),
        Explicacion = 'El planeta no tiene vida basica'
    ).
    
por_que(vida_compleja, Planeta, Explicacion) :-
    writeln('*** ANALIZANDO VIDA COMPLEJA ***'),
    (vida_compleja(Planeta) ->
        writeln('El planeta TIENE vida compleja porque:'),
        por_que_simplificado(vida_basica, Planeta),
        tiene_hecho(Planeta, tiene_evolucion_biologica),
        tiene_hecho(Planeta, tiene_superficie_solida),
        Explicacion = 'El planeta tiene vida compleja'
    ;
        writeln('El planeta NO tiene vida compleja porque:'),
        por_que_simplificado(vida_basica, Planeta),
        tiene_hecho(Planeta, tiene_evolucion_biologica),
        tiene_hecho(Planeta, tiene_superficie_solida),
        Explicacion = 'El planeta no tiene vida compleja'
    ).
    
por_que(vida_inteligente, Planeta, Explicacion) :-
    writeln('*** ANALIZANDO VIDA INTELIGENTE ***'),
    (vida_inteligente(Planeta) ->
        writeln('El planeta TIENE vida inteligente porque:'),
        por_que_simplificado(vida_compleja, Planeta),
        tiene_hecho(Planeta, tiene_tecnologia),
        Explicacion = 'El planeta tiene vida inteligente'
    ;
        writeln('El planeta NO tiene vida inteligente porque:'),
        por_que_simplificado(vida_compleja, Planeta),
        tiene_hecho(Planeta, tiene_tecnologia),
        Explicacion = 'El planeta no tiene vida inteligente'
    ).
    
por_que(habitable, Planeta, Explicacion) :-
    writeln('*** ANALIZANDO HABITABILIDAD ***'),
    (habitable(Planeta) ->
        writeln('El planeta es habitable porque:'),
        tiene_hecho(Planeta, tiene_atmosfera),
        tiene_hecho(Planeta, tiene_magnetosfera),
        tiene_hecho(Planeta, tiene_gravedad_estable),
        tiene_hecho(Planeta, tiene_ciclo_dia_noche),
        Explicacion = 'El planeta es habitable'
    ;
        writeln('El planeta NO es habitable porque:'),
        tiene_hecho(Planeta, tiene_atmosfera),
        tiene_hecho(Planeta, tiene_magnetosfera),
        tiene_hecho(Planeta, tiene_gravedad_estable),
        tiene_hecho(Planeta, tiene_ciclo_dia_noche),
        Explicacion = 'El planeta no es habitable'
    ).
    
por_que(civilizacion_avanzada, Planeta, Explicacion) :-
    writeln('*** ANALIZANDO CIVILIZACION AVANZADA ***'),
    (vida_basica(Planeta) ->
        writeln('El planeta TIENE una civlizacion avanzada porque:'),
        por_que_simplificado(vida_inteligente, Planeta),
        por_que_simplificado(habitable, Planeta),
        tiene_hecho(Planeta, tiene_luz_solar),
        Explicacion = 'El planeta tiene una civilizacion avanzada'
    ;
        writeln('El planeta NO tiene una civilizacion avanzada porque:'),
        por_que_simplificado(vida_inteligente, Planeta),
        por_que_simplificado(habitable, Planeta),
        tiene_hecho(Planeta, tiene_luz_solar),
        Explicacion = 'El planeta no tiene una civilizacion avanzada'
    ).

% simplificar ifs en las consultas por_que
tiene_hecho(Planeta, Hecho) :-
    (planeta(Planeta, Hecho) ->
        writeln(Hecho)
    ;
        write('No '), writeln(Hecho)
    ).

% explicaciones simplificadas.
por_que_simplificado(vida_basica, Planeta) :-
    (vida_basica(Planeta) ->
     writeln('Tiene vida basica.')
     ;
     writeln('No tiene vida basica.')
    ).
por_que_simplificado(vida_compleja, Planeta) :-
    (vida_compleja(Planeta) ->
     writeln('Tiene vida compleja.')
     ;
     writeln('No tiene vida compleja.')
    ).
por_que_simplificado(vida_inteligente, Planeta) :-
    (vida_inteligente(Planeta) ->
     writeln('Tiene vida inteligente.')
     ;
     writeln('No tiene vida inteligente.')
    ).
por_que_simplificado(habitable, Planeta) :-
    (habitable(Planeta) ->
     writeln('Es habitable.')
     ;
     writeln('No es habitable.')
    ).
por_que_simplificado(civilizacion_avanzada, Planeta) :-
    (civilizacion_avanzada(Planeta) ->
     writeln('Tiene una civilizacion_avanzada.')
     ;
     writeln('No tiene una civilizacion_avanzada.')
    ).

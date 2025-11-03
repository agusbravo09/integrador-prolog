% =========================================================
% MENU DE CONSULTAS (Punto 3 en Menu Principal)
% =========================================================
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
                
consultas(6) :- write('Volviendo al menu principal...'), nl, integrador:menu.
consultas(_) :- writeln('La opcion ingresada no es valida... Pruebe nuevamente'), nl, menu2.

% =========================================================
% MENU DE EXPLICACIONES (Punto 4 en Menu Principal)
% =========================================================
menu_explicaciones :-
    write('*** Menu de Explicaciones ***'), nl,
    write('1. Explicar vida basica de un planeta'), nl,
    write('2. Explicar vida compleja de un planeta'), nl,
    write('3. Explicar vida inteligente de un planeta'), nl,
    write('4. Explicar habitabilidad de un planeta'), nl,
    write('5. Explicar civilizacion avanzada de un planeta'), nl,
    write('6. Volver al menu principal'), nl,
    write('Selecciona una opcion: (1-6): '),
    read(Option), ejecutar_explicacion(Option).

explicaciones(1) :- ingresar_planeta(Planeta), por_que(vida_basica, Planeta, _Explicacion).
explicaciones(2) :- ingresar_planeta(Planeta), por_que(vida_compleja, Planeta, _Explicacion).
explicaciones(3) :- ingresar_planeta(Planeta), por_que(vida_inteligente, Planeta, _Explicacion).
explicaciones(4) :- ingresar_planeta(Planeta), por_que(habitable, Planeta, _Explicacion).
explicaciones(5) :- ingresar_planeta(Planeta), por_que(civilizacion_avanzada, Planeta, _Explicacion).
explicaciones(6) :- writeln('Volviendo al menu principal... '), nl, integrador:menu.
explicaciones(_) :- writeln('La opcion ingresada no es valida... Pruebe nuevamente'), menu_explicaciones.

ejecutar_explicacion(Opcion) :-
    Opcion >= 1, Opcion =< 5,
    write('Ingrese el nombre del planeta (ej: tierra): '),
    read(Planeta),
    (Opcion = 1 -> Condicion = vida_basica;
     Opcion = 2 -> Condicion = vida_compleja;
     Opcion = 3 -> Condicion = vida_inteligente;
     Opcion = 4 -> Condicion = habitable;
     Opcion = 5 -> Condicion = civilizacion_avanzada),

    % *** Se llama al predicado que desea usar ***
    writeln('--- Explicacion Simplificada (por_que/3) ---'),
    por_que(Condicion, Planeta, _),

    nl,
    writeln('--- Explicacion Detallada (demostrar/2) ---'),
    demostrar(Condicion, Planeta), % Llamada a la nueva demostracion recursiva

    nl,
    menu_explicaciones.
ejecutar_explicacion(_) :- write('Opcion no valida. Intente de nuevo.'), nl, menu_explicaciones.

% Explicaciones

% hago uso de If-Else
% la estructura es asi (Condicion -> true ; false)
% =========================================================
% PREDICADOS DE EXPLICACIÓN SIMPLIFICADA (por_que/3)
% =========================================================

% Predicados para la explicación simplificada que verifica las sub-condiciones directas.

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
    (civilizacion_avanzada(Planeta) ->
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

% Predicado auxiliar: Imprime si un hecho está presente o ausente.
tiene_hecho(Planeta, Hecho) :-
    (planeta(Planeta, Hecho) ->
        format('Tiene ~w~n', [Hecho])
    ;
        format('No tiene ~w~n', [Hecho])
    ).

% Predicados auxiliares: Imprime si la condición de vida simplificada es True/False.
por_que_simplificado(Condicion, Planeta) :-
    (call(Condicion, Planeta) ->
     format('Cumple con ~w~n', [Condicion])
     ;
     format('No cumple con ~w~n', [Condicion])
    ).
    
% =========================================================
% PREDICADOS DE DEMOSTRACIÓN RECURSIVA (demostrar/2)
% =========================================================
% 1. Punto de entrada: Verifica la inferencia e inicia la traza.
demostrar(Condicion, Planeta) :-
    Goal =.. [Condicion, Planeta],

    (call(Goal) ->
        writeln('*** La condicion es VERDADERA. Traza: ***'),
        demostrar_recursivo(Condicion, Planeta)
    ;
        writeln('*** La condicion es FALSA. No hay traza de éxito. ***')
    ).

% 2. Predicado de Caso Base: Imprime los hechos que provienen del CSV.
demostrar_hecho(Planeta, Hecho) :-
    planeta(Planeta, Hecho),
    format('  Hecho_Base: ~w~n', [Hecho]).

% 3. Casos Recursivos: Define el flujo de la inferencia para cada regla compleja.

% Caso: Civilización Avanzada
demostrar_recursivo(civilizacion_avanzada, Planeta) :-
    civilizacion_avanzada(Planeta),
    format('Inferido: ~w~n', [civilizacion_avanzada]),
    demostrar_recursivo(vida_inteligente, Planeta),
    demostrar_recursivo(habitable, Planeta),
    demostrar_hecho(Planeta, tiene_luz_solar).

% Caso: Vida Inteligente
demostrar_recursivo(vida_inteligente, Planeta) :-
    vida_inteligente(Planeta),
    format('Inferido: ~w~n', [vida_inteligente]),
    demostrar_recursivo(vida_compleja, Planeta),
    demostrar_hecho(Planeta, tiene_tecnologia).

% Caso: Vida Compleja
demostrar_recursivo(vida_compleja, Planeta) :-
    vida_compleja(Planeta),
    format('Inferido: ~w~n', [vida_compleja]),
    demostrar_recursivo(vida_basica, Planeta),
    demostrar_hecho(Planeta, tiene_evolucion_biologica),
    demostrar_hecho(Planeta, tiene_superficie_solida).

% Caso: Vida Básica (último paso antes de hechos base)
demostrar_recursivo(vida_basica, Planeta) :-
    vida_basica(Planeta),
    format('Inferido: ~w~n', [vida_basica]),
    demostrar_hecho(Planeta, tiene_atmosfera),
    demostrar_hecho(Planeta, tiene_agua_liquida),
    demostrar_hecho(Planeta, tiene_elementos_biogenicos).

% Caso: Habitable
demostrar_recursivo(habitable, Planeta) :-
    habitable(Planeta),
    format('Inferido: ~w~n', [habitable]),
    demostrar_hecho(Planeta, tiene_atmosfera),
    demostrar_hecho(Planeta, tiene_magnetosfera),
    demostrar_hecho(Planeta, tiene_gravedad_estable),
    demostrar_hecho(Planeta, tiene_ciclo_dia_noche).

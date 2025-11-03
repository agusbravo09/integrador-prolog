%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Archivo de pruebas generado por DeepSeek %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- consult('cargar_datos.pl').
:- consult('reglas.pl').
:- consult('consultas.pl').

% PRUEBAS DEL SISTEMA DE INFERENCIA

% Predicado principal para ejecutar todas las pruebas
ejecutar_pruebas :-
    writeln('=== INICIANDO PRUEBAS DEL SISTEMA ==='),
    nl,
    cargar_planetas,
    nl,
    prueba_vida_basica,
    nl,
    prueba_vida_compleja,
    nl,
    prueba_vida_inteligente,
    nl,
    prueba_habitabilidad,
    nl,
    prueba_civilizacion_avanzada,
    nl,
    prueba_planetas_inexistentes,
    nl,
    writeln('=== TODAS LAS PRUEBAS COMPLETADAS ===').

% PRUEBA 1: Vida básica
prueba_vida_basica :-
    writeln('--- PRUEBA VIDA BASICA ---'),

    % Planeta que SÍ tiene vida básica
    writeln('1. Planetas que DEBERIAN tener vida basica:'),
    (vida_basica(tierra) ->
        writeln('? TIERRA: CORRECTO - tiene vida basica')
    ;
        writeln('? TIERRA: ERROR - deberia tener vida basica')
    ),
    (vida_basica(kepler452b) ->
        writeln('? KEPLER452B: CORRECTO - tiene vida basica')
    ;
        writeln('? KEPLER452B: ERROR - deberia tener vida basica')
    ),

    nl,
    writeln('2. Planetas que NO DEBERIAN tener vida basica:'),
    (\+ vida_basica(marte) ->
        writeln('? MARTE: CORRECTO - no tiene vida basica')
    ;
        writeln('? MARTE: ERROR - no deberia tener vida basica')
    ),
    (\+ vida_basica(venus) ->
        writeln('? VENUS: CORRECTO - no tiene vida basica')
    ;
        writeln('? VENUS: ERROR - no deberia tener vida basica')
    ),
    (\+ vida_basica(europa) ->
        writeln('? EUROPA: CORRECTO - no tiene vida basica')
    ;
        writeln('? EUROPA: ERROR - no deberia tener vida basica')
    ).

% PRUEBA 2: Vida compleja
prueba_vida_compleja :-
    writeln('--- PRUEBA VIDA COMPLEJA ---'),

    writeln('1. Planetas que DEBERIAN tener vida compleja:'),
    (vida_compleja(tierra) ->
        writeln('? TIERRA: CORRECTO - tiene vida compleja')
    ;
        writeln('? TIERRA: ERROR - deberia tener vida compleja')
    ),
    (vida_compleja(kepler452b) ->
        writeln('? KEPLER452B: CORRECTO - tiene vida compleja')
    ;
        writeln('? KEPLER452B: ERROR - deberia tener vida compleja')
    ),

    nl,
    writeln('2. Planetas que NO DEBERIAN tener vida compleja:'),
    (\+ vida_compleja(marte) ->
        writeln('? MARTE: CORRECTO - no tiene vida compleja')
    ;
        writeln('? MARTE: ERROR - no deberia tener vida compleja')
    ),
    (\+ vida_compleja(venus) ->
        writeln('? VENUS: CORRECTO - no tiene vida compleja')
    ;
        writeln('? VENUS: ERROR - no deberia tener vida compleja')
    ),
    (\+ vida_compleja(europa) ->
        writeln('? EUROPA: CORRECTO - no tiene vida compleja')
    ;
        writeln('? EUROPA: ERROR - no deberia tener vida compleja')
    ).

% PRUEBA 3: Vida inteligente
prueba_vida_inteligente :-
    writeln('--- PRUEBA VIDA INTELIGENTE ---'),

    writeln('1. Planetas que DEBERIAN tener vida inteligente:'),
    (vida_inteligente(tierra) ->
        writeln('? TIERRA: CORRECTO - tiene vida inteligente')
    ;
        writeln('? TIERRA: ERROR - deberia tener vida inteligente')
    ),
    (vida_inteligente(kepler452b) ->
        writeln('? KEPLER452B: CORRECTO - tiene vida inteligente')
    ;
        writeln('? KEPLER452B: ERROR - deberia tener vida inteligente')
    ),

    nl,
    writeln('2. Planetas que NO DEBERIAN tener vida inteligente:'),
    (\+ vida_inteligente(marte) ->
        writeln('? MARTE: CORRECTO - no tiene vida inteligente')
    ;
        writeln('? MARTE: ERROR - no deberia tener vida inteligente')
    ),
    (\+ vida_inteligente(venus) ->
        writeln('? VENUS: CORRECTO - no tiene vida inteligente')
    ;
        writeln('? VENUS: ERROR - no deberia tener vida inteligente')
    ),
    (\+ vida_inteligente(europa) ->
        writeln('? EUROPA: CORRECTO - no tiene vida inteligente')
    ;
        writeln('? EUROPA: ERROR - no deberia tener vida inteligente')
    ).

% PRUEBA 4: Habitabilidad
prueba_habitabilidad :-
    writeln('--- PRUEBA HABITABILIDAD ---'),

    writeln('1. Planetas que DEBERIAN ser habitables:'),
    (habitable(tierra) ->
        writeln('? TIERRA: CORRECTO - es habitable')
    ;
        writeln('? TIERRA: ERROR - deberia ser habitable')
    ),
    (habitable(kepler452b) ->
        writeln('? KEPLER452B: CORRECTO - es habitable')
    ;
        writeln('? KEPLER452B: ERROR - deberia ser habitable')
    ),
    (habitable(venus) ->
        writeln('? VENUS: CORRECTO - es habitable')
    ;
        writeln('? VENUS: ERROR - deberia ser habitable')
    ),

    nl,
    writeln('2. Planetas que NO DEBERIAN ser habitables:'),
    (\+ habitable(marte) ->
        writeln('? MARTE: CORRECTO - no es habitable')
    ;
        writeln('? MARTE: ERROR - no deberia ser habitable')
    ),
    (\+ habitable(europa) ->
        writeln('? EUROPA: CORRECTO - no es habitable')
    ;
        writeln('? EUROPA: ERROR - no deberia ser habitable')
    ).

% PRUEBA 5: Civilización avanzada
prueba_civilizacion_avanzada :-
    writeln('--- PRUEBA CIVILIZACION AVANZADA ---'),

    writeln('1. Planetas que DEBERIAN tener civilizacion avanzada:'),
    (civilizacion_avanzada(tierra) ->
        writeln('? TIERRA: CORRECTO - tiene civilizacion avanzada')
    ;
        writeln('? TIERRA: ERROR - deberia tener civilizacion avanzada')
    ),
    (civilizacion_avanzada(kepler452b) ->
        writeln('? KEPLER452B: CORRECTO - tiene civilizacion avanzada')
    ;
        writeln('? KEPLER452B: ERROR - deberia tener civilizacion avanzada')
    ),

    nl,
    writeln('2. Planetas que NO DEBERIAN tener civilizacion avanzada:'),
    (\+ civilizacion_avanzada(marte) ->
        writeln('? MARTE: CORRECTO - no tiene civilizacion avanzada')
    ;
        writeln('? MARTE: ERROR - no deberia tener civilizacion avanzada')
    ),
    (\+ civilizacion_avanzada(venus) ->
        writeln('? VENUS: CORRECTO - no tiene civilizacion avanzada')
    ;
        writeln('? VENUS: ERROR - no deberia tener civilizacion avanzada')
    ),
    (\+ civilizacion_avanzada(europa) ->
        writeln('? EUROPA: CORRECTO - no tiene civilizacion avanzada')
    ;
        writeln('? EUROPA: ERROR - no deberia tener civilizacion avanzada')
    ).

% PRUEBA 6: Planetas inexistentes
prueba_planetas_inexistentes :-
    writeln('--- PRUEBA PLANETAS INEXISTENTES ---'),

    writeln('Verificando que planetas inexistentes no tengan ninguna condicion:'),
    (\+ vida_basica(planeta_inexistente) ->
        writeln('? PLANETA_INEXISTENTE: CORRECTO - no tiene vida basica')
    ;
        writeln('? PLANETA_INEXISTENTE: ERROR - no deberia existir')
    ),
    (\+ vida_compleja(jupiter) ->
        writeln('? JUPITER: CORRECTO - no tiene vida compleja')
    ;
        writeln('? JUPITER: ERROR - no deberia tener vida compleja')
    ),
    (\+ vida_inteligente(saturno) ->
        writeln('? SATURNO: CORRECTO - no tiene vida inteligente')
    ;
        writeln('? SATURNO: ERROR - no deberia tener vida inteligente')
    ).

% PRUEBA 7: Consultas de inferencia
prueba_consultas_inferencia :-
    writeln('--- PRUEBA CONSULTAS DE INFERENCIA ---'),

    writeln('1. Consulta: Planetas con vida basica:'),
    findall(P, inferir(vida_basica, P), PlanetasBasica),
    (member(tierra, PlanetasBasica), member(kepler452b, PlanetasBasica) ->
        writeln('? CORRECTO: Tierra y Kepler452b encontrados')
    ;
        writeln('? ERROR: No se encontraron los planetas correctos')
    ),

    writeln('2. Consulta: Planetas con vida inteligente:'),
    findall(P, inferir(vida_inteligente, P), PlanetasInteligente),
    (member(tierra, PlanetasInteligente), member(kepler452b, PlanetasInteligente) ->
        writeln('? CORRECTO: Tierra y Kepler452b encontrados')
    ;
        writeln('? ERROR: No se encontraron los planetas correctos')
    ).

% PRUEBA 8: Sistema de explicaciones
prueba_explicaciones :-
    writeln('--- PRUEBA SISTEMA DE EXPLICACIONES ---'),

    writeln('1. Probando explicacion de vida basica en Tierra:'),
    por_que(vida_basica, tierra, _),

    nl,
    writeln('2. Probando explicacion de vida basica en Marte:'),
    por_que(vida_basica, marte, _),

    nl,
    writeln('3. Probando explicacion de vida inteligente en Kepler452b:'),
    por_que(vida_inteligente, kepler452b, _).

% Menú de pruebas
menu_pruebas :-
    writeln('*** MENU DE PRUEBAS ***'),
    writeln('1. Ejecutar todas las pruebas'),
    writeln('2. Prueba de vida basica'),
    writeln('3. Prueba de vida compleja'),
    writeln('4. Prueba de vida inteligente'),
    writeln('5. Prueba de habitabilidad'),
    writeln('6. Prueba de civilizacion avanzada'),
    writeln('7. Prueba de consultas de inferencia'),
    writeln('8. Prueba de explicaciones'),
    writeln('9. Volver al menu principal'),
    write('Selecciona una opcion (1-9): '),
    read(Opcion), ejecutar_opcion_prueba(Opcion).

ejecutar_opcion_prueba(1) :- ejecutar_pruebas.
ejecutar_opcion_prueba(2) :- cargar_planetas, prueba_vida_basica.
ejecutar_opcion_prueba(3) :- cargar_planetas, prueba_vida_compleja.
ejecutar_opcion_prueba(4) :- cargar_planetas, prueba_vida_inteligente.
ejecutar_opcion_prueba(5) :- cargar_planetas, prueba_habitabilidad.
ejecutar_opcion_prueba(6) :- cargar_planetas, prueba_civilizacion_avanzada.
ejecutar_opcion_prueba(7) :- cargar_planetas, prueba_consultas_inferencia.
ejecutar_opcion_prueba(8) :- cargar_planetas, prueba_explicaciones.
ejecutar_opcion_prueba(9) :- menu.
ejecutar_opcion_prueba(_) :- writeln('Opcion no valida'), menu_pruebas.

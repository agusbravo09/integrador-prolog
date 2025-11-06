%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Archivo de Pruebas de Robustez (con PL-Unit) Generado por GEMINI %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Nos pareció divertido pedirle a una IA que haga tests y trate de romper el programa jaja


% --- 1. IMPORTACIONES ---
% Cargamos las reglas y consultas que vamos a probar
:- consult('reglas.pl').
:- consult('consultas.pl').
:- consult('cargar_datos.pl'). % Lo cargamos por si 'consultas.pl' lo necesita, pero NO usaremos sus datos.

% Importamos la biblioteca de pruebas unitarias
:- use_module(library(plunit)).

% --- 2. DATOS DE PRUEBA CONTROLADOS ---
% Este predicado es la clave de la robustez.
% Borra todos los hechos antiguos y crea un universo conocido para probar.
setup_datos_prueba :-
    % Borra cualquier dato de ejecuciones anteriores o de 'cargar_datos.pl'
    retractall(planeta(_, _)),

    % CASO 1: Tierra (Pasa todas las reglas)
    assert(planeta(tierra, tiene_atmosfera)),
    assert(planeta(tierra, tiene_agua_liquida)),
    assert(planeta(tierra, tiene_elementos_biogenicos)), % Pasa vida_basica
    assert(planeta(tierra, tiene_evolucion_biologica)),
    assert(planeta(tierra, tiene_superficie_solida)), % Pasa vida_compleja
    assert(planeta(tierra, tiene_tecnologia)), % Pasa vida_inteligente
    assert(planeta(tierra, tiene_magnetosfera)),
    assert(planeta(tierra, tiene_gravedad_estable)),
    assert(planeta(tierra, tiene_ciclo_dia_noche)), % Pasa habitable
    assert(planeta(tierra, tiene_luz_solar)), % Pasa civilizacion_avanzada

    % CASO 2: Pandora (Pasa vida_basica, pero falla vida_compleja)
    assert(planeta(pandora, tiene_atmosfera)),
    assert(planeta(pandora, tiene_agua_liquida)),
    assert(planeta(pandora, tiene_elementos_biogenicos)), % Pasa vida_basica
    assert(planeta(pandora, tiene_superficie_solida)),
    % FALTA: tiene_evolucion_biologica -> Falla vida_compleja

    % CASO 3: Oasis (Pasa habitable, pero falla vida_basica)
    assert(planeta(oasis, tiene_atmosfera)),
    % FALTA: tiene_agua_liquida -> Falla vida_basica
    assert(planeta(oasis, tiene_magnetosfera)),
    assert(planeta(oasis, tiene_gravedad_estable)),
    assert(planeta(oasis, tiene_ciclo_dia_noche)), % Pasa habitable
    assert(planeta(oasis, tiene_luz_solar)),

    % CASO 4: TechWorld (Pasa vida_inteligente, pero falla habitable)
    assert(planeta(tech_world, tiene_atmosfera)),
    assert(planeta(tech_world, tiene_agua_liquida)),
    assert(planeta(tech_world, tiene_elementos_biogenicos)), % Pasa vida_basica
    assert(planeta(tech_world, tiene_evolucion_biologica)),
    assert(planeta(tech_world, tiene_superficie_solida)), % Pasa vida_compleja
    assert(planeta(tech_world, tiene_tecnologia)), % Pasa vida_inteligente
    assert(planeta(tech_world, tiene_luz_solar)),
    % FALTA: tiene_magnetosfera -> Falla habitable
    assert(planeta(tech_world, tiene_gravedad_estable)),
    assert(planeta(tech_world, tiene_ciclo_dia_noche)),

    % CASO 5: Marte (Falla casi todo)
    assert(planeta(marte, tiene_atmosfera)),
    assert(planeta(marte, tiene_superficie_solida)).
    % Faltan agua, elementos, evolucion, etc.


% --- 3. MENU DE PRUEBAS (Compatible con integrador.pl) ---
menu_pruebas :-
    writeln('*** MENU DE PRUEBAS DE ROBUSTEZ (PL-Unit) ***'),
    writeln('1. Ejecutar todas las pruebas automaticas'),
    writeln('2. Ejecutar pruebas visuales del sistema de explicacion'),
    writeln('3. Volver al menu principal'),
    write('Selecciona una opcion (1-3): '),
    read(Opcion), ejecutar_opcion_prueba(Opcion).

ejecutar_opcion_prueba(1) :-
    writeln('--- Ejecutando Pruebas de Reglas e Inferencia ---'),
    % Ejecuta todos los bloques de 'begin_tests' EXCEPTO el de 'explicaciones'
    run_tests([ reglas_vida_basica,
                reglas_vida_compleja,
                reglas_habitable,
                reglas_civilizacion_avanzada,
                consultas_inferir,
                robustez_datos_vacios
              ]),
    writeln('--- Pruebas Automaticas Finalizadas ---'), nl,
    menu_pruebas.

ejecutar_opcion_prueba(2) :-
    writeln('--- Ejecutando Pruebas Visuales de Explicacion ---'),
    writeln('Por favor, verifique la salida en la consola.'),
    ejecutar_pruebas_visuales,
    writeln('--- Pruebas Visuales Finalizadas ---'), nl,
    menu_pruebas.

ejecutar_opcion_prueba(3) :- integrador:menu.
ejecutar_opcion_prueba(_) :- writeln('Opcion no valida'), nl, menu_pruebas.


% --- 4. SUITE DE PRUEBAS AUTOMATICAS ---

% [setup(setup_datos_prueba)] le dice a plunit que ejecute ese predicado
% ANTES de correr los tests de este bloque.

:- begin_tests(reglas_vida_basica, [setup(setup_datos_prueba)]).

test(tierra_pasa_vida_basica) :-
    vida_basica(tierra).
test(pandora_pasa_vida_basica) :-
    vida_basica(pandora).
test(tech_world_pasa_vida_basica) :-
    vida_basica(tech_world).
test(marte_falla_vida_basica, [fail]) :-
    vida_basica(marte). % Falla, no tiene agua ni elementos
test(oasis_falla_vida_basica, [fail]) :-
    vida_basica(oasis). % Falla, no tiene agua
test(inexistente_falla_vida_basica, [fail]) :-
    vida_basica(planeta_inexistente).

:- end_tests(reglas_vida_basica).


:- begin_tests(reglas_vida_compleja, [setup(setup_datos_prueba)]).

test(tierra_pasa_vida_compleja) :-
    vida_compleja(tierra).
test(tech_world_pasa_vida_compleja) :-
    vida_compleja(tech_world).
test(pandora_falla_vida_compleja, [fail]) :-
    vida_compleja(pandora). % Pasa vida_basica, pero falla aqui (falta evolucion)
test(marte_falla_vida_compleja, [fail]) :-
    vida_compleja(marte). % Falla en el primer paso (vida_basica)

:- end_tests(reglas_vida_compleja).


:- begin_tests(reglas_habitable, [setup(setup_datos_prueba)]).

test(tierra_pasa_habitable) :-
    habitable(tierra).
test(oasis_pasa_habitable) :-
    habitable(oasis). % Es habitable, aunque no tenga vida
test(tech_world_falla_habitable, [fail]) :-
    habitable(tech_world). % Falla, falta magnetosfera
test(marte_falla_habitable, [fail]) :-
    habitable(marte). % Falla, falta magnetosfera, gravedad, ciclo
test(pandora_falla_habitable, [fail]) :-
    habitable(pandora). % Falla, no tiene nada de habitabilidad

:- end_tests(reglas_habitable).


% Prueba clave de robustez: dependencias cruzadas
:- begin_tests(reglas_civilizacion_avanzada, [setup(setup_datos_prueba)]).

test(tierra_pasa_civilizacion_avanzada) :-
    civilizacion_avanzada(tierra). % Pasa vida_inteligente Y habitable

test(oasis_falla_civilizacion_avanzada, [fail]) :-
    civilizacion_avanzada(oasis). % Pasa habitable, pero Falla vida_inteligente

test(tech_world_falla_civilizacion_avanzada, [fail]) :-
    civilizacion_avanzada(tech_world). % Pasa vida_inteligente, pero Falla habitable

test(pandora_falla_civilizacion_avanzada, [fail]) :-
    civilizacion_avanzada(pandora). % Falla vida_inteligente Y habitable

:- end_tests(reglas_civilizacion_avanzada).


% Pruebas del predicado 'inferir' y 'findall'
:- begin_tests(consultas_inferir, [setup(setup_datos_prueba)]).

test(inferir_vida_basica_encuentra_correctos) :-
    findall(P, inferir(vida_basica, P), Planetas),
    sort(Planetas, PlanetasOrdenados), % sort para orden canonico
    PlanetasOrdenados == [pandora, tech_world, tierra].

test(inferir_vida_compleja_encuentra_correctos) :-
    findall(P, inferir(vida_compleja, P), Planetas),
    sort(Planetas, PlanetasOrdenados),
    PlanetasOrdenados == [tech_world, tierra].

test(inferir_civilizacion_avanzada_encuentra_correctos) :-
    findall(P, inferir(civilizacion_avanzada, P), Planetas),
    Planetas == [tierra]. % Solo tierra deberia estar

:- end_tests(consultas_inferir).


% Prueba de robustez: ¿Qué pasa si la base de datos está vacía?

setup_datos_vacios :-
    retractall(planeta(_,_)).

:- begin_tests(robustez_datos_vacios, [setup(setup_datos_vacios)]).

test(inferir_con_base_vacia, [true(Planetas == [])]) :-
    findall(P, inferir(vida_basica, P), Planetas). % Deberia devolver lista vacia

test(regla_con_base_vacia, [fail]) :-
    vida_basica(tierra). % Deberia fallar si no hay hechos

:- end_tests(robustez_datos_vacios).


% --- 5. SUITE DE PRUEBAS VISUALES (EXPLICACION) ---
% Estas pruebas no fallan (a menos que haya un error de Prolog).
% Su proposito es ejecutar el sistema de explicacion para que
% puedas verificar visualmente que la salida es correcta.

ejecutar_pruebas_visuales :-
    writeln('--- Ejecutando Pruebas Visuales de Explicacion ---'),
    writeln('Por favor, verifique la salida en la consola.'), nl,

    % MUY IMPORTANTE: Preparamos los datos
    setup_datos_prueba,

    nl, writeln('--- PRUEBA VISUAL: civilizacion_avanzada(tierra) -> DEBE PASAR ---'),
    por_que(civilizacion_avanzada, tierra, _),
    writeln('--- FIN PRUEBA VISUAL ---'),

    nl, writeln('--- PRUEBA VISUAL: civilizacion_avanzada(tech_world) -> DEBE FALLAR (por habitable) ---'),
    por_que(civilizacion_avanzada, tech_world, _),
    writeln('--- FIN PRUEBA VISUAL ---'),

    nl, writeln('--- PRUEBA VISUAL: civilizacion_avanzada(oasis) -> DEBE FALLAR (por vida_inteligente) ---'),
    por_que(civilizacion_avanzada, oasis, _),
    writeln('--- FIN PRUEBA VISUAL ---'),

    nl, writeln('--- PRUEBA VISUAL: vida_basica(marte) -> DEBE FALLAR (base) ---'),
    por_que(vida_basica, marte, _),
    writeln('--- FIN PRUEBA VISUAL ---'),

    nl, writeln('--- PRUEBA VISUAL: vida_basica(inexistente) -> DEBE FALLAR (base) ---'),
    por_que(vida_basica, inexistente, _),
    writeln('--- FIN PRUEBA VISUAL ---'),

    writeln('--- Pruebas Visuales Finalizadas ---'), nl.

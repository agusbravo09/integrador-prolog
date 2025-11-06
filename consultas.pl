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

     % llamada a por_que/3 (recursivo)
     por_que(Condicion, Planeta, _),

    nl,
    menu_explicaciones.
ejecutar_explicacion(6) :- writeln('Volviendo al menu principal... '), nl, menu.
ejecutar_explicacion(_) :- write('Opcion no valida. Intente de nuevo.'), nl, menu_explicaciones.

% Explicaciones

% ---
% PASO 1: DEFINIMOS LAS REGLAS COMO DATOS (HECHOS)
%
% Formato:
%   hecho(NombreHecho) -> Representa un 'planeta(Planeta, NombreHecho)'
%   regla(NombreRegla) -> Representa una sub-regla que hay que explicar
% ---
componentes_regla(vida_basica, [hecho(tiene_atmosfera),
                                hecho(tiene_agua_liquida),
                                hecho(tiene_elementos_biogenicos)]).

componentes_regla(vida_compleja, [regla(vida_basica),
                                  hecho(tiene_evolucion_biologica),
                                  hecho(tiene_superficie_solida)]).

componentes_regla(vida_inteligente, [regla(vida_compleja),
                                     hecho(tiene_tecnologia)]).

componentes_regla(habitable, [hecho(tiene_atmosfera),
                             hecho(tiene_magnetosfera),
                             hecho(tiene_gravedad_estable),
                             hecho(tiene_ciclo_dia_noche)]).

componentes_regla(civilizacion_avanzada, [regla(vida_inteligente),
                                          regla(habitable),
                                          hecho(tiene_luz_solar)]).


% ---
% PASO 2: PUNTO DE ENTRADA
% Este predicado sigue siendo el mismo. Llama a la regla real,
% informa el resultado (SI/NO) y luego llama al explicador.
% ---
por_que(Regla, Planeta, Explicacion) :-
    Goal =.. [Regla, Planeta],

    writeln('--- INICIO DE EXPLICACION ---'),
    format('Analizando ~w en ~w...~n~n', [Regla, Planeta]),

    (   call(Goal) -> % Intenta probar la regla original de reglas.pl
        format('RESULTADO: El planeta ~w CUMPLE con la regla ~w.~n', [Planeta, Regla]),
        writeln('Verificando condiciones: '),
        explicar_condiciones(Regla, Planeta), % Llama al explicador generico
        Explicacion = 'Regla cumplida.'
    ;
        format('RESULTADO: El planeta ~w NO CUMPLE con la regla ~w.~n', [Planeta, Regla]),
        writeln('Verificando condiciones:'),
        explicar_condiciones(Regla, Planeta), % Llama al explicador generico
        Explicacion = 'Regla no cumplida.'
    ),
    writeln('--- FIN DE EXPLICACION ---').


% ---
% PASO 3: EL EXPLICADOR GENERICO
% ---
explicar_condiciones(Regla, Planeta) :-
    format('  Evaluando regla: ~w~n', [Regla]),

    % 1. Busca la definicion de la regla
    (   componentes_regla(Regla, Componentes) ->

        % 2. Itera sobre cada componente de la lista
        forall(member(Componente, Componentes),
               verificar_componente(Planeta, Componente))
    ;
        % Caso de seguridad: si una regla no esta definida aqui
        format('  ERROR: No se encontro definicion de explicacion para ~w~n', [Regla])
    ).


% ---
% PASO 4: EL VERIFICADOR DE COMPONENTES
% Este predicado es llamado por 'forall' para cada item de la lista.
% ---

% Caso 1: El componente es una 'regla(...)'
verificar_componente(Planeta, regla(SubRegla)) :-
    format('  -> Verificando sub-regla: ~w...~n', [SubRegla]),
    explicar_condiciones(SubRegla, Planeta).

% Caso 2: El componente es un 'hecho(...)' (CASO BASE)
verificar_componente(Planeta, hecho(Hecho)) :-
    verificar_hecho(Planeta, Hecho).


% ---
% PASO 5: EL VERIFICADOR DE HECHOS
% Este no cambia.
% ---
verificar_hecho(Planeta, Hecho) :-
    (   planeta(Planeta, Hecho) ->
        format('      [SI] - Tiene ~w~n', [Hecho])
    ;
        format('      [NO] - FALTA ~w~n', [Hecho])
    ).











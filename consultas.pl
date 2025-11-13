% ===========================
% ==== MENU DE CONSULTAS ====
% ===========================
menu2 :- write('*** Menu de Consultas ***'), nl,
         write('1. Planetas con vida basica.'), nl,
         write('2. Planetas con vida compleja.'), nl,
         write('3. Planetas con vida inteligente.'), nl,
         write('4. Planetas habitables.'), nl,
         write('5. Planetas con fotosintesis posible.'), nl,
         write('6. Planetas con civilizaciones avanzadas.'), nl,
         write('7. Volver'), nl,
         write('Selecciona una opcion: (1-7): '),
         read(Opcion), ejecutar_consulta(Opcion).

ejecutar_consulta(Opcion) :- Opcion >= 1, Opcion =< 6,
                             (Opcion = 1 -> Regla = vida_basica;
                              Opcion = 2 -> Regla = vida_compleja;
                              Opcion = 3 -> Regla = vida_inteligente;
                              Opcion = 4 -> Regla = habitable;
                              Opcion = 5 -> Regla = fotosintesis_posible;
                              Opcion = 6 -> Regla = civilizacion_avanzada),
                              
                              format('*** Planetas con ~w~n', [Regla]),
                              (inferir(Regla, _) ->
                                 forall(inferir(Regla, Planeta), format('~w~n', [Planeta]))
                                 ;
                                 writeln('No se encontraron planetas que cumplan con esa condicion...')),
                              
                              nl,
                              menu2.
                              
ejecutar_consulta(7) :- write('Volviendo al menu principal...'), nl, nl, menu.
ejecutar_consulta(_) :- writeln('Opcion no valida. Intente de nuevo.'), nl, nl, menu2.

% =================================
% ====  MENU DE EXPLICACIONES  ====
% =================================
menu_explicaciones :-
    write('*** Menu de Explicaciones ***'), nl,
    write('1. Explicar vida basica de un planeta'), nl,
    write('2. Explicar vida compleja de un planeta'), nl,
    write('3. Explicar vida inteligente de un planeta'), nl,
    write('4. Explicar habitabilidad de un planeta'), nl,
    write('5. Explicar fotosintesis posible de un planeta'), nl,
    write('6. Explicar civilizacion avanzada de un planeta'), nl,
    write('7. Volver al menu principal'), nl,
    write('Selecciona una opcion: (1-7): '),
    read(Opcion), ejecutar_explicacion(Opcion).

ejecutar_explicacion(Opcion) :-
    Opcion >= 1, Opcion =< 6,
    write('Ingrese el nombre del planeta (ej: tierra.): '),
    read(Planeta),
    %convertimos el numero en el nombre de la regla que vamos a explicar
    (Opcion = 1 -> Regla = vida_basica;
     Opcion = 2 -> Regla = vida_compleja;
     Opcion = 3 -> Regla = vida_inteligente;
     Opcion = 4 -> Regla = habitable;
     Opcion = 5 -> Regla = fotosintesis_posible;
     Opcion = 6 -> Regla = civilizacion_avanzada),

     % llamada a por_que/3 (recursivo)
     por_que(Regla, Planeta, _),

    nl,
    menu_explicaciones.
ejecutar_explicacion(7) :- writeln('Volviendo al menu principal... '), nl, nl, menu.
ejecutar_explicacion(_) :- write('Opcion no valida. Intente de nuevo.'), nl, nl, menu_explicaciones.

% Explicaciones

% ---
% Formato:
%   hecho(algo) -> Significa que debemos buscar un hecho: planeta(Planeta, algo)
%   regla(otra_regla) -> Significa que esto depende de OTRA regla)
% ---

% Son como "mapas" de las reglas definidas en reglas.pl
componentes_regla(vida_basica, [hecho(tiene_atmosfera),
                                hecho(tiene_agua_liquida),
                                hecho(tiene_elementos_biogenicos)]).

componentes_regla(vida_compleja, [hecho(tiene_evolucion_biologica),
                                  hecho(tiene_superficie_solida),
                                  regla(vida_basica)]).

componentes_regla(vida_inteligente, [hecho(tiene_tecnologia),
                                     regla(vida_compleja)]).

componentes_regla(habitable, [hecho(tiene_atmosfera),
                             hecho(tiene_magnetosfera),
                             hecho(tiene_gravedad_estable),
                             hecho(tiene_ciclo_dia_noche)]).

componentes_regla(fotosintesis_posible, [hecho(tiene_luz_solar),
                                          hecho(tiene_atmosfera)]).

componentes_regla(civilizacion_avanzada, [hecho(tiene_luz_solar),
                                          regla(vida_inteligente),
                                          regla(habitable)]).


% ---
% Paso 1:
% Recibe la Regla a explicar y el Planeta.
% ---
por_que(Regla, Planeta, Explicacion) :-
    % Construye la consulta real, el =.. es para armar una regla a partir de una lista ej: vida_basica(tierra)
    Goal =.. [Regla, Planeta],

    writeln('--- INICIO DE EXPLICACION ---'),
    format('Analizando ~w en ~w...~n~n', [Regla, Planeta]),
        % Intenta ejecutar la regla con call
    (   call(Goal) ->
        % si tuvo exito
        format('RESULTADO: El planeta ~w CUMPLE con la regla ~w.~n', [Planeta, Regla]),
        writeln('Verificando condiciones: '),
        explicar_condiciones(Regla, Planeta), % Llama al explicador recursivo (paso 2)
        Explicacion = 'Regla cumplida.'
    ;
        % si fallo
        format('RESULTADO: El planeta ~w NO CUMPLE con la regla ~w.~n', [Planeta, Regla]),
        writeln('Verificando condiciones:'),
        explicar_condiciones(Regla, Planeta), % Llama al explicador recursivo (paso 2)
        Explicacion = 'Regla no cumplida.'
    ),
    writeln('--- FIN DE EXPLICACION ---').


% ---
% Paso 2:
% Este predicado toma la regla y busca el "mapa" para revisar cada parte
% ---
explicar_condiciones(Regla, Planeta) :-
    format('  Evaluando regla: ~w~n', [Regla]),

    % Busca el "mapa" de la regla
    (   componentes_regla(Regla, Componentes) ->

        % Si lo encuenta, revisa cada componente de la lista
        forall(member(Componente, Componentes),
               verificar_componente(Planeta, Componente)) %llama al verificador (paso 3)
    ;
        % Caso de seguridad: si nos olvidamos de definir un "mapa"
        format('  ERROR: No se encontro definicion de explicacion para ~w~n', [Regla])
    ).


% ---
% Paso 3:
% forall llama a este predicado para cada item de la lista
% ---

% Caso 1: El componente es una 'regla(...)'
% Hay que llamar de nuevo al paso 2 pero con la subregla nueva.
verificar_componente(Planeta, regla(SubRegla)) :-
    format('  -> Verificando sub-regla: ~w...~n', [SubRegla]),
    explicar_condiciones(SubRegla, Planeta).

% Caso 2: El componente es un 'hecho(...)'
% Este es el caso base
verificar_componente(Planeta, hecho(Hecho)) :-
    verificar_hecho(Planeta, Hecho). % Llama al veriricador final (paso 4)


% ---
% Paso 4:
% Final del camino, solamente se comprueba si el hecho existe en la base de datos
% ---
verificar_hecho(Planeta, Hecho) :-
        %Intenta probar el hecho...
    (   planeta(Planeta, Hecho) ->
        %Si existe imprime SI.
        format('      [SI] - Tiene ~w~n', [Hecho])
    ;
        %Si no existe imprime NO.
        format('      [NO] - FALTA ~w~n', [Hecho])
    ).











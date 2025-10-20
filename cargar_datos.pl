% cargar_datos.pl
:- use_module(library(csv)).
:- dynamic planeta/2.

cargar_planetas :-
    csv_read_file('planetas.csv', Filas, [functor(planeta)]),
    retractall(planeta(_,_)),
    maplist(assert, Filas),
    writeln('Planetas cargados exitosamente.').
    
imprimir_planetas :-
    %findall obtiene todos los hechos planeta/2 y los guarda en una lista
    % Estructura: findall(Template, Goal, Bag)
    % - Template: Planeta-Caracteristica ? crea pares para mejor visualización
    % - Goal: planeta(Planeta, Caracteristica) ? busca todos los hechos que coincidan
    % - Bag: Variable donde se almacenan todos los resultados
    findall(Planeta-Caracteristica, planeta(Planeta, Caracteristica), Lista),
    writeln('*** TODOS LOS HECHOS CARGADOS ***'),
    
     %forall ejecuta el formato para cada elemento de la lista
    forall(member(Planeta-Caracteristica, Lista),     % para cada elemento Planeta-Caracteristica en la lista
           format('~w: ~w~n', [Planeta, Caracteristica])),  % mostrar cada par con el formato planeta: caracteristica
                                                            % -w imprime el termino tal cual y -n es un salto de linea.
    length(Lista, Cantidad), %calcula cuantos elementos hay en la lista y lo guarda en Cantidad
    format('Total: ~d hechos~n', [Cantidad]). %muestra el total de hechos. -d es formato para numeros enteros.

cargar_csvs :-
    cargar_planetas.

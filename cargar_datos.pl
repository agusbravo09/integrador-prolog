
% cargar_datos.pl (actualizado para cargar horarios)
% cargar_datos.pl
:- use_module(library(csv)).
:- dynamic planeta/2.

cargar_planetas :-
    csv_read_file('planetas.csv', Filas, [functor(planeta)]),
    retractall(planeta(_,_)),
    maplist(assert, Filas),
    writeln('Planetas cargados exitosamente.').

cargar_csvs :-
    cargar_planetas.

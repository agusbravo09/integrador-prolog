:- consult('cargar_datos.pl'). %esto es como importar un modulo en otro lenguaje
:- consult('consultas.pl').

menu :- write('*** Analisis de Vida Inteligente en varios planetas *** \n'),
        write('1. Cargar datos \n'),
        write('2. Imprimir todos los hechos \n'),
        write('3. Realizar consultas \n'),
        write('4. Salir \n'),
        write('Selecciona una opcion (1-4): '), read(Option), nl,
        execute(Option).


execute(1) :- cargar_csvs, menu.
execute(2) :- imprimir_planetas, nl, menu.
execute(3) :- menu2, nl.
execute(4) :- write('Saliendo del programa...'), nl, true.
execute(_) :- write('Opcion no valida.'), nl, menu. %en caso de que ninguno coincida...


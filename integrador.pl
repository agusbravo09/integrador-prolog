:- consult('cargar_datos.pl'). %esto es como importar un modulo en otro lenguaje
:- consult('consultas.pl').
:- consult('pruebas.pl').
:- consult('reglas.pl').

menu :- write('*** Analisis de Vida Inteligente en varios planetas *** \n'),
        write('1. Cargar datos \n'),
        write('2. Imprimir todos los hechos \n'),
        write('3. Realizar consultas \n'),
        write('4. Consulta de explicación \n'),
        write('5. Ejecutar pruebas \n'),
        write('6. Salir \n'),
        write('Selecciona una opcion (1-6): '), read(Option), nl,
        execute(Option).


execute(1) :- cargar_csvs, menu.
execute(2) :- imprimir_planetas, nl, menu.
execute(3) :- menu2, nl.
execute(4) :- menu_explicaciones, nl.
execute(5) :- menu_pruebas, nl.
execute(6) :- write('Saliendo del programa...'), nl, true. % Cambiar el número de salida
execute(_) :- write('Opcion no valida. Intente de nuevo.'), nl, nl, menu. %en caso de que ninguno coincida...


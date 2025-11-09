:- consult('hechos.pl'). %esto es como importar un modulo en otro lenguaje
:- consult('reglas.pl').
:- consult('consultas.pl').
:- consult('pruebas.pl').

menu :- write('*** Analisis de Vida Inteligente en varios planetas *** \n'),
        write('1. Cargar datos \n'),
        write('2. Imprimir todos los hechos \n'),
        write('3. Realizar consultas \n'),
        write('4. Consulta de explicación \n'),
        write('5. Ejecutar pruebas \n'),
        write('6. Salir \n'),
        write('Selecciona una opcion (1-6): '), read(Opcion), nl,
        ejecutar(Opcion).

ejecutar(1) :- cargar_csvs, menu.
ejecutar(2) :- imprimir_planetas, nl, menu.
ejecutar(3) :- menu2, nl.
ejecutar(4) :- menu_explicaciones, nl.
ejecutar(5) :- menu_pruebas, nl.
ejecutar(6) :- write('Saliendo del programa...'), nl, true.
ejecutar(_) :- write('Opcion no valida. Intente de nuevo.'), nl, nl, menu. %en caso de que ninguno coincida...

iniciar_programa :- cargar_csvs, imprimir_planetas, menu.

:- initialization(iniciar_programa). %ejecuta un predicado despues de cargar el archivo que lo contiene.


menu :- write('*** Analisis de Vida Inteligente en varios planetas *** \n'),
        write('1. Cargar datos \n'),
        write('2. Imprimir hechos \n'),
        write('3. Realizar consultas \n'),
        write('4. Salir \n'),
        write('Selecciona una opcion: '), read(Option), write('\n'),
        execute(Option).
        

        
execute(Option) :- Option == 1, helloWorld, menu;
                   Option == 4, true.

helloWorld :- write('Hola Mundo desde Prolog!\n\n').

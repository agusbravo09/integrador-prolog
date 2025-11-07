# PROYECTO EN PROLOG
## EVALUACIÓN DE VIDA INTELIGENTE EN VARIOS PLANETAS

**Facultad de Ciencias de la Administración**
<br>
*Universidad Nacional de Entre Ríos*

---

### 1. Descripción del Proyecto

El presente proyecto tiene como objetivo desarrollar un sistema experto en Prolog que permita evaluar la existencia de vida en distintos planetas, a partir de un conjunto de hechos científicos y reglas lógicas.

El programa debe ser capaz de inferir distintos niveles de vida (básica, compleja, inteligente) y condiciones de habitabilidad, en base a la información disponible para cada planeta.

### 2. Objetivos

Los principales objetivos del proyecto son:

* Comprender el uso de reglas y hechos en Prolog para construir un sistema experto.
* Aplicar el razonamiento lógico para inferir conocimiento a partir de información base.
* Integrar datos externos (archivo CSV) al motor lógico de Prolog.
* Diseñar un modelo de inferencia que permita distinguir entre distintos tipos de vida y condiciones de habitabilidad.
* Analizar cómo pequeñas variaciones en los hechos afectan las inferencias finales.

### 3. Consigna General

Se deberá construir un programa en Prolog denominado `vida_inteligente.pl` que lea desde un archivo CSV la información de distintos planetas y sus características (hechos). En base a ello, el sistema deberá inferir si el planeta es habitable, si posee vida básica, compleja o inteligente, y si se puede considerar que existe una civilización avanzada.

### 4. Detalles de Implementación

El programa deberá cumplir con las siguientes características:

* Los hechos deberán ser leídos desde un archivo CSV con las columnas 'planeta' y 'hecho'.
* Cada hecho representará una condición observada en el planeta (por ejemplo, `tiene_atmosfera`, `tiene_agua_liquida`, etc.).
* Las reglas deberán definir las condiciones necesarias para los distintos tipos de vida:
    * **Vida básica:** requiere atmósfera, agua líquida y elementos biogénicos.
    * **Vida compleja:** requiere vida básica, evolución biológica y superficie sólida.
    * **Vida inteligente:** requiere vida compleja y tecnología.
    * **Habitable:** requiere atmósfera, magnetosfera, gravedad estable y ciclo día-noche.
    * **Civilización avanzada:** combina vida inteligente, habitabilidad y fotosíntesis posible.

### 5. Demostraciones y Consultas

Se deberán realizar consultas en la consola de Prolog que demuestren la capacidad de inferencia del sistema. Estas pueden ser:

* **Preguntas de inferencia:** son las que pregunten por condiciones. Por ejemplo:
    ```prolog
    ?- inferir(vida_inteligente, Planeta).
    ```
    ```prolog
    ?- inferir(habitable, tierra).
    ```
    ```prolog
    ?- inferir(Condiciones, marte).
    ```
    En estos casos, solo indicaría como se instancian las variables o TRUE / FALSE en caso de que no tenga variables.

* **Preguntas de explicación:** Explicar cómo llegó a esta deducción, por ejemplo:
    ```prolog
    ?- por_que(vida_inteligente, Planeta, Explicacion).
    ```
    ```prolog
    ?- por_que(habitable, kepler452b, Explicacion).
    ```
    El resultado deberá indicar porqué un planeta tiene determinada condición. Cada condición se da si tiene una lista de hechos o condiciones (esto lo hace recursivo). Por ejemplo (`?- demostrar(vida_inteligente, tierra)` usa predicado `por_que/3`):

    ```
    Inferido: vida inteligente
    Inferido: vida_compleja
    Inferido: vida basica
    Hecho Base: tiene atmosfera
    Hecho Base: tiene agua liquida
    Hecho Base: tiene elementos biogenicos
    Hecho_Base: tiene_evolucion_biologica
    Hecho_Base: tiene_superficie_solida
    Hecho_Base: tiene_tecnologia
    ```

### 6. Requerimientos adicionales

Se pide reglas que permitan:

* La lectura y la carga de los hechos.
* Impresión de los hechos (por consola).
* Realizar un menú que indique las tareas a realizar: cargar datos, imprimir hechos, realizar consultas, etc. (se podría hacer un predicado `inicio/0`, que ejecute todo lo necesario para comenzar).

### 7. Materiales provistos por la cátedra

Para realizar el trabajo, la catedra provee:

* Un archivo CSV `planetas.csv` con los hechos de cinco planetas.
* Archivos con ejemplos de:
    * Lectura de archivos CSV (`cargar_datos_pl` con `rutas.csv` y `horarios.csv` a leer).
    * Uso de los predicados `assertz/1`, `retractall/1`, `maplist/2`.
    * Uso de los predicados de entrada salida: `write/1`, `writeln/1`, `read/1`.
    * Uso de los predicados de segundo orden: `forall/2`, `setof/3`, etc.
* Ejemplo de salida de de justificación que explique cómo se llegó a cada inferencia.

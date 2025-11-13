## Sistema Experto: Evaluación de Vida Inteligente en Planetas - 2do Cuatrimestre - 2025
*Logica para las Ciencias Informaticas - Lic. en Sistemas*

**Facultad de Ciencias de la Administración**
<br>
*Universidad Nacional de Entre Ríos*

## Integrantes
- Agustín Bravo  
- Sofía Guardia 
- Valentin Delfin
---

## Descripción del Proyecto

Sistema Experto en Prolog que evalúa la existencia de vida en distintos planetas basándose en hechos científicos y reglas lógicas. El sistema infiere diferentes niveles de vida (básica, compleja, inteligente) y condiciones de habitabilidad utilizando información cargada desde archivos CSV.

## Objetivos

- **Comprender el uso de reglas y hechos en Prolog** para construir un sistema experto
- **Aplicar razonamiento lógico** para inferir conocimiento a partir de información base
- **Integrar datos externos** (archivo CSV) al motor lógico de Prolog
- **Diseñar un modelo de inferencia** que distinga entre distintos tipos de vida y condiciones
- **Analizar variaciones** en los hechos y su impacto en las inferencias finales

## Estructura del Proyecto

```
proyecto_prolog/
├── main.pl              # Menú principal y ejecución
├── hechos.pl           # Manejo de datos CSV y hechos
├── reglas.pl           # Reglas lógicas de inferencia
├── consultas.pl        # Menús de consultas y explicaciones
├── pruebas.pl          # Suite de pruebas automatizadas
├── planetas.csv        # Base de datos de planetas y características
└── README.md           # Este archivo
```

## Características Implementadas

### 1. Base de Conocimiento
- Carga automática de hechos desde `planetas.csv`
- 5 planetas predefinidos: Tierra, Marte, Venus, Europa, Kepler452b
- 10 características posibles por planeta

### 2. Reglas de Inferencia
- **Vida básica**: atmósfera + agua líquida + elementos biogénicos
- **Vida compleja**: vida básica + evolución biológica + superficie sólida
- **Vida inteligente**: vida compleja + tecnología
- **Habitabilidad**: atmósfera + magnetosfera + gravedad estable + ciclo día-noche
- **Fotosíntesis posible**: luz solar + atmósfera
- **Civilización avanzada**: vida inteligente + habitable + fotosíntesis posible

### 3. Funcionalidades

#### Menú Principal
1. **Cargar datos** - Importa hechos desde CSV
2. **Imprimir todos los hechos** - Muestra la base de conocimiento
3. **Realizar consultas** - Submenú de consultas por tipo de vida
4. **Consulta de explicación** - Explica el razonamiento detrás de cada inferencia
5. **Ejecutar pruebas** - Suite de pruebas automatizadas
6. **Salir** - Finaliza el programa

#### Sistema de Explicaciones
- Explicación recursiva de cómo se llegó a cada conclusión
- Detalle de condiciones cumplidas y faltantes
- Soporte para todas las reglas definidas

#### Pruebas Automatizadas
- Tests unitarios con PL-Unit
- Pruebas de robustez con datos vacíos
- Pruebas visuales del sistema de explicación

## Instalación y Ejecución

### Requisitos
- SWI-Prolog y SWI-Prolog-Editor instalado
- Archivos del proyecto en el mismo directorio

### Ejecución
```prolog
?- [main].

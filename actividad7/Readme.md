# Actividad 7 - Completely Fair Scheduler

Angel David Torcelli Barrios - 201801169

---

El Completely Fair Scheduler (CFS) es un algoritmo de programación de procesos en Linux que se convirtió en el algoritmo de programación por defecto a partir de la versión 2.6.23 del kernel. Su funcionamiento se basa en asignar una proporción del tiempo de procesamiento de la CPU a cada tarea en lugar de utilizar reglas estrictas asociadas a un valor de prioridad relativa y un quantum de tiempo fijo.

Las características principales del CFS incluyen:

1. Asignación proporcional de tiempo de CPU: En lugar de asignar valores de prioridad estrictos, el CFS asigna una proporción del tiempo de CPU a cada tarea en función de su valor "nice". Los valores "nice" van de -20 a +19, donde un valor "nice" menor indica una prioridad relativa más alta y una mayor proporción de tiempo de CPU.

2. Latencia objetivo: El CFS utiliza una latencia objetivo, que es un intervalo de tiempo en el que cada tarea ejecutable debería ejecutarse al menos una vez. La asignación de la proporción de tiempo de CPU se realiza en función de esta latencia objetivo.

3. Virtual Run Time: El CFS registra cuánto tiempo ha ejecutado cada tarea mediante el uso de la variable por tarea llamada "vruntime". Esta virtual run time está asociada a un factor de decaimiento basado en la prioridad de la tarea.

4. Árbol Rojo-Negro para tareas ejecutables: En lugar de utilizar una estructura de cola estándar, el CFS utiliza un árbol rojo-negro para organizar las tareas ejecutables, donde la clave de ordenación es el valor de "vruntime".

El proceso de decisión de qué tarea ejecutar a continuación se basa en seleccionar la tarea con el valor de "vruntime" más pequeño. Además, una tarea de mayor prioridad que se vuelve disponible para ejecutarse puede interrumpir una tarea de menor prioridad.

El CFS también implementa el balance de carga, asegurando que cada núcleo de procesamiento tenga una carga aproximadamente equitativa. Utiliza una técnica sofisticada que minimiza la migración de hilos y es consciente de la arquitectura NUMA (Non-Uniform Memory Access).

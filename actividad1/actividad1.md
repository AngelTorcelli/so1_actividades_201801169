# Actividad 1

Angel David Torcelli Barrios
Carnet: 201801169
Curso: Sistemas operativos 1

## Tipos de Kernel y sus diferencias

<div style="display:flex; justify-content:center">
<img src="../assets/types of kernel.png" width="420px">
</div>

### Núcleos Monolíticos

Estos sistemas tienen un núcleo grande y complejo, que engloba todos los servicios del sistema. Está programado de forma no modular, y tiene un rendimiento mayor que un micronúcleo. Sin embargo, cualquier cambio a realizar en cualquier servicio requiere la recompilación del núcleo y el reinicio del sistema para aplicar los nuevos cambios.

Un sistema operativo con núcleo monolítico concentra todas las funcionalidades posibles (planificación, sistema de archivos, redes, controladores de dispositivos, gestión de memoria, etc) dentro de un gran programa. El mismo puede tener un tamaño considerable, y deberá ser recompilado por completo al añadir una nueva funcionalidad.

Un error en una rutina puede propagarse a todo el núcleo.

### Micro-núcleos

Son núcleos de pequeño tamaño que fueron compilados sólo con las necesidades más básicas del sistema operativo. El resto de funcionalidades son añadidas mediante la adición de módulos externos al núcleo, lo que les proporciona flexibilidad y facilidad de ampliación. Son mas seguros que los Monolíticos.

### Núcleos Híbridos

Núcleo híbrido es una arquitectura basada en la combinación de microkernel y núcleo monolítico, estas arquitecturas son utilizadas dentro de las computadoras por medio de los sistemas operativos

Una característica especial con que cuenta el núcleo híbrido es que incluyen código extra con el objetivo de mejorar el rendimiento.

A diferencia de los núcleos monolíticos tradicionales, los controladores de dispositivos y las extensiones al sistema operativo se pueden cargar y descargar fácilmente como módulos, mientras el sistema continúa funcionando sin interrupciones. También, a diferencia de los núcleos monolíticos tradicionales, los controladores pueden ser prevolcados (detenidos momentáneamente por actividades más importantes) bajo ciertas condiciones. Esta habilidad fue agregada para gestionar correctamente interrupciones de hardware, y para mejorar el soporte de Multiprocesamiento Simétrico.

### Exonúcleos

Los exonúcleos, también conocidos como sistemas operativos verticalmente estructurados, representan una aproximación radicalmente nueva al diseño de sistemas operativos. La idea subyacente es permitir que el desarrollador tome todas las decisiones relativas al rendimiento del hardware. Los exonúcleos son extremadamente pequeños, ya que limitan expresamente su funcionalidad a la protección y el multiplexado de los recursos. Se llaman así porque toda la funcionalidad deja de estar residente en memoria y pasa a estar fuera, en librerías dinámicas.

## User vs Kernel Mode

- **User mode**: cuando se inicia un programa en un sistema operativo, digamos Windows, se inicia el programa en user mode. Cuando un programa en user mode solicita ejecutarse, Windows crea un proceso y un espacio de direcciones virtuales (espacio de direcciones para ese proceso). Los programas en user mode tienen menos privilegios que las aplicaciones en user mode y no pueden acceder a los recursos del sistema directamente. Por ejemplo, si una aplicación en modo usuario desea acceder a los recursos del sistema, primero deberá pasar por el kernel del sistema operativo mediante llamadas al sistema.  
  </br>

- **Kernel mode**: el kernel es el programa central en el que se basan todos los demás componentes del sistema operativo, se utiliza para acceder a los componentes de hardware y programar qué procesos deben ejecutarse en un sistema informático y cuándo, y también gestiona la interacción del software y el hardware de la aplicación. . Por lo tanto, es el programa más privilegiado; a diferencia de otros programas, puede interactuar directamente con el hardware. Cuando los programas que se ejecutan en user mode necesitan acceso al hardware, por ejemplo, una cámara web, primero debe pasar por el kernel mediante una llamada al sistema y, para llevar a cabo estas solicitudes, la CPU cambia del user mode a kernel mode en el momento de la ejecución. Después de completar finalmente la ejecución del proceso, la CPU vuelve nuevamente al user mode.

**Tabla comparativa**
|Criterios|Kernel Mode|User Mode|
|--------|--------|-------|
| Acceso a recursos | El programa tiene acceso directo y sin restricciones a los recursos del sistema. | El programa de aplicación no tiene acceso directo a los recursos del sistema. Para acceder a los recursos, se debe realizar una llamada al sistema. |
| Interrupciones | Todo el sistema operativo podría dejar de funcionar si se produce una interrupción. | Un único proceso falla si se produce una interrupción. |
| Modos| El modo kernel también se conoce como modo maestro, modo privilegiado o modo sistema. | El modo de usuario también se conoce como modo sin privilegios, modo restringido o modo esclavo.|
|Espacio de direcciones virtuales|Todos los procesos comparten un único espacio de direcciones virtuales.| Todos los procesos obtienen un espacio de direcciones virtuales separado.|
|Nivel de privilegio| Las aplicaciones tienen más privilegios en comparación con el modo usuario.| Mientras está en modo usuario las aplicaciones tienen menos privilegios.|
|Restricciones|Como el modo kernel puede acceder tanto a los programas del usuario como a los programas del kernel, no hay restricciones|Mientras que el modo de usuario necesita acceder a los programas del kernel, ya que no puede acceder a ellos directamente.|
|Fallo del sistema|Un fallo del sistema en modo kernel es grave y complica las cosas.|En modo usuario, un fallo del sistema se puede recuperar simplemente reanudando la sesión.|

## Interruptions vs traps

La diferencia entre una trampa y una interrupción es que un programa de usuario activa una trampa para invocar la funcionalidad del sistema operativo. Aún así, un dispositivo de hardware activa una interrupción para permitir que el procesador ejecute la rutina de manejo de interrupciones correspondiente.

| Trap                                                                                                                              | Interruption                                                                                                     |
| --------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| Es una señal generada por un programa de usuario que indica al sistema operativo que realice alguna funcionalidad inmediatamente. | La interrupción es una señal a la CPU emitida por hardware que indica un evento que requiere atención inmediata. |
| Es un proceso sincrónico.                                                                                                         | Es un proceso asincrónico.                                                                                       |
| Todas las trampas son interrumpidas.                                                                                              | No todas las interrupciones son trampas.                                                                         |
| Puede ocurrir sólo desde los dispositivos de software.                                                                            | Puede ocurrir desde los dispositivos de hardware y software.                                                     |
| Una instrucción del programa de usuario lo genera.                                                                                | Los dispositivos de hardware lo generan.                                                                         |
| También se conoce como interrupción de software.                                                                                  | También se conoce como interrupción de hardware.                                                                 |
| Ejecuta la funcionalidad específica en el sistema operativo y otorga control al controlador de trampas.                           | Obliga a la CPU a activar una rutina de manejo de interrupciones específica.                                     |

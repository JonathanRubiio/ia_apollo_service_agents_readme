# Apollo Services · documentación

Documentación pública de **Apollo Services**, un CRM comercial multicanal con agentes de IA. Este repositorio
no contiene código de la aplicación: reúne **qué estamos construyendo, por qué y con qué sustento**, para que
docentes y revisores puedan entender el proyecto sin pedir explicaciones aparte.

> **Estado:** los requerimientos y el diseño técnico están cerrados. Todavía no hay código de la aplicación;
> el siguiente paso es la implementación (migraciones SQL, primer workflow de M2 y la app web).
> Apollo Services **no está en producción**.

## Qué es

Apollo Services centraliza las conversaciones de **WhatsApp, Instagram y Facebook** en una sola bandeja y usa
**agentes de IA** para clasificar contactos (Seguidor o Prospecto), calificar prospectos, agendar reuniones
comerciales y dar seguimiento a cada oportunidad. Se vende por **módulos independientes** y cada cliente
recibe su propia infraestructura.

| Módulo | Qué hace |
|---|---|
| M1 · Bandeja unificada | Centraliza las conversaciones de redes sociales en un único filtro tipo CRM |
| M2 · Agente de respuesta a potenciales clientes | Clasifica Seguidor/Prospecto y recolecta los datos obligatorios |
| M3 · Agente de bienvenida y categorización | Se activa con el evento "seguir" y categoriza el interés |
| M4 · Agente de atención a Gerencia | Responde consultas en lenguaje natural; solo lee, nunca modifica |
| M5 · Dashboard gerencial | Tablero web con login y estadísticas |
| M6 · Agente de agendamiento y cierre | Coordina la fecha, confirma, agenda y da seguimiento |

Los módulos **nunca se llaman entre sí**: cada uno observa el estado en la base de datos compartida y decide su
flujo. Así cualquiera se vende y funciona de forma independiente.

## Dónde leer

| Si quieres saber… | Lee |
|---|---|
| Qué se investiga y con qué sustento | [`docs/academico/anteproyecto-resumen.md`](docs/academico/anteproyecto-resumen.md) |
| En qué fuentes se apoya | [`docs/investigacion/referencias.md`](docs/investigacion/referencias.md) |
| Los conceptos que sostienen el proyecto | [`docs/investigacion/temas-clave.md`](docs/investigacion/temas-clave.md) |
| Las cifras y definiciones que se repiten | [`docs/investigacion/valores-clave.md`](docs/investigacion/valores-clave.md) |
| La lógica de negocio, en 8 capas | [`docs/requerimientos/`](docs/requerimientos/README.md) |
| Las decisiones técnicas (stack, base de datos, prompts, despliegue) | [`docs/diseno-tecnico/`](docs/diseno-tecnico/README.md) |

Orden sugerido para un revisor: resumen del anteproyecto, valores clave, requerimientos y diseño técnico.

## Sobre el caso de estudio

La investigación asociada usa a **Bienestar Integral S.A.S.** como caso: es una **organización simulada de
referencia**, definida por los autores, que puede sustituirse por una pyme real sin cambiar el diseño. Los
resultados descritos en estos documentos son estimaciones y planes, no mediciones de una operación real.

## Cómo se mantiene

Esta documentación se **sincroniza desde el repositorio principal de implementación**, que es donde se
escribe. Quien edite aquí `docs/requerimientos/`, `docs/diseno-tecnico/` o `docs/marca/` verá su cambio
sobrescrito en la siguiente sincronización. Los archivos de `docs/investigacion/` y `docs/academico/` se
escriben directamente en este repositorio.

## Autores

Jonathan Adonay Rubio Jimenez, Jhoan Jesus Cardozo Gelvis e Ivan Dario Zarate Rincon.
Repositorio principal de implementación: <https://github.com/JonathanRubiio/ia_apollo_service_agents>.

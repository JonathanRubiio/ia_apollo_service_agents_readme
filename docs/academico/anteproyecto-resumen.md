# Anteproyecto: resumen

Resumen del anteproyecto de grado asociado a Apollo Services, desarrollado en la Especialización en
Inteligencia Artificial. Es un resumen para entender qué se investiga; el detalle está en
[`../investigacion/`](../investigacion/).

**Título.** Implementación de agentes de inteligencia artificial para clasificar prospectos y su efecto en
la conversión en una pyme de salud estética.

**Autores.** Jonathan Adonay Rubio Jimenez, Jhoan Jesus Cardozo Gelvis e Ivan Dario Zarate Rincon.

## Problema

En las pymes de servicios, y en especial en las de salud estética, equipos comerciales de 2 a 5 personas
atienden a mano conversaciones de WhatsApp, Instagram y Facebook. Cada canal se revisa por separado, no hay
una bandeja única ni un criterio claro para separar a quien solo mira (Seguidor) de quien quiere comprar
(Prospecto). Eso produce contactos sin respuesta a tiempo, falta de registro único y citas que se pierden
porque agendarlas depende de una confirmación manual. El problema es la pérdida de conversión comercial.

## Pregunta y objetivos

**Pregunta.** ¿En qué medida la implementación de agentes de inteligencia artificial que unifican los canales
de contacto, clasifican las conversaciones como Seguidor o Prospecto y agendan citas afecta la tasa de
conversión de prospectos a citas comerciales confirmadas en una pyme bogotana de salud estética?

**Objetivo general.** Implementar agentes de inteligencia artificial que unifiquen los canales de contacto,
clasifiquen las conversaciones y agenden citas con prospectos en una pyme bogotana de salud estética, con la
medición de su efecto en la tasa de conversión de prospectos a citas comerciales confirmadas.

**Objetivos específicos.**

1. Caracterizar el proceso comercial actual de la pyme, sin agentes de IA, e identificar dónde se pierden prospectos.
2. Definir las condiciones de implementación de los agentes (bandeja unificada, clasificación y agendamiento).
3. Implementar los agentes mediante su diseño y su proceso de desarrollo, con intervención humana en la contratación.
4. Evaluar su efectividad con pruebas y validaciones que midan y comparen la tasa de conversión antes y después.

## Justificación

- **Práctica:** perder prospectos por atención multicanal desordenada es un problema de negocio real (DANE 2025a, 2025b; Ruiz Mejia & Rawat 2025).
- **Académica:** la literatura se centra en la adopción de IA y en la satisfacción del cliente, y la conversión casi no se mide (Nicolescu & Tudorache 2022; Vergaray et al. 2023; González-Flores et al. 2025).
- **Profesional:** un caso medido sirve de guía a otras pymes con presupuestos tecnológicos parecidos.

## Alcances y limitaciones

- **Alcance:** tres agentes, una variable (la tasa de conversión) y un caso, en las 12 semanas de la fase de ejecución. No evalúa ingresos, satisfacción ni retorno de la inversión.
- **Limitaciones:** caso único y simulado (una pyme real lo sustituye sin cambiar el diseño); datos personales sensibles (Ley 1581 de 2012); la confianza del usuario pesa en la efectividad y no se mide; un diseño antes/después no aísla otras causas.

## Estado

El diseño técnico está cerrado y todavía no hay código de la aplicación: el siguiente paso es la
implementación. Apollo Services **no está en producción**; es la solución que se propone construir y evaluar.

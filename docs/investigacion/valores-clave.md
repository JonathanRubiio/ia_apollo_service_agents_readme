# Valores clave del proyecto

Cifras, definiciones y decisiones que se repiten en los documentos. Si un valor cambia, se corrige
aquí y en el documento donde nació.

## Pregunta, objetivos y variables

| Elemento | Valor |
|---|---|
| Pregunta de investigación | ¿En qué medida la implementación de agentes de inteligencia artificial que unifican los canales de contacto, clasifican las conversaciones como Seguidor o Prospecto y agendan citas afecta la tasa de conversión de prospectos a citas comerciales confirmadas en una pyme bogotana de salud estética? |
| Variable independiente | Los agentes de IA (bandeja unificada, clasificación y agendamiento) |
| Variable dependiente | Tasa de conversión de prospecto a cita confirmada |
| Indicadores | Tiempo de primera respuesta; proporción de contactos sin respuesta; tasa de conversión |
| Caso de estudio | Bienestar Integral S.A.S., organización simulada de referencia, sede de Bogotá, equipo comercial de 3 personas |
| Plan de ejecución | 12 semanas: 2 para caracterizar y definir, 6 para implementar, 4 para evaluar |

## Contexto colombiano (DANE)

| Cifra | Valor | Fuente |
|---|---|---|
| Personas de Bogotá que usaron internet en 2024 | 88,4 % | DANE 2025b, p. 13 |
| De quienes usaron internet, los que lo hicieron para video, llamadas o mensajería instantánea | 87,3 % (nacional) | DANE 2025b, p. 21 |
| De quienes usaron internet, los que lo hicieron para redes sociales | 80,2 % (nacional) | DANE 2025b, p. 21 |
| Micronegocios que no usaron internet en su actividad | 50,4 % (nacional); 38,3 % en cabeceras municipales | DANE 2025a, pp. 3, 29–30 |
| Definición de micronegocio | Unidad de máximo 9 personas ocupadas | DANE 2025a |

## Costo mensual estimado de operar Apollo Services para un cliente

Supuesto de volumen: unos 100 casos al mes, de 12 a 25 mensajes cada uno (1.500 a 2.500 turnos al mes).
Son tarifas públicas de referencia, sin impuestos; no son una cotización. Revisadas el 2026-10-31.

| Componente | Base | Costo mensual |
|---|---|---|
| Servidor por cliente (4 vCPU, 8 GB, 160 GB) | Hetzner CPX32 en Europa, 35,99 EUR; CPX31 en EE. UU., 62,99 EUR | 36–63 EUR |
| Modelo conversacional (Claude) | Supuesto: 2.000 tokens de entrada y 200 de salida por turno. Haiku 3.5 a 0,80/4 USD por millón de tokens y Sonnet a 3/15 USD (Haiku 4.5 cuesta hoy 1/5 USD) | 4–23 USD |
| Normalización de audio e imagen (Gemini Flash) | 20 % de los turnos con medios; 0,75 USD por millón de tokens de entrada hasta el 31-dic-2026 | Menos de 1 USD |
| Canal de WhatsApp | 360dialog, 49 EUR por número al mes, más tarifa de Meta (sin verificar en la página oficial, 2–6 USD) | 49 EUR + 2–6 USD |
| Almacenamiento y calendario | Dentro del servidor y de Google Calendar | 0 |
| **Total** | | **≈ 85–112 EUR + 6–30 USD** |

El costo de infraestructura y WhatsApp es fijo y el de IA es variable y pequeño a este volumen.

## Stack

PostgreSQL con Supabase (RLS para el acceso humano), n8n para orquestar agentes, Claude y Gemini como
modelos, WhatsApp/Instagram/Facebook como canales, Next.js para la aplicación web, Docker Compose con
Caddy para el despliegue por cliente. Detalle y alternativas evaluadas en
[`../diseno-tecnico/01-investigacion-tecnologica.md`](../diseno-tecnico/01-investigacion-tecnologica.md).

## Módulos

M1 bandeja unificada · M2 agente de respuesta a potenciales clientes · M3 agente de bienvenida y
categorización · M4 agente de atención a Gerencia · M5 dashboard gerencial · M6 agente de agendamiento y
cierre. La intervención del estudio usa M1, M2 y M6.

## Pendientes conocidos

- Validar con asesoría legal una política de tratamiento de datos personales (Habeas Data, Colombia) antes del lanzamiento comercial.
- Definir el agente interno de seguimiento.
- Confirmar la tarifa de mensajes de Meta en su página oficial.

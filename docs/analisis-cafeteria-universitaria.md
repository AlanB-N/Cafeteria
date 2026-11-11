# Análisis del proyecto: Sistema de pedidos para cafetería universitaria

Documento base para construir la aplicación móvil del estudiante y el administrador web del personal. Está pensado para dárselo a OpenCode como contexto del proyecto (por ejemplo, guardándolo como `docs/analisis.md` y referenciándolo desde `AGENTS.md`).

Convención: lo que viene de la Actividad 2 está escrito sin marca. Lo que es una **propuesta** (decisión nueva que se debe confirmar) está marcado así.

---

## 1. Visión general

- **Qué es:** un sistema de dos partes, una app móvil para que el estudiante haga su pedido y un administrador web para que el personal lo gestione.
- **Problema que resuelve:** hoy los pedidos se registran con mensajes y notas en papel, lo que genera errores, saturación de cocina en ciertas horas y falta de seguimiento.
- **Objetivo principal:** un solo registro ordenado de pedidos, con límite por horario de recogida, productos agotados controlados y estado del pedido visible para el estudiante.

---

## 2. Arquitectura y estructura principal

Tres pilares:

- **App del estudiante (móvil):** ver menú, armar pedido, elegir franja de recogida, seguir el estado y consultar historial.
- **Administrador web (personal):** recibir, validar y procesar pedidos; mantener menú, horarios y consulta de estudiantes. Acceso por rol.
- **Backend y base de datos (compartidos):** única fuente de verdad. Aplica las reglas de negocio, guarda el historial de cambios y notifica el cambio de estado a la app.

**Propuesta de stack (confirmar):**

- **Base de datos:** PostgreSQL. Se elige porque permite transacciones, necesarias para que dos estudiantes no tomen el último lugar de una franja al mismo tiempo.
- **Backend:** Supabase (PostgreSQL + autenticación + políticas por rol + actualizaciones en tiempo real), o una API propia en Node.js si se prefiere control total.
- **Administrador web y app del estudiante:** un solo proyecto en Next.js (React) con TypeScript. La app del estudiante se construye mobile-first como PWA instalable. Si después se necesita app nativa, se puede migrar a React Native reutilizando el backend.

---

## 3. Roles y permisos

| Rol | Puede consultar | Puede modificar |
|---|---|---|
| **Administrador** | Todo: pedidos, menú, horarios, estudiantes, usuarios y registro de cambios | Productos y precios, horarios y capacidad, usuarios y permisos; un pedido en casos especiales |
| **Encargado de pedidos** | Pedidos, menú, horarios y ficha del estudiante | Estado de los pedidos, motivo de cancelación, disponibilidad (agotado o disponible), corrección de datos del estudiante. No cambia precios ni usuarios |
| **Personal de cocina** | Solo pedidos confirmados del día (productos, cantidades, nombre y hora) | Únicamente estado "En preparación" y "Listo". No cancela ni modifica pedidos |
| **Estudiante** (app) | Menú, franjas con espacio, sus pedidos e historial | Crear pedido; cancelar el suyo bajo la regla 8 |

---

## 4. Módulos del sistema

- **Pedidos:** recibe los pedidos y les da seguimiento hasta la entrega. Responsable: Encargado de pedidos.
- **Menú y existencias:** mantiene productos, precios y disponibilidad. Responsable: Administrador (el Encargado puede marcar agotado).
- **Horarios de recogida:** define franjas, límite de pedidos por franja, tiempo mínimo de preparación y bloqueos. Responsable: Administrador.
- **Estudiantes:** identifica a quien pide y permite consultar su historial y corregir datos. Responsable: Encargado de pedidos.
- **Usuarios y registro de cambios (propuesta):** alta del personal, asignación de rol y consulta de la bitácora de cambios. El PDF menciona estas funciones en el rol de Administrador pero no las desarrolla como módulo; esto cubre el "quinto módulo" que el documento anuncia.

---

## 5. Funcionalidades clave por módulo

### Pedidos
- Tablero de pedidos pendientes ordenado por hora de recogida, con aviso cuando falta poco tiempo.
- Búsqueda y filtros por nombre o número de pedido, estado y franja.
- Confirmación rápida de un pedido sin problemas.
- Cancelación con motivo obligatorio y opción de proponer otro horario.
- Cambio de estado: Pendiente, Confirmado, En preparación, Listo, Entregado (y Cancelado).
- Historial de cambios: quién y a qué hora en cada transición.

### Menú y existencias
- Alta, edición y ocultamiento de productos (nombre, descripción, categoría, precio).
- Interruptor rápido agotado/disponible que se refleja de inmediato en la app.
- Búsqueda por nombre y filtro por categoría.

### Horarios de recogida
- Configuración de horario de apertura y cierre, duración de franja (ej. 15 min) y tiempo mínimo de preparación.
- Límite de pedidos por franja y vista de ocupados contra límite.
- Bloqueo y desbloqueo de franjas con motivo.
- La app solo muestra franjas con espacio y no bloqueadas.

### Estudiantes
- Búsqueda por nombre o identificador (matrícula o teléfono).
- Ficha con pedidos anteriores, estados y cancelaciones.
- Corrección de datos con nota que explique el cambio; aplica a pedidos futuros y no altera el historial.

### Usuarios y registro de cambios (propuesta)
- Alta, baja y cambio de rol del personal.
- Consulta de la bitácora de cambios filtrable por usuario, pedido y fecha.

---

## 6. Pantallas

### Administrador web
- **Pedidos pendientes:** lista por hora, con filtros y confirmación rápida.
- **Detalle del pedido:** productos, total, estado, historial; acciones de confirmar, cancelar con motivo, proponer otro horario.
- **Cocina (pedidos confirmados del día):** vista simplificada para marcar En preparación y Listo.
- **Lista de productos:** disponibilidad rápida, búsqueda, filtro y edición.
- **Horarios y capacidad:** franjas del día con ocupados contra límite, bloqueos.
- **Consulta de estudiantes:** buscador y ficha.
- **Usuarios y bitácora** (propuesta).

### App del estudiante
- Menú (los agotados aparecen deshabilitados u ocultos).
- Carrito y selección de franja de recogida.
- Confirmación del pedido con número.
- Seguimiento del estado y aviso cuando está listo.
- Historial de pedidos y cancelación cuando la regla lo permite.

---

## 7. Flujo principal: pedido de un sándwich y un agua para las 11:30

1. El estudiante envía nombre, identificador, sándwich, agua y franja de 11:30. El sistema agrega fecha y hora de registro y asigna un número.
2. El pedido aparece en "Pedidos pendientes" con estado Pendiente.
3. El Encargado abre el detalle y verifica: datos completos, productos disponibles, franja con espacio, tiempo mínimo de preparación cumplido y que no sea un pedido repetido.
4. Si todo está bien, confirma. Si no, cancela con motivo o propone otro horario.
5. Cocina ve el pedido confirmado y lo marca En preparación y después Listo.
6. El Encargado lo entrega y lo marca Entregado.
7. Cada cambio guarda quién lo hizo y cuándo, y el estudiante lo ve en su app.

---

## 8. Modelo de datos (propuesta)

- **students:** id, nombre, identificador (matrícula o teléfono, único).
- **products:** id, nombre, descripción, categoría, precio, disponible (bool), activo (bool).
- **pickup_slots:** id, fecha, hora_inicio, hora_fin, límite_pedidos, bloqueada (bool), motivo_bloqueo.
- **orders:** id, número, student_id, slot_id, estado, total, motivo_cancelación, creado_en.
- **order_items:** id, order_id, product_id, cantidad, precio_unitario (se copia el precio al momento del pedido).
- **order_status_log:** id, order_id, estado_anterior, estado_nuevo, user_id, fecha_hora.
- **staff_users:** id, nombre, correo, rol (administrador, encargado, cocina), activo.
- **student_corrections:** id, student_id, campo, valor_anterior, valor_nuevo, nota, user_id, fecha_hora.
- **Parámetros de configuración:** tiempo mínimo de preparación, minutos de ventana anti-duplicados, minutos antes para cancelación del estudiante (30).

---

## 9. Reglas de funcionamiento

1. **Pedido completo:** no se confirma sin nombre, productos u horario.
2. **Límite por franja:** no se confirman más pedidos que el límite; se ofrece otra hora.
3. **Solo productos disponibles:** no se acepta un pedido con productos agotados.
4. **Motivo al cancelar:** obligatorio cuando la cafetería cancela.
5. **Estados visibles:** todo cambio se muestra en la app y guarda quién y cuándo.
6. **Sin pedidos repetidos:** mismo nombre, productos y horario en los últimos minutos no se vuelve a crear.
7. **Permisos por rol:** solo el administrador cambia precios, horarios y usuarios; cocina solo estados de preparación.
8. **Cancelación del estudiante:** solo mientras el pedido no esté en preparación y hasta 30 minutos antes de la hora.
9. **Propuesta (el PDF anuncia nueve y lista ocho):** una franja bloqueada o llena nunca se ofrece al estudiante, y el servidor lo valida aunque la app esté desactualizada.

**Decisión pendiente:** qué estados cuentan para ocupar lugar en la franja. Propuesta: todo pedido que no esté Cancelado ocupa lugar desde que se crea, para evitar sobreventa.

---

## 10. Posibles cuellos de botella o riesgos

- **Sobreventa de franjas y productos en horas pico:** si dos estudiantes toman el último lugar a la vez. Mitigación: validar y descontar capacidad dentro de una transacción en la base de datos, no solo en la app.
- **Información desactualizada en la app:** un producto agotado o franja llena puede seguir visible unos segundos. Mitigación: actualización en tiempo real y revalidación en el servidor al enviar el pedido.
- **Validación manual del Encargado:** comprobar duplicados y factibilidad a mano puede saturarse en ventanilla. Mitigación: automatizar las reglas 1, 2, 3 y 6 al crear el pedido.
- **Regla de cancelación de 30 minutos:** depende de la hora del servidor, no del teléfono del estudiante.
- **Permisos:** las restricciones por rol deben aplicarse en el backend; ocultar botones en pantalla no basta.
- **Identificador del estudiante:** definir si se usa matrícula, teléfono o ambos, y cómo se valida para evitar suplantaciones.

---

## 11. Orden sugerido de construcción

1. Proyecto base, base de datos, autenticación y roles (con pruebas de permisos).
2. Menú y existencias.
3. Horarios de recogida y capacidad.
4. Pedidos: creación con validaciones, estados y bitácora.
5. Tablero del Encargado, detalle del pedido y vista de cocina.
6. Estudiantes y correcciones.
7. App del estudiante: menú, carrito, franja, seguimiento, historial y cancelación.
8. Actualización en tiempo real, pruebas de concurrencia (dos pedidos simultáneos al último lugar) y pulido.

---

## 12. Instrucción inicial sugerida para OpenCode

> Lee `docs/analisis.md`. Trabaja por fases en el orden de la sección 11. Antes de escribir código, propón la estructura de carpetas y el esquema de base de datos de la sección 8 y espera mi confirmación. Aplica las reglas de negocio de la sección 9 en el backend, no solo en la interfaz. Después de cada fase, ejecuta las pruebas y resume qué quedó hecho y qué falta.

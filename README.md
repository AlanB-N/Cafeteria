# Sistema de Pedidos - Cafetería Universitaria

Sistema integral compuesto por:
1. **Administrador Web (PHP + MySQL + AdminLTE 3 + Bootstrap 4)** para el personal de la cafetería.
2. **API RESTful (PHP / JSON)** para la comunicación en tiempo real.
3. **Aplicación Móvil Android (Kotlin + Material Design + Retrofit)** para los estudiantes.

---

## 1. Cuentas de Acceso al Administrador Web

Accede desde tu navegador a: **`http://localhost/Cafeteria/`**

| Rol | Usuario | Contraseña | Permisos y Capacidades |
| :--- | :--- | :--- | :--- |
| **Administrador** | `admin` | `admin123` | Control total: altas de productos, modificación de precios, generación de franjas, bloqueo de horarios, control de usuarios y bitácora de auditoría. |
| **Encargado de Pedidos** | `encargado` | `encargado123` | Tablero de validación de pedidos, confirmación rápida, cancelación con motivo obligatorio, entrega y switch rápido de disponibilidad de productos. |
| **Personal de Cocina** | `cocina` | `cocina123` | Monitor táctil KDS: pedidos confirmados del día, botones grandes para marcar *En preparación* y *Listo*. No cancela ni altera precios. |

---

## 2. Base de Datos (`cafeteria`)

- **Host:** `localhost`
- **Usuario:** `root`
- **Contraseña:** `123456789`
- **Base de datos:** `cafeteria`
- **Script SQL:** [cafeteria.sql](file:///c:/AppServ/www/Cafeteria/bd/cafeteria.sql)

Tablas principales:
- `staff_users`: Personal de cafetería con contraseñas encriptadas con BCRYPT.
- `students`: Estudiantes identificados por matrícula o teléfono.
- `categories` y `products`: Menú de alimentos y bebidas con switch de disponibilidad.
- `pickup_slots`: Franjas horarias con límite de capacidad por franja y bloqueos.
- `orders` y `order_items`: Pedidos y desglose con estados de preparación.
- `order_status_log`: Registro de auditoría (quién cambió el estado y a qué hora).
- `student_corrections`: Corrección de datos de estudiantes con justificación obligatoria.
- `configuracion`: Parámetros de negocio (tiempos mínimos de preparación, antiduplicados, etc.).

---

## 3. Endpoints de la API REST (`/api/`)

- `POST /api/auth/login.php`: Inicio de sesión o registro de estudiante por matrícula.
- `GET /api/menu/get_menu.php`: Catálogo de categorías y productos con estado disponible/agotado.
- `GET /api/franjas/get_slots.php`: Horarios de recogida disponibles (valida cupo restante y tiempo mínimo).
- `POST /api/pedidos/create_order.php`: Creación de pedidos con validación transaccional anti-sobreventa y anti-duplicados.
- `GET /api/pedidos/get_orders.php?student_id=X`: Historial y seguimiento de pedidos en tiempo real.
- `POST /api/pedidos/cancel_order.php`: Cancelación por parte del estudiante (Regla 8: antes de preparación y hasta 30 min antes).

---

## 4. Aplicación Android (Kotlin)

Ubicación del proyecto: **`c:\AppServ\www\Cafeteria\android_app`**

### Cómo abrirlo y ejecutarlo:
1. Abre **Android Studio**.
2. Selecciona **Open** y navega a `c:\AppServ\www\Cafeteria\android_app`.
3. Espera a que Gradle sincronice las dependencias (Retrofit, Coroutines, Material Design).
4. Ejecuta la app en el emulador de Android Studio o en tu teléfono físico.
   - *Nota:* En el emulador de Android Studio se conecta automáticamente a `http://10.0.2.2/Cafeteria/api/`. Si pruebas en un celular físico conectado por WiFi, puedes indicar la IP local de tu PC en `ApiClient.kt`.

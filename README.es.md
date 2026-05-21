# Análisis Exploratorio con SQL — Base de Datos de Biodiversidad

> 15 misiones SQL en cuatro niveles de dificultad, trabajando en una base de datos SQLite del mundo real con observaciones de fauna global extraídas del portal de biodiversidad GBIF — ejecutadas con Python y mostradas como DataFrames de pandas.

---

## Problema

Los datos crudos almacenados en una base de datos solo son útiles si puedes hacerles preguntas. Este proyecto pone esa habilidad en práctica con un escenario realista: el ficticio **Instituto Global de la Vida (GIL)**, un centro de monitoreo de biodiversidad que registra observaciones de especies en docenas de regiones de todo el mundo. El objetivo es responder preguntas analíticas progresivamente más difíciles usando SQL puro — desde filtrado básico hasta agregaciones con JOIN entre múltiples tablas.

## Dataset

- **Fuente:** [GBIF – Global Biodiversity Information Facility](https://www.gbif.org/occurrence) (muestra)
- **Base de datos:** SQLite (`data/database.db`), construida con `src/sql/create.sql` + `src/sql/insert.sql`
- **Tablas:**

| Tabla | Descripción |
|---|---|
| `regions` | 40+ regiones geográficas (Australia, Argentina, Uganda, Canadá, Noruega y más) |
| `species` | Registros de especies con nombre científico, nombre común, género, familia, orden |
| `observations` | Avistamientos individuales: especie, región, observador, fecha, coordenadas, cantidad |
| `climate` | Datos climáticos por región: temperatura media, precipitación |

## Misiones (15 en total)

### Nivel 1 — Exploración Básica (SELECT, LIMIT, DISTINCT, WHERE)
1. Primeras 10 observaciones registradas
2. Valores distintos de `region_id` en el dataset
3. Conteo de especies distintas observadas
4. Observaciones para `region_id = 2`
5. Observaciones registradas en una fecha específica

### Nivel 2 — Agregación y Ordenación (GROUP BY, COUNT, ORDER BY, HAVING)
6. Región con más observaciones
7. Top 5 de especies más observadas
8. Especies con menos de 5 registros (avistamientos raros)
9. Observadores más activos por número de registros

### Nivel 3 — Relaciones entre Tablas (JOIN)
10. Registros de observaciones con nombres de región
11. Registros de observaciones con nombres científicos de especies
12. Especie más observada por región (GROUP BY + ORDER BY en dos tablas)

### Nivel 4 — Manipulación de Datos (INSERT, UPDATE, DELETE — opcional)
13. Insertar un registro de observación de prueba
14. Corregir un nombre científico con error tipográfico (`Panthera oncca` → `Panthera onca`)
15. Eliminar una observación específica por ID

## Cómo Funciona

Las consultas se escriben en `src/sql/queries.sql`. Ejecutar `python src/app.py` lanza cada consulta y muestra los resultados como DataFrames de pandas formateados en la terminal.

```bash
git clone https://github.com/matthewkane-ml/SQL_MTK.git
cd SQL_MTK
pip install -r requirements.txt
python src/app.py
```

La solución completa a las 15 misiones está en `src/solution.sql`.

## Stack Tecnológico

`Python` · `SQLite` · `SQLAlchemy` · `pandas`

## Próximos Pasos

- Visualizar los resultados de las consultas con Matplotlib — por ejemplo, un mapa de densidad de observaciones por región usando coordenadas de latitud/longitud
- Añadir índices en `observations(species_id)` y `observations(region_id)` para entender cómo la indexación acelera las consultas GROUP BY en tablas grandes
- Migrar de SQLite a PostgreSQL y practicar funciones de ventana (`RANK()`, `ROW_NUMBER()`, `LAG()`) para análisis de tendencias en series temporales

---

**Autor:** Matthew Kane — [LinkedIn](https://www.linkedin.com/in/thomas-k-392094410/) · [Portafolio GitHub](https://github.com/matthewkane-ml)

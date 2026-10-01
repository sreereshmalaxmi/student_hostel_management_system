# Normalization

The project is documented as normalized up to Third Normal Form (3NF).

## 1NF
- Store atomic values.
- Remove repeating groups.
- Multi-valued phone and email attributes are represented in separate child tables.

## 2NF
- The design removes partial dependencies from composite-key relations.
- Student information is kept in `STUDENT`, while payment information is kept in `FEE_PAYMENT`.

## 3NF
- The design removes transitive dependencies.
- Warden information is stored in `WARDEN` rather than being repeated as room attributes.

## Result

The normalized design reduces redundancy and helps avoid insertion, update, and deletion anomalies while preserving relationships through primary and foreign keys.

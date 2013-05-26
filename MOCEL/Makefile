nombreBD = mocel

.PHONY: all clean borrarBD crearBD cargar definir

   all: crearBD definir cargar
 clean: borrarBD

 borrarBD: ; dropdb   $(nombreBD)
  crearBD: ; createdb $(nombreBD)

  cargar: ; psql $(nombreBD) -f insert.sql
 definir: ; psql $(nombreBD) -f schema.sql

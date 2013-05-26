select Cliente.cedula, Cliente.nombre, Plan.nombre_plan

from Plan
     natural join Cliente
     natural join Contrata;

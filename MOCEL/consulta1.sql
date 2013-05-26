select Cliente.cedula, Cliente.nombre, Plan.nombre_plan, Producto.tipo

from Contrata
     natural join Producto
     natural join Cliente
     natural join Plan

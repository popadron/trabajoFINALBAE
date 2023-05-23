
<div align="justify">


<div align="center">   
<img src=https://videlcloud.files.wordpress.com/2017/01/formasnormalesbd.png width="400px">
</div>
  




<div align="center">
  
# __Normalizacion Clínica Veterinaria__ 
## Patricia y Oliver
### Base de Datos 1º DAM
 
</div>

---

# Índice  
  
1. [Comprobar si se cumple la 1ª Forma Normal](#id1) 
2. [Comprobar si se cumple la 2ª Forma Normal](#id2) 
3. [Comprobar si se cumple la 3ª Forma Normal](#id3) 
  
  
### Gestión de una Clínica Veterinaria
  
#### 1. Comprobar si se cumple la 1ª Forma Normal<a name="id1"></a> 
  
- Analizando todas las tablas, llegamos a la conclusión de que en ninguna tabla hay campos repetidos, por lo tanto todas las tablas se encuentran en la 1 FN.

---  
  
#### 2. Comprobar si se cumple la 2ª Forma Normal<a name="id2"></a>
  
- Todos los atributos que no forman parte de la Clave Principal tienen dependencia funcional completa de ella.

  
 #### Problemas encontrados:
  
  - En la tabla Mascota, hay redundancia de información y hay que separar los campos tipo y raza de la tabla.
  - En la tabla personal hay también que separar el cargo de todo lo demás quedando todas las tablas de esta manera:
  
  
  <div align="center">
  Tabla Mascota
  
  | id_mascota | dni_cliente | Nombre | Sexo | id_tipo | id_raza |
|------------|-------------|--------|------|---------|---------|
| 1          | 78745121    | Luna   | H    | 1       | 3       |
| 2          | 78542136    | Peluso | M    | 2       | 2       |
| 3          | 78451235    | Orion  | M    | 2       | 1       |
    
    
    
 Tabla Personal
    
| dni_empleado | Nombre    | Apellido  | Cargo | Teléfono  | Calle           |
|--------------|-----------|-----------|-------|-----------|-----------------|
| 78563021     | Ataulfo   | La Piedra | 1010  | 666666666 | C/ No quiero    |
| 78456123     | Arnocledo | Pérez     | 2020  | 625459871 | C/ QUIEROACABAR |
| 45689321     | Juliana   | Hérnandez | 3030  | 619231456 | C/ PIEDAD       |
    
 Tabla cita

 | id_cita | dni_cliente | Fecha      |
|---------|-------------|------------|
| 0010    | 78542136    | 2023-12-22 |
| 0030    | 78451235    | 2024-01-31 |
| 0099    | 78451235    | 2024-05-12 |   
 
 
Tabla Venta
    
| id_venta | n_factura | dni_cliente | Estado    | Fecha      |
|----------|-----------|-------------|-----------|------------|
| 454545   | 2         | 78451235    | Pago      | 2024-02-27 |
| 545454   | 3         | 78542136    | Pendiente | 2024-03-07 |
| 884678   | 4         | 78745121    | Pago      | 2024-02-12 |
    
Tabla Factura
    
| n_factura | Precio | Impuesto | Total |
|-----------|--------|----------|-------|
| 1         | 30     | 0.07     | 32.10 |
| 2         | 40     | 0.07     | 42.80 |
| 3         | 50     | 0.07     | 53.50 |
| 4         | 80     | 0.07     | 85.60 |    

    
    
   
 
    
    
    
    
    
  </div>
  
  
  
 
  
  


  
  
  
  
  
  
  
#### 3. Comprobar si se cumple la 3ª Forma Normal<a name="id3"></a>
  
   #### Problemas encontrados:
  
  En este caso al haber atributos multievaluados como es el caso de la dirección se pasa a la 3 FN, donde quedaría el siguiente esquema de esta forma:
  
  
  - En la tabla Personal, la dirección hay que separarla.
  - En la tabla Clientes también se debe separar la direccíon de lo demás 
  

# Prueba Tecnica para NiuFoods

Versiones utilizadas:

* Ruby ruby 3.0.0

* Rails 7.1.4

* Redis > 6.0

* Unbuntu 20.04

* PostgreSQL 13.4

# Instalacion redis en local

1. correr los siguientes comandos en una terminal
```
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt update
sudo apt install redis-server
```
## Instalación

1. Clonar el repositorio o descargar el archivo comprimido
2. En una terminal con el proyecto abierdo, ejecutar `bundle install` y `yarn install`
3. Crear la base de datos con `rails db:create` y migrar con `rails db:migrate`
4. Crear datos de prueba con `rails db:seed`
5. Correr el comando `bin/dev` para levantar el servidor
6. Asegurarse de tener instalador Redis en el sistema con una version superior a 6.0
7. Levantar el servidor Redis con `sudo service redis-server start`
8. Asegurarse de que redis este corriendo con `redis-cli ping`, debe mostrar `PONG`
9. En otra terminal, correr bundle exec sidekiq para levantar el proceso de sincronización de datos
10. Correr en otra terminar el comando `ruby store_sync_simulator.rb` para levantar el script de sincronización de datos
11. Ingresar a localhost:3000 para ver el sitio


# Descripcion de como funciona el script de simulación de sincronización

El script simula de forma basica el cambio de estado de los dispositivos de las tiendas creadas en el seed, con una aleatoriedad controlada se van transicionando los estados de los dispositivos como si fuera un escenario real.
Se comunica por medio de una HTTP POST request a la ruta `/stores/:id/sync_store`
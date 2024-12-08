## Setup de Dockerfile

1. Navegar a la carpeta donde se encuentra el Dockerfile.

2. Ejecutar el siguiente comando para construir la imagen de Docker.

```bash
docker build -t ml_env .
```

3. Ejecutar el siguiente comando para runear el contenedor de Docker. (Editar a gusto).

```bash
docker run --gpus all -p 8888:8888 -v "$(pwd):/workspace" ml_env
```

4. En la parte superior derecha de VSCode definir el entorno con el enlace obtenido desde el docker run.

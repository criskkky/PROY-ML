# Usa la imagen base de NVIDIA con soporte para CUDA y cuDNN
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu20.04

# Establece el directorio de trabajo
WORKDIR /workspace

# Actualiza los paquetes e instala dependencias necesarias
RUN apt-get update && apt-get install -y \
    python3-pip \
    wget \
    git \
    vim \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Instala las bibliotecas necesarias para Python
RUN pip3 install --upgrade pip

# Carga de paquetes iniciales (Editar según sea necesario).
RUN pip3 install \
    numpy \
    pandas \
    seaborn \
    matplotlib \
    scikit-learn \
    jupyter_http_over_ws

# Habilita la extensión jupyter_http_over_ws en JupyterLab
RUN jupyter server extension enable --py jupyter_http_over_ws

# Abre el puerto de Jupyter
EXPOSE 8888

# Configura el comando para ejecutar JupyterLab en el contenedor
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

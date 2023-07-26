def filtrar_archivo_log(archivo):
    palabras_clave = ["error", "fatal", "panic"]

    with open(archivo, 'r') as archivo_log:
        lineas_filtradas = []
        for linea in archivo_log:
            if any(palabra in linea.lower() for palabra in palabras_clave):
                lineas_filtradas.append(linea)

    return lineas_filtradas

if __name__ == "__main__":
    archivo_log = "postgresql.log"
    lineas_filtradas = filtrar_archivo_log(archivo_log)

    print("Líneas que contienen 'error', 'fatal' o 'panic':")
    for linea in lineas_filtradas:
        print(linea.strip())
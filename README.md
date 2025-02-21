# To Do App

Desarrollado por: Santiago Ríos Valero.

## Descripción del Proyecto

 

## Características

 

## Requisitos Previos

- Flutter SDK (Versión 3.22.2)
- Dart (Versión 3.4.3)
- GetCli (Versión 1.8.4)

## Configuración del Entorno

Asegúrate de tener Flutter, Dart y GetCLi instalados en tu sistema. Para verificar, ejecuta los siguientes comandos en tu terminal:

```bash
flutter doctor
dart --version
get --version
```

## Correr el proyecto

Correr los siguientes comandos en tu terminal:

```
flutter pub get
```

```
flutter run
```

## Utilización de GetCLi

Para más información sobre cómo utilizar GetCLi, visita la [documentación oficial de GetX](https://pub.dev/packages/get_cli).


## Uso de GetX

Este proyecto utiliza GetX para una gestión eficiente del estado, navegación simplificada entre pantallas, y la inyección de dependencias para una mejor escalabilidad y mantenimiento del código.

## Uso de i10n

Este proyecto cuenta con soporte para internacionalización de textos. Para agregar un nuevo idioma, sigue los siguientes pasos:
- Agregar en la carpeta i10n en los idiomas que se desean agregar.
- Correr el siguiente comando en la terminal:
```
flutter gen-l10n
``` 

## Estructura del Proyecto

- `/lib`: Contiene el código fuente de Dart para la aplicación.
  - `/models`: Modelos de datos para la aplicación.
  - `/modules`: Módulos de la aplicación, cada uno con su controlador, vista y binding.
  - `/services`: Carpeta donde se encuentran las funciones que consumen los endpoints.
  - `/utils`: Constantes y funciones generales para la aplicación.
  - `/widgets`: Widgets reutilizables en la aplicación.
- `/assets`: Recursos como imágenes, íconos y modelos en formato json.

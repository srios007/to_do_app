# To Do App

Desarrollado por: Santiago Ríos Valero.

## Descripción del Proyecto

 El To Do App es una aplicación de gestión de tareas desarrollada en Flutter. Esta aplicación permite a los usuarios crear, actualizar, eliminar y visualizar tareas. Además, cuenta con soporte para la internacionalización de textos y utiliza Firebase para la gestión de datos en tiempo real. La aplicación está diseñada para ser escalable y fácil de mantener, utilizando el paquete GetX para la gestión del estado, la navegación y la inyección de dependencias.

## Características

- Permite que cada usuario cree una cuenta y acceda a la aplicación.
- Cada usuario puede crear, actualizar, eliminar y visualizar tareas.
- Internacionalización: Soporte para inglés y español, facilitando la traducción de textos.
- Firebase Integration: Utiliza Firebase Firestore para almacenar y sincronizar datos en tiempo real.
- Autenticación: Inicio de sesión y registro de usuarios con Firebase Authentication.
- Firebase functions: Utiliza Firebase Functions para traducir las tareas de los usuarios cuando se crea una nueva.
- GetX: Gestión eficiente del estado, navegación simplificada y inyección de dependencias.
- Traducción Automática: Utiliza Google Cloud Translation API para traducir automáticamente las descripciones de las tareas al inglés cuando se crean.
- Actualización en tiempo real de las tareas gracias a los streams de Firestore.

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

- `/functions`: Contiene las funciones de Firebase para traducir las tareas de los usuarios.
- `/lib`: Contiene el código fuente de Dart para la aplicación.
  - `/models`: Modelos de datos para la aplicación.
  - `/modules`: Módulos de la aplicación, cada uno con su controlador, vista y binding.
  - `/routes`: Rutas de la aplicación.
  - `/services`: Carpeta donde se encuentran las funciones que consumen los endpoints.
  - `/utils`: Constantes y funciones generales para la aplicación.
  - `/widgets`: Widgets reutilizables en la aplicación.

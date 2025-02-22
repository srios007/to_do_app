import * as functions from "firebase-functions/v1";
import * as admin from "firebase-admin";
import {Translate} from "@google-cloud/translate/build/src/v2";

// Inicializar Firebase Admin
admin.initializeApp();

// Inicializar la API de Traducción de Google
const translate = new Translate();

// Detecta cuando se crea un documento en la colección tasks
export const translateTask = functions.firestore
  .document("tasks/{taskId}")
  .onCreate(async (snap) => {
    const task = snap.data();
    if (!task) {
      console.warn("No hay texto para traducir.");
      return null;
    }

    try {
      // Traduce el texto de español al inglés
      const [translationName] = await translate.translate(task.name, "en");
      const [translationDesc] = await translate.translate(
        task.description,
        "en",
      );

      // Guardar la traducción en Firestore en le campo translatedDescription
      await snap.ref.update({
        translatedDescription: translationDesc,
        translatedName: translationName,
      });

      console.log(`Nombre traducido: ${task.name} → ${translationName}`);
      console.log(
        `Descripción traducida: ${task.description} → ${translationDesc}`,
      );
      return null;
    } catch (error) {
      console.error("Error al traducir la tarea:", error);
      return null;
    }
  });

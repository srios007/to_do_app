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
  .onCreate(async (snap, context) => {
    const task = snap.data();
    if (!task || !task.description) {
      console.warn("No hay texto para traducir.");
      return null;
    }

    try {
      // Traduce el texto de español al inglés
      const [translation] = await translate.translate(task.description, "en");

      // Guardar la traducción en Firestore en le campo translatedText
      await snap.ref.update({translatedText: translation});

      console.log(`Texto traducido: ${task.description} → ${translation}`);
      return null;
    } catch (error) {
      console.error("Error al traducir el texto:", error);
      return null;
    }
  });

Proceso Sistema_Control_De_Datos_Medicos  
	
    Definir nombre, fecha_nacimiento Como Cadena       // Declara variables de texto para guardar el nombre y la fecha de nacimiento del paciente
    Definir edad, talla, peso Como Real                // Declara variables numéricas, pueden ser con decimales
    Definir presion_sistolica, presion_diastolica, glucosa, temperatura, imc Como Real  
    // Declara variables numéricas para los datos medicos
    Definir clasificacion_imc, resultado_general, detalles_alerta Como Cadena  
    // son variables de texto para guardar la clasificación del IMC, el resultado final y los mensajes de alerta
	
    Definir datos_normales Como Logico                 // Variable lógica (Verdadero/Falso) para indicar si todos los datos están en rango normal
    Definir continuar Como Cadena                      // Variable de texto para controlar si el usuario desea continuar o salir
	
    Repetir                                            // Inicia un ciclo repetitivo por si quiere registrar un nuevo paciente
        Limpiar Pantalla                               // Limpia la pantalla antes de mostrar el menú de registro
        Escribir "=== SISTEMA DE CONTROL DE DATOS MÉDICOS BÁSICOS ==="  
        // Muestra el título principal del sistema en pantalla
        
        // Registro de datos básicos del paciente
        Escribir "Ingrese el nombre completo del paciente:"     // Pide al usuario el nombre del paciente
        Leer nombre                                    // Captura y guarda el nombre ingresado
        Escribir "Ingrese la fecha de nacimiento (DD/MM/AAAA):"  // Pide la fecha de nacimiento del paciente
        Leer fecha_nacimiento                          // Captura y guarda la fecha de nacimiento
        Escribir "Ingrese la edad del paciente:"       // Pide la edad del paciente
        Leer edad                                      // Captura y guarda la edad ingresada
        Escribir "Ingrese la talla (en metros):"       // Pide la talla del paciente en metros
        Leer talla                                     // Captura y guarda la talla
        Escribir "Ingrese el peso (en kg):"            // Pide el peso del paciente en kilogramos
        Leer peso                                      // Captura y guarda el peso ingresado
        Escribir "Ingrese la presión sistólica (mmHg):" // Pide la presión arterial sistólica
        Leer presion_sistolica                         // Captura y guarda el valor de presión sistólica
        Escribir "Ingrese la presión diastólica (mmHg):" // Pide la presión arterial diastólica
        Leer presion_diastolica                        // Captura y guarda el valor de presión diastólica
        Escribir "Ingrese el nivel de glucosa (mg/dL):" // Pide el nivel de glucosa en sangre
        Leer glucosa                                   // Captura y guarda el valor de glucosa
        Escribir "Ingrese la temperatura corporal (°C):" // Pide la temperatura corporal en grados Celsius
        Leer temperatura                               // Captura y guarda la temperatura ingresada
		
        // Cálculo del IMC
        imc <- peso / (talla * talla)                  // Calcula el IMC con la fórmula peso dividido entre talla al cuadrado
		
        // Clasificación del IMC según el valor calculado
        Si imc < 18.5 Entonces                         // Si el IMC es menor a 18.5
            clasificacion_imc <- "Bajo peso"           // Se asigna "Bajo peso" a la clasificación del IMC
        Sino
            Si imc >= 18.5 Y imc < 25 Entonces         // Si el IMC está entre 18.5 y 24.9
                clasificacion_imc <- "Normal"          // Se asigna "Normal"
            Sino
                Si imc >= 25 Y imc < 30 Entonces       // Si el IMC está entre 25 y 29.9
                    clasificacion_imc <- "Sobrepeso"   // Se asigna "Sobrepeso"
                Sino
                    clasificacion_imc <- "Obesidad"    // Si es mayor o igual a 30, se asigna "Obesidad"
                FinSi
            FinSi
        FinSi
		
        // Evaluación de rangos normales de signos vitales
        datos_normales <- Verdadero                    // Se asume inicialmente que todos los datos están normales
        detalles_alerta <- ""                          // Se inicializa vacío el texto donde se guardarán alertas
		
        Si (presion_sistolica < 90 O presion_sistolica > 120) O (presion_diastolica < 60 O presion_diastolica > 80) Entonces  
            // Verifica si la presión arterial está fuera del rango normal (90-120/60-80)
            datos_normales <- Falso                    // Si está fuera de rango, cambia la variable a Falso
            detalles_alerta <- detalles_alerta + "Presión arterial fuera de rango (Normal: 90-120/60-80 mmHg)" + SaltoLinea  
            // Agrega un mensaje de alerta al texto de detalles
        FinSi
		
        Si (glucosa < 70 O glucosa > 100) Entonces     // Verifica si la glucosa está fuera de 70-100 mg/dL
            datos_normales <- Falso                    // Marca que hay datos fuera de rango
            detalles_alerta <- detalles_alerta + "Glucosa fuera de rango (Normal: 70-100 mg/dL)" + SaltoLinea
        FinSi
		
        Si (temperatura < 36.0 O temperatura > 37.5) Entonces  // Verifica si la temperatura está fuera de 36.0-37.5 °C
            datos_normales <- Falso                    // Marca que hay datos fuera de rango
            detalles_alerta <- detalles_alerta + "Temperatura fuera de rango (Normal: 36.0-37.5 °C)" + SaltoLinea
        FinSi
		
        Si (clasificacion_imc <> "Normal") Entonces    // Verifica si el IMC no es "Normal"
            datos_normales <- Falso                    // Marca que hay datos fuera de rango
            detalles_alerta <- detalles_alerta + "IMC fuera de rango (Normal: 18.5-24.9) - Estado: " + clasificacion_imc + SaltoLinea  
            // Agrega alerta específica del IMC
        FinSi
		
        // Mostrar resultados finales en pantalla
        Escribir "----------------------------------------"  // Línea separadora visual
        Escribir "Paciente: ", nombre                      // Muestra el nombre del paciente
        Escribir "Edad: ", edad, " años"                   // Muestra la edad ingresada
        Escribir "IMC: ", imc, " (", clasificacion_imc, ")" // Muestra el valor del IMC y su clasificación
        Escribir "Presión arterial: ", presion_sistolica, "/", presion_diastolica, " mmHg"  
        // Muestra la presión arterial completa
        Escribir "Glucosa: ", glucosa, " mg/dL"            // Muestra el valor de glucosa
        Escribir "Temperatura: ", temperatura, " °C"       // Muestra el valor de temperatura
        Escribir "----------------------------------------"  // Línea separadora visual
		
        Si datos_normales Entonces                        // Si todos los datos están dentro de rangos normales
            Escribir " PACIENTE SANO: Todos los datos están en rango normal."  // Mensaje de confirmación
        Sino                                               // Si hay datos fuera de rango
            Escribir "ALERTA: Uno o más datos están fuera de rango:"  
            Escribir detalles_alerta                      // Muestra todos los detalles de las alertas
        FinSi
		
        // Preguntar si desea registrar otro paciente
        Escribir ""                                       // Salto de línea en pantalla
        Escribir "¿Desea registrar otro paciente? (si/no):"  // Pregunta si desea continuar
        Leer continuar                                    // Captura la respuesta del usuario ("si" o "no")
		
    Hasta Que continuar = "no"                           // Repite el ciclo mientras la respuesta NO sea "no"
	
    Escribir "Sistema finalizado. Gracias por utilizar el servicio."  
    // Mensaje final cuando el usuario decide salir
FinProceso  // Fin del proceso


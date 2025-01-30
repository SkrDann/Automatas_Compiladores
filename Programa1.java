/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package programa1;
import java.util.Scanner;

public class Programa1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        // Iniciar el ciclo para pedir múltiples entradas
        while (true) {
            // Solicitar la entrada del usuario
            System.out.print("Introduce una cadena (o escribe 'salir' para finalizar): ");
            String input = scanner.nextLine();
            
            // Comprobar si el usuario quiere salir
            if (input.equalsIgnoreCase("salir")) {
                System.out.println("Programa finalizado.");
                break; // Salir del ciclo y finalizar el programa
            }
            
            // Llamar al método para clasificar la entrada
            String resultado = clasificarCadena(input);
            
            // Mostrar el resultado
            System.out.println("Salida: " + resultado);
        }
        
        scanner.close(); // Cerrar el scanner al finalizar el programa
    }

    // Método para clasificar la cadena
    public static String clasificarCadena(String cadena) {
        // Verificar si es un número entero
        if (cadena.matches("\\d+")) {
            return "Número entero";
        }
        // Verificar si es una palabra (solo contiene letras)
        else if (cadena.matches("[a-zA-Z]+")) {
            return "Palabra";
        }
        // Si no es ni número ni palabra, es compuesta
        else {
            return "Compuesta";
        }
    }
}

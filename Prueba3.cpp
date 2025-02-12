#include <iostream>
#include <fstream>
#include <sstream>
#include <cctype>

using namespace std;



bool palabra(const string str) {
    for (size_t i = 0; i < str.length(); i++){
        if (!isalpha(str[i])) return false;
    }
    return true;
}
bool entero(const string str) {
    for (size_t i = 0; i < str.length(); i++){

        if (!isdigit(str[i])) return false;
    }
    return true;
}

bool compuesta(const string str) {
    bool letra = false, numero = false;
    for (size_t i = 0; i < str.length(); i++){
        if (isalpha(str[i])) letra = true;
        if (isdigit(str[i])) numero = true;
    }
        return letra && numero;
}

int main() {
    string nombre_ar;
    cout << "Antes de comenzar, considere los siguientes puntos:"<<endl;
    cout<<endl;
    cout << " + El archivo debe estar guardado con un solo nombre (no espacios)"<<endl;
    cout << " + Al ingrearlo debes agregarle la terminacion '.txt' "<<endl;
    cout<<endl;
    cout << " Si esta fuera de la carpeta del ejecutable: "<<endl;
    cout<< " + Copiar la ruta de acceso y quitarle las comillas dobles "<<endl;
    cout<< " + Verificar que tenga la terminacion '.txt' "<<endl;
    cout<<endl;
    cout << "Ingrese el nombre del archivo de texto: ";
    cin >> nombre_ar;
    cin.ignore();

    ifstream entrada(nombre_ar);
    if (!entrada) {
        cerr << "Error al encontar archivo " << endl;
        return 1;
    }

    stringstream cargado;
    cargado << entrada.rdbuf();
    string contenido = cargado.str();

    int con_espa = contenido.length();
    int sin_espa = 0;
    int tlexemas = 0;
    int palabras = 0;
    int numeros = 0;
    int tcompuestas = 0;

    stringstream extraccion(contenido);
    string lexema;

    while (extraccion >> lexema) {
        tlexemas++;
        sin_espa = sin_espa + lexema.length();

        if (palabra(lexema)) palabras++;
        else if (entero(lexema)) numeros++;
        else if (compuesta(lexema)) tcompuestas++;
    }

    cout << "Total de caracteres (con espacios): " << con_espa << endl;
    cout << "Total de caracteres (sin espacios): " << sin_espa << endl;
    cout << "Total de lexemas: " << tlexemas << endl;
    cout << "Total de numeros: " << numeros << endl;
    cout << "Total de palabras: " << palabras << endl;
    cout << "Total de compuestas: " << tcompuestas << endl;

    return 0;
}

#!/usr/bin/perl
use strict;
use warnings;

# Importa funciones del archivo admin.pl
require "./admin.pl";

print "Bienvenido al panel admin\n";

while (1) {
    print "\nOpciones:\n";
    print "1. Insertar usuario\n";
    print "2. Actualizar email\n";
    print "3. Mostrar usuarios\n";
    print "4. Salir\n";
    print "Selecciona una opci�n: ";

    chomp(my $opcion = <STDIN>);

    if ($opcion == 1) {
        print "Usuario nuevo: ";
        chomp(my $usuario = <STDIN>);
        print "Email nuevo: ";
        chomp(my $email = <STDIN>);
        insertar_usuario($usuario, $email);
    }
    elsif ($opcion == 2) {
        print "Usuario a actualizar: ";
        chomp(my $usuario = <STDIN>);
        print "Nuevo email: ";
        chomp(my $email = <STDIN>);
        actualizar_email($usuario, $email);
    }
    elsif ($opcion == 3) {
        mostrar_usuarios();
    }
    elsif ($opcion == 4) {
        print "Saliendo...\n";
        exit;
    }
    else {
        print "Opci�n inv�lida, intenta otra vez.\n";
    }
}

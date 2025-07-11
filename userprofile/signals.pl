#!/usr/bin/perl
use strict;
use warnings;

my %conteo;

open(my $fh, '<', 'logins.log') or die "No se pudo abrir logins.log: $!";

while (my $linea = <$fh>) {
    if ($linea =~ /Usuario '(\w+)'/) {
        $conteo{$1}++;
    }
}

close($fh);

foreach my $usuario (sort keys %conteo) {
    print "$usuario se loge� $conteo{$usuario} veces\n";
}

#!/usr/bin/env perl

use strict;
use warnings;
use FindBin qw($Bin);

use Test::More;

use File::Slurp;
use Try::Tiny;
use JSON;

my $json_file = "../isil2opac_hbzid.json";
my $json_text = read_file("$Bin/../isil2opac_hbzid.json");
my $status    = undef;
my $perl_ref  = undef;

plan tests => 1;

$status = try { $perl_ref = decode_json($json_text); }
catch {
    diag $_;
    return "Error: " . $_;
};

unlike( $status, '/Error: /', "validate JSON file $json_file" );


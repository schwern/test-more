package Test::Builder::Formatter::TAP;

# This is a subclass for Test::Builder v1 specific changes to the TAP formatter.

use TB2::Mouse;

our $VERSION = '2.00_07';
$VERSION = eval $VERSION;    ## no critic (BuiltinFunctions::ProhibitStringyEval)

extends 'TB2::Formatter::TAP::v13';

# Test::Builder won't print if $^C is set.
sub write {
    return if $^C;

    my $self = shift;
    $self->SUPER::write(@_);
}

1;

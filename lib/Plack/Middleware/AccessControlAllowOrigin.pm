package Plack::Middleware::AccessControlAllowOrigin;
use strict;
use warnings;
our $VERSION = '0.01';
use parent 'Plack::Middleware';

use Plack::Util;
use Plack::Util::Accessor 'origin';

sub call {
    my $self = shift;

    my $res  = $self->app->(@_);
    $self->response_cb($res, sub {
        my $res = shift;
        Plack::Util::header_set($res->[1],
            'Access-Control-Allow-Origin' => $self->origin
        );
    });
}

1;
__END__

=head1 NAME

Plack::Middleware::AccessControlAllowOrigin - Add Access-Control-Allow-Origin header

=head1 SYNOPSIS

    builder {
        enable 'Plack::Middleware::AccessControlAllowOrigin', origin => '*';
        $app;
    };

=head1 DESCRIPTION

Plack::Middleware::AccessControlAllowOrigin adds C<Access-Control-Allow-Origin> header.

=head1 CONFIGURATION

=over 4

=item origin

Specify the value of C<Access-Control-Allow-Origin> header.

=back

=head1 AUTHOR

punytan E<lt>punytan@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

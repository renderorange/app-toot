package App::Toot;

use strict;
use warnings;

use App::Toot::Config;
use Mastodon::Client;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $opt   = shift;

    if ( !defined $opt->{'config'} ) {
        die 'option config is required';
    }

    my $self = {
        config => App::Toot::Config::load( $opt->{'config'} ),
    };

    $self->{'client'} = Mastodon::Client->new(
        instance        => $self->{'config'}{'instance'},
        name            => $self->{'config'}{'username'},
        client_id       => $self->{'config'}{'client_id'},
        client_secret   => $self->{'config'}{'client_secret'},
        access_token    => $self->{'config'}{'access_token'},
        coerce_entities => 1,
    );

    return bless $self, $class;
}

sub run {
    my $self   = shift;
    my $status = shift;

    if ( !defined $status ) {
        die 'status is required';
    }

    return $self->{'client'}->post_status( $status );
}

1;

__END__

=pod

=head1 NAME

App::Toot - post a status to Mastodon

=head1 SYNOPSIS

 use App::Toot;
 my $app = App::Toot->new( \%opt );
 my $ret = $app->run( $status );

 # the commandline tool
 toot [--config <name>] [--status <status to post>] [--help]

=head1 DESCRIPTION

C<App::Toot> is a program to post statues to Mastodon.

For the commandline tool, please see the documentation for L<toot>.

=head1 CONFIGURATION

To post to Mastodon, you need to provide the account's oauth in the file C<config.ini>.

An example is provided as part of this distribution.  The user running the C<toot> script, for example through cron, will need access to the configuration file.

To set up the configuration file, copy C<config.ini.example> into one of the following locations:

=over

=item C<$ENV{HOME}/.config/toot/config.ini>

=item C</etc/toot/config.ini>

=back

After creating the file, edit and update the values in the C<default> accordingly.

 [default]
 instance = mastodon.social
 username = youruser
 client_id = OKE98_kdno_NOTAREALCLIENTID
 client_secret = mkjklnv_NOTAREALCLIENTSECRET
 access_token = jo83_NOTAREALACCESSTOKEN

B<NOTE:> If the C<$ENV{HOME}/.config/toot/> directory exists, C<config.ini> will be loaded from there regardless of a config file in C</etc/toot/>.

=head2 Required keys

The following keys are required for each section:

=over

=item instance

The Mastodon server name the account belongs to.

=item username

The account name for the Mastodon server defined in C<instance>.

=item client_id

The C<client_id> as provided for the C<username> on the C<instance>.

=item client_secret

The C<client_secret> as provided for the C<username> on the C<instance>.

=item access_token

The C<access_token> as provided for the C<username> on the C<instance>.

=back

=head2 Additional accounts

Multiple accounts can be configured with different sections after the C<default> section.

 [default]
 instance = mastodon.social
 username = youruser
 client_id = OKE98_kdno_NOTAREALCLIENTID
 client_secret = mkjklnv_NOTAREALCLIENTSECRET
 access_token = jo83_NOTAREALACCESSTOKEN
 [development]
 instance = botsin.space
 username = youruserdeveluser
 client_id = Ijjkn_STILLNOTAREALCLIENTID
 client_secret = u7hhd_STILLNOTAREALCLIENTSECRET
 access_token = D873_SKILLNOTAREALACCESSTOKEN

The section name, C<development> in the example above, can be named anything you'd like as long as it's unique.

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2023 Blaine Motsinger under the MIT license.

=head1 AUTHOR

Blaine Motsinger C<blaine@renderorange.com>

=cut

# NAME

App::Toot - post a status to Mastodon

# SYNOPSIS

    use App::Toot;
    my $app = App::Toot->new( \%opt );
    my $ret = $app->run( $status );

    # the commandline tool
    toot [--config <name>] [--status <status to post>] [--help]

# DESCRIPTION

`App::Toot` is a program to post statues to Mastodon.

For the commandline tool, please see the documentation for [toot](https://metacpan.org/pod/toot).

# CONFIGURATION

To post to Mastodon, you need to provide the account's oauth in the file `config.ini`.

An example is provided as part of this distribution.  The user running the `toot` script, for example through cron, will need access to the configuration file.

To set up the configuration file, copy `config.ini.example` into one of the following locations:

- `$ENV{HOME}/.config/toot/config.ini`
- `/etc/toot/config.ini`

After creating the file, edit and update the values in the `default` accordingly.

    [default]
    instance = mastodon.social
    username = youruser
    client_id = OKE98_kdno_NOTAREALCLIENTID
    client_secret = mkjklnv_NOTAREALCLIENTSECRET
    access_token = jo83_NOTAREALACCESSTOKEN

**NOTE:** If the `$ENV{HOME}/.config/toot/` directory exists, `config.ini` will be loaded from there regardless of a config file in `/etc/toot/`.

## Required keys

The following keys are required for each section:

- instance

    The Mastodon server name the account belongs to.

- username

    The account name for the Mastodon server defined in `instance`.

- client\_id

    The `client_id` as provided for the `username` on the `instance`.

- client\_secret

    The `client_secret` as provided for the `username` on the `instance`.

- access\_token

    The `access_token` as provided for the `username` on the `instance`.

## Additional accounts

Multiple accounts can be configured with different sections after the `default` section.

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

The section name, `development` in the example above, can be named anything you'd like as long as it's unique.

# COPYRIGHT AND LICENSE

Copyright (c) 2023 Blaine Motsinger under the MIT license.

# AUTHOR

Blaine Motsinger `blaine@renderorange.com`

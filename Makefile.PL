# Load the Module::Install bundled in ./inc/
use inc::Module::Install;

# Define metadata
name     'IO-Socket-Telnet';
all_from 'lib/IO/Socket/Telnet.pm';
githubmeta;

requires 'Sub::Uplevel'    => '0.19';
requires 'Sub::Exporter'   => '0.961';
requires 'Test::Exception' => '0.27';

WriteAll;


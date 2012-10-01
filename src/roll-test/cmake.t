#!/usr/bin/perl -w
# cmake roll installation test.  Usage:
# cmake.t [nodetype]
#   where nodetype is one of "Compute", "Dbnode", "Frontend" or "Login"
#   if not specified, the test assumes either Compute or Frontend

use Test::More qw(no_plan);

my $appliance = $#ARGV >= 0 ? $ARGV[0] :
                -d '/export/rocks/install' ? 'Frontend' : 'Compute';
my $installedOnAppliancesPattern = '.';
my $isInstalled = -d '/opt/cmake';
my $output;

my $TESTFILE = 'tmpcmake';
`mkdir $TESTFILE.dir`;

open(OUT, ">$TESTFILE.dir/hello.c");
print OUT <<END;
#include <stdio.h>
int main(int argc, char **argv) {
  printf("Hello world\\n");
}
END
close(OUT);

open(OUT, ">$TESTFILE.dir/CMakeLists.txt");
print OUT <<END;
PROJECT( hello C )
ADD_EXECUTABLE(hello.exe hello.c)
END
close(OUT);

open(OUT, ">$TESTFILE.sh");
print OUT <<END;
#!/bin/bash
if test -f /etc/profile.d/modules.sh; then
  . /etc/profile.d/modules.sh
  module load cmake
fi
cd $TESTFILE.dir
cmake .
make hello.exe
./hello.exe
END
close(OUT);

# cmake-common.xml
if($appliance =~ /$installedOnAppliancesPattern/) {
  ok($isInstalled, 'cmake installed');
} else {
  ok(! $isInstalled, 'cmake not installed');
}
SKIP: {

  skip 'cmake not installed', 4 if ! $isInstalled;
  $output = `/bin/bash $TESTFILE.sh 2>&1`;
  like($output, qr/world/, 'cmake-generated build');
  `/bin/ls /opt/modulefiles/compilers/cmake/[0-9]* 2>&1`;
  ok($? == 0, 'cmake module installed');
  `/bin/ls /opt/modulefiles/compilers/cmake/.version.[0-9]* 2>&1`;
  ok($? == 0, 'cmake version module installed');
  ok(-l '/opt/modulefiles/compilers/cmake/.version',
     'cmake version module link created');

}

`rm -fr $TESTFILE*`;

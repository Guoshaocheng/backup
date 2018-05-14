#-----------------------------------------------
#
#      Filename : tb_gen.pl
#
#        Author : Guoshaocheng - Ougsch@gmail.com
#   Description : ---
#        Create : 2018-01-24 19:29:33
# Last Modified : 2018-01-24 21:33:20
#-----------------------------------------------

use strict;

my $tab      = "    ";
my $cycle    = 10;
my $rst_time = 12;
my $ori_file = $ARGV[0];

die "Usage : perl tb_gen.pl ori_veri.v\n" if ($ori_file eq "");

open (inF, $ori_file) or die ("Original file open failed\n");
my @data = <inF>;
close (inF);

# gen tb file name
(my $tb_file = $ori_file) =~ s/(.*)\x2e.*/$1\_tb\.v/;
# gen tb module name
(my $tb_mod  = $ori_file) =~ s/(.*)\x2e.*/$1\_tb/;

# printf "%s\n"x@data,@data;
my %inPorts;
my %outPorts;
my @allPorts;
my $mod_name;

foreach (@data) {
    if (m!^\s*(input|inout)\s+(?<digWdh>\[.*\])?\s*(?<inP>\w+)\s*[,|;]?!) {
        $inPorts{$+{inP}} = $+{digWdh};
        push @allPorts, $+{inP};
    }
    # elsif (m!^\s*(output)\s+(?<digWdh>\[.*\])?\s*(?<outP>\w+)\s*[,|;]?!) {
    elsif (m!^\s*(output)\s+(reg?)\s*(?<digWdh>\[.*\])?\s*(?<outP>\w+)\s*[,|;]?!) {
        $outPorts{$+{outP}} = $+{digWdh};
        push @allPorts, $+{outP};
    }
    # get original module name
    elsif (m!\s*module\s+(?<modName>\w+)\s*(\()?!) {
        $mod_name = $+{modName};
    }
    # else {
    # print "Nothing matched \n";
    # }
}

# get clk signal from input signals 
my $clk_signal;
my @inputs = sort keys %inPorts;
foreach (@inputs) {
    $clk_signal = $_ if m#clk|clock#;
}

# get rst signal from input signals
my $rst_signal;
foreach (@inputs) {
    $rst_signal = $_ if m#rst|reset#;
}

# Make Date int MM/DD/YYYY
my $year      = 0;
my $month     = 0;
my $day       = 0;
($day, $month, $year) = (localtime)[3,4,5];

open (my $TB, ">", $tb_file) or die "Open tb file failed!\n";

# gen tb file head
printf ($TB "/******************************************************\n");
printf ($TB " Module Name : %-10s \n",$tb_file);
printf ($TB " Created on  : %02d/%02d/%04d \n",$month+1, $day, $year+1900);
printf ($TB " Gen by      : tb_gen.pl \n");
printf ($TB "*****************************************************/\n");
printf ($TB "\n");

# gen tb file module
printf ($TB "`timescale${tab}1ns/1ps\n\n");
printf ($TB "module $tb_mod ();\n\n");
#printf ($TB "$in_reg\n");
#printf ($TB "$out_wire\n");

#my $in_reg ;
#foreach my $in (@inPorts) {
#    s/(.*)/reg $tab$tab$1;\n/;
#    $in_reg .= "reg $tab$tab$in;\n";
#}
foreach my $key (sort keys %inPorts) {
    printf ($TB "reg  $tab%-10s %-15s;\n", ${inPorts{$key}}, $key);
    #print "$key ==> ${inPorts{$key}}\n";
}

#my $out_wire ;
foreach my $key (sort keys %outPorts) {
    printf ($TB "wire $tab%-10s %-15s;\n", ${outPorts{$key}}, $key);
    #print "$key ==> ${inPorts{$key}}\n";
}
#foreach my $out (@outPorts) {
#    s/(.*)/wire$tab$tab$1;\n/;
#    $out_wire .= "wire$tab$tab$out;\n" ;
#}


# gen inst of original module
my $inst_mod = join "_", "u", $mod_name;
printf ($TB "\n");
printf ($TB "$mod_name $inst_mod (\n");
foreach (@allPorts) {
    if ($_ eq $allPorts[-1]) {
        printf ($TB "$tab\.%-10s\(%-10s\)\n",$_,$_);
    }
    else {
        printf ($TB "$tab\.%-10s\(%-10s\),\n",$_,$_);
    }
}
printf ($TB ");\n\n");

#gen initial testbench
printf ($TB "initial begin\n");
printf ($TB "$tab$clk_signal = 1'b0;\n");
printf ($TB "$tab$rst_signal = 1'b0;\n");
printf ($TB "$tab#$rst_time ;\n");
printf ($TB "$tab$rst_signal = 1'b1;\n");
printf ($TB "end\n\n");
printf ($TB "always #$cycle $clk_signal =~ $clk_signal;\n\n");

printf ($TB "endmodule\n");


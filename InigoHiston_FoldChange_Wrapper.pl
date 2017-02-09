#!/usr/bin/perl -w

my $homer = "~/GitHub/homer/bin/";
my @Histones = ("H3K27ac", "H3K4m1", "H3K4m3", "H3K9m3", "H3K9me3", "H3K27m3");
my @Peaks = ("ATAC", "CTCF", "KAP", "OCT4", "REST");
foreach (@Histones) {
  print $_;
system(`$homer/mergePeaks $_"_h33.CvsH.hg19/regions.txt" $_"_h40.CvsH.hg19/regions.txt" $_"_c18.CvsH.hg19/regions.txt" $_"_c29.CvsH.hg19/regions.txt" > $_"_All.mergePeaks.txt"`);
system(`$homer/annotatePeaks.pl $_"_All.mergePeaks.txt" hg19 -d $_"_h33.CvsH.hg19"/ $_"_h40.CvsH.hg19"/ $_"_c18.CvsH.hg19"/ $_"_c29.CvsH.hg19"/ -raw > $_"_All.mergePeaks.annotatePeaks.txt"`);
system(`$homer/getDiffExpression.pl $_"_All.mergePeaks.annotatePeaks.txt" Human Human Chimp Chimp -batch 1 2 1 2 -peaks > $_"_All.mergePeaks.annotatePeaks.getDiffExpression.txt"`);
};

foreach (@Peaks) {
  print $_;
system(`$homer/mergePeaks $_"_h33.CvsH.hg19/peaks.txt" $_"_h40.CvsH.hg19/peaks.txt" $_"_c18.CvsH.hg19/peaks.txt" $_"_c29.CvsH.hg19/peaks.txt" > $_"_All.mergePeaks.txt"`);
system(`$homer/annotatePeaks.pl $_"_All.mergePeaks.txt" hg19 -d $_"_h33.CvsH.hg19"/ $_"_h40.CvsH.hg19"/ $_"_c18.CvsH.hg19"/ $_"_c29.CvsH.hg19"/ -raw > $_"_All.mergePeaks.annotatePeaks.txt"`);
system(`$homer/getDiffExpression.pl $_"_All.mergePeaks.annotatePeaks.txt" Human Human Chimp Chimp -batch 1 2 1 2 -peaks > $_"_All.mergePeaks.annotatePeaks.getDiffExpression.txt"`);
};

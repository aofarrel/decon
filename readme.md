# decon

decon (pronounced like "deacon", rhymes with weaken) is a WDL workflow for decontaminating and concatenating paired Illumina FASTQs. It is designed for *Mycobacterium tuberculosis complex*, but you could hack this for other pathogens if you'd like. 

If you would like to do more than just decontaminate your FASTQs, you might be better served by [myco](https://github.com/aofarrel/myco), which is designed for a comprehensive fastq-to-vcf-to-phylogenetic-tree experience. myco performs pretty much the exact same decontamination process as decon; decon's *raison d'être* is for those who only care about decontaminating their fastqs.

decon imports almost all of its code from [clockwork-wdl](https://github.com/aofarrel/clockwork-wdl), which itself is based on [Iqbal Lab's clockwork suite](https://github.com/iqbal-lab-org/clockwork).

## running decon
If using [miniwdl](https://github.com/chanzuckerberg/miniwdl), please make sure to use the `--copy-input-files` flag.

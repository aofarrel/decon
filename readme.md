# decon

Decon (pronounced like "deacon", rhymes with weaken) is a WDL workflow for decontaminating and concatenating paired Illumina FASTQs. It is designed for *Mycobacterium tuberculosis complex* and specifically the [myco](https://github.com/aofarrel/myco) pipeline, but you could hack this for other pathogens if you'd like.

Decon imports almost all of its code from [clockwork-wdl](https://github.com/aofarrel/clockwork-wdl). If you are having issues that you think are related to the WDL, please open issues in this repo. If you are having issues that you think are related to clockwork itself, please see clockwork's repo.

## running decon
First of all: If you would like to do more than just decontaminate your FASTQs, you might be better served by [myco](https://github.com/aofarrel/myco). myco includes decon in its toolset, and is designed for a simple fastq-to-vcf-to-tree experience. myco additionally to supports pulling samples directly from SRA.

If using [miniwdl](https://github.com/chanzuckerberg/miniwdl), please make sure to use the `--copy-input-files` flag.


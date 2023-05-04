version 1.0
import "https://raw.githubusercontent.com/aofarrel/clockwork-wdl/2.8.0/workflows/refprep-TB.wdl" as rp
import "https://raw.githubusercontent.com/aofarrel/clockwork-wdl/2.8.0/tasks/combined_decontamination.wdl" as cd

workflow Decon_And_Combine_One_Sample {
    input {
        Array[File] forward_reads
        Array[File] reverse_reads

        Boolean     crash_on_timeout = false
		Int         subsample_cutoff = -1
		Int         timeout_map_reads = 0
		Int         timeout_decontam  = 0

        # Note: When running on SRA data, using default compute (including SSDs), we have found that setting
        # the timeouts to 120 is a very good tradeoff. If you do not set these, most samples will complete in
        # under 120 minutes, but some will take hours upon hours and ultimately give you data that is probably
        # not all that useful.
    }

    Array[Array[File]] all_fastqs = [forward_reads, reverse_reads]
    Array[File] all_fastqs_flatnd = flatten(all_fastqs)

    call rp.ClockworkRefPrepTB

    call cd.combined_decontamination_single as decontaminate {
        input:
            tarball_ref_fasta_and_index = ClockworkRefPrepTB.tar_indexd_dcontm_ref,
            ref_fasta_filename = "ref.fa",
            reads_files = all_fastqs_flatnd,
            crash_on_timeout = crash_on_timeout,
            subsample_cutoff = subsample_cutoff,
            timeout_map_reads = timeout_map_reads,
            timeout_decontam = timeout_decontam,
            unsorted_sam = true
    }

    output {
        File? decontaminated_fastq_1 = decontaminate.decontaminated_fastq_1
        File? decontaminated_fastq_2 = decontaminate.decontaminated_fastq_2
    }

    meta {
        author: "Ash O'Farrell"
    }
}
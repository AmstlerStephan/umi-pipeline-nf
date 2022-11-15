process REFORMAT_FILTER_CLUSTER {

    publishDir "${params.output}/${sample}/stats/${type}", pattern: "${vsearch_cluster_stats}", mode: 'copy'
    publishDir "${params.output}/${sample}/clustering/${type}", pattern: "${smolecule_clusters_fasta}", mode: 'copy'
  
  input:
    tuple val(sample), val(target), path(consensus_fasta)
    val( type )
    path vsearch_dir
    path umi_parse_clusters_python

  output:
    tuple val( "${sample}" ), val( "${target}" ), path( "${smolecule_clusters_fasta}"), emit: smolecule_clusters_fasta
    path( "${vsearch_cluster_stats}" )

  script:
    def balance_strands = params.balance_strands ? "--balance_strands" : ""
    def write_report = params.write_reports ? "--tsv" : ""

    """
        python ${umi_parse_clusters_python} $balance_strands \
        --filter_strategy ${params.filter_strategy_clusters} --min_reads_per_clusters ${params.min_reads_per_cluster} --max_reads_per_clusters ${params.max_reads_per_cluster} \
        $write_report -o . --vsearch_consensus ${consensus_fasta} --vsearch_folder ${vsearch_dir}
    """
}

//clusters_fa folder is used as output folder but not used downstream and stays empty -> omitted here
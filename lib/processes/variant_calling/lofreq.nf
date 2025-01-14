process LOFREQ {
    publishDir "${params.output}/${params.variant_caller}/${sample}/", mode: 'copy'
  
    input:
      tuple val( sample ), val( target ), path( bam ), path( bai )
      val( type )
      path reference
      path reference_fai
    
    output:
      path "${type}.vcf", emit: variants
    
    script:
    """
      lofreq call \
      --ref ${reference} \
      --out ${type}.vcf \
      --call-indels \
      ${bam}
    """
}
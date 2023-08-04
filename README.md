[![Nextflow](https://img.shields.io/badge/nextflow-20.07.1-brightgreen.svg)](https://www.nextflow.io/)
[![install with bioconda](https://img.shields.io/badge/install%20with-bioconda-brightgreen.svg)](http://bioconda.github.io/)

umi-pipeline-nf
======================

**umi-pipeline-nf** is based on the [snakemake ONT UMI analysis pipeline](https://github.com/nanoporetech/pipeline-umi-amplicon). We transferred the pipeline to [Nextflow](https://www.nextflow.io).  
* It comes with docker containers making installation simple, portable and results highly reproducible.
* The pipeline is optimized for parallelization.
* Read filtering strategy per UMI cluster was adapted to preserve the highest quality reads.
* Three commonly used variant callers ([freebayes](https://github.com/freebayes/freebayes), [lofreq](http://csb5.github.io/lofreq/) or [mutserve](https://mitoverse.readthedocs.io/mutserve/mutserve/)) are supported by the pipeline.
* The raw reads can be optionally subsampled.
* The raw reads can be filtered by read length and quality.

## Overview
`umi-pipeline-nf` creates highly accurate single-molecule consensus sequences based on amplicon data tagged by unique molecular identifiers (UMIs). The pipeline can be run for the whole fastq_pass folder of your nanopore run and, per default, outputs the aligned consensus sequences of each UMI cluster in bam file. 

> See the [output documentation](docs/output.md) for more details of the results.
> See the [usage documentation](docs/usage.md) for all of the available options when running the pipeline.

## Quick Start

1. Install [`nextflow`](https://www.nextflow.io/)

2. Download the pipeline and test it on a minimal dataset with a single command

```bash
nextflow run AmstlerStephan/umi-pipeline-nf -profile test,docker
```

3. Start running your own analysis!
3.1 Download and adapt the config/custom.config with paths to your data (relative and absolute paths possible)

```bash
nextflow run AmstlerStephan/umi-pipeline-nf -r main -c <custom.config> -profile docker 
```


### Credits

These scripts were originally written for use by [GENEPI](https://genepi.i-med.ac.at/), by ([@StephanAmstler](https://github.com/AmstlerStephan)).  
Nextflow template pipeline: [EcSeq](https://github.com/ecSeq).  
Original Snakemake-based pipeline: [nanoporetech](https://github.com/nanoporetech/pipeline-umi-amplicon).

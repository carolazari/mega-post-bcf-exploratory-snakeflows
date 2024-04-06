
rule run_evaladmix:
	input:
		beagle="results/bcf_{bcf_id}/filt_{bcfilt}/{sampsub}/thin_{thin_int}_{thin_start}/beagle-gl/beagle-gl.gz",
		fopt="results/bcf_{bcf_id}/filt_{bcfilt}/{sampsub}/thin_{thin_int}_{thin_start}/ngsadmix/maf_{min_maf}/K_{K}_rep_{rep}/output.fopt.gz",
		qopt="results/bcf_{bcf_id}/filt_{bcfilt}/{sampsub}/thin_{thin_int}_{thin_start}/ngsadmix/maf_{min_maf}/K_{K}_rep_{rep}/output.qopt",
		bin="results/bin/evalAdmix/evalAdmix"
	output:
		"results/bcf_{bcf_id}/filt_{bcfilt}/{sampsub}/thin_{thin_int}_{thin_start}/evaladmix/maf_{min_maf}/K_{K}_rep_{rep}/output.corres.txt"
	threads: 10
	resources:
		mem_mb=19200
	log:
		"results/logs/run_evaladmix/bcf_{bcf_id}/filt_{bcfilt}/{sampsub}/thin_{thin_int}_{thin_start}/maf_{min_maf}/K_{K}_rep_{rep}/log.txt"
	shell:
		" {input.bin} -beagle {input.beagle} -fname {input.fopt} -qname {input.qopt} -P {threads} -o {output} > {log} 2>&1 "


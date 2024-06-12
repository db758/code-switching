#!/bin/bash
#SBATCH -J query_kenlm                      # Job name
#SBATCH -o query_kenlm_%A_%a.out                # Name of stdout output log file (%j expands to jobID)
#SBATCH -e query_kenlm%A_%a.err                # Name of stderr output log file (%j expands to jobID)
#SBATCH -N 1                            # Total number of nodes requested
#SBATCH -n 8                            # Total number of cores requested
#SBATCH --mem=50000                     # Total amount of (real) memory requested (per node)
#SBATCH -t 10:00:00                  # Time limit (hh:mm:ss)
#SBATCH --partition=default_partition          # Request partition for resource allocation


#/home/db758/kenlm/build/bin/query /home/db758/kenlm/build/new_zh_ngram.arpa < /home/db758/kenlm/build/cs_full_sentence_zh.txt > /home/db758/kenlm/build/cs_full_sentence_zh_output.txt

#/home/db758/kenlm/build/bin/query /home/db758/kenlm/build/new_zh_ngram.arpa < /home/db758/kenlm/build/non_cs_full_sentence_zh.txt > /home/db758/kenlm/build/non_cs_full_sentence_zh_output.txt

#/home/db758/kenlm/build/bin/query /home/db758/kenlm/build/new_zh_ngram.arpa < /home/db758/kenlm/build/sample_combined_zhwiki_tokenized.txt > /home/db758/kenlm/build/new_sample_combined_zhwiki_output.txt

#/home/db758/kenlm/build/bin/query /home/db758/kenlm/build/new_zh_ngram.arpa < /home/db758/kenlm/build/tokenized_wiki_47.txt > /home/db758/kenlm/build/tokenized_wiki_47_output.txt

#/home/db758/kenlm/build/bin/query /home/db758/kenlm/build/retrained_zh_ngram_2024.arpa < /home/db758/kenlm/build/non_cs_transcripts.txt > /home/db758/kenlm/build/non_cs_transcripts_output.txt

#/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_zh_ngram.arpa < /home/db758/kenlm/build/non_cs_transcripts.txt > /home/db758/kenlm/build/non_cs_transcripts_output_og.txt

#/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_zh_ngram.arpa < /home/db758/kenlm/build/zh_translated_transcripts.txt > /home/db758/kenlm/build/zh_translated_transcripts_output.txt

#/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_zh_ngram.arpa < /home/db758/kenlm/build/zh_translated_wbw_transcripts.txt > /home/db758/kenlm/build/zh_translated_wbw_transcripts_output.txt

#/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_eng_ngram.arpa < /home/db758/kenlm/build/en_translated_transcripts.txt > /home/db758/kenlm/build/en_translated_transcripts_output.txt

#/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_eng_ngram.arpa < /home/db758/kenlm/build/en_translated_wbw_transcripts.txt > /home/db758/kenlm/build/en_translated_wbw_transcripts_output.txt

#/home/db758/kenlm/build/bin/lmplz -o 5 < /home/db758/kenlm/build/common_voice_en_transcripts.txt > /share/compling/psycholing/models/code-switching/common_voice_en.arpa

#/home/db758/kenlm/build/bin/lmplz -o 5 < /home/db758/kenlm/build/common_voice_zh_tokenized_transcripts.txt > /share/compling/psycholing/models/code-switching/common_voice_zh.arpa

/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_zh_ngram.arpa < /home/db758/kenlm/build/calvillo_cs_data_automatic_google_translations_to_zh.txt > /home/db758/kenlm/build/calvillo_cs_data_automatic_google_translations_to_zh_output.txt

/home/db758/kenlm/build/bin/query /share/compling/psycholing/models/code-switching/retrained_zh_ngram.arpa < /home/db758/kenlm/build/calvillo_cs_data_automatic_fanyi_translations_to_zh.txt > /home/db758/kenlm/build/calvillo_cs_data_automatic_fanyi_translations_to_zh_output.txt
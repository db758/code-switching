# code-switching 
21Apr2022: TODO: cross check local code-switching folder

All dependency ngrams are of the form: (dependency relation label, word, head).

redone_ prefix: I had to redo my code-switched analysis at one point because I had not used the full code-switched dataset to begin with. 

All word_freq_eng values are calculated by using phrasefinder.io on the American English corpus and total_counts for American English from the Google Books corpus.
All word_freq values have had negative natural log (ln) applied to them in redoing_cs_data.csv (most up to date code-switched dataset) and non_cs_sentences_full.csv (most up to date non-code-switched dataset). 

In the word_freq_eng column in non_cs_sentences_full.csv, frquencies were calculated using only the first word wherever the column contains a phrase of more than one word. This was for consistency with word_freq_eng in redoing_cs_data.csv. 

  \
Useful links:
  
Getting frequency raw counts: https://phrasefinder.io/ \
Getting frequency total counts: http://storage.googleapis.com/books/ngrams/books/datasetsv2.html 

Part-of-speech tagsets for English and Chinese: https://github.com/explosion/spaCy/blob/master/spacy/glossary.py 

import stanza
import sys
stanza.download('en')

nlp = stanza.Pipeline(lang='en', processors='tokenize,pos,lemma,depparse')

import pandas as pd
df = pd.DataFrame()

column_names = ['sentence id', 'word id', 'word', 'head id', 'head', 'deprel']
df = pd.DataFrame(columns = column_names)

from nltk import tokenize

file = open(sys.argv[1], "r")

p = file.read()
tokenized = tokenize.sent_tokenize(p)

for i in range(len(tokenized)): #sentence in tokenized:
    sentence = tokenized[i]
    doc = nlp(str(sentence))
    for sent in doc.sentences:
        for word in sent.words:
            row = {'sentence id' : i, 'word id': word.id, 'word': word.text, 'head id': word.head, 'head': sent.words[word.head-1].text if word.head > 0 else "root", 'deprel': word.deprel}
            #df = df.append(row, ignore_index = True) #TODO: append to list instead --> df --> csv
            print(','.join([str(row[key]) for key in row.keys()]))
#df.to_csv("retrained_dependency_parsed_eng.csv", index = False)
file.close()
# Trains a generative model on personachat using the 'self' profile
# Run from ParlAI directory

python ../../../ParlAI/examples/train_model.py -m "projects.personachat.persona_seq2seq:PersonachatSeqseqAgentSplit"  -t personachat:self -bs 128 -rc True --validation-every-n-secs 300 -vp 100 -lr 0.001 -mf /tmp/profilememory_pc -enc lstm -hs 1024 -nl 1 --dropout 0.2 --attention general --personachat_attnsentlevel --personachat_sharelt --personachat_reweight 'use' --personachat_learnreweight -tr 100

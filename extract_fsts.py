import pandas as pd
import argparse

argparser = argparse.ArgumentParser()
argparser.add_argument("--pop")
argparser.add_argument("--fst_file")
args = argparser.parse_args()


fsts = pd.read_csv(args.fst_file, sep="\t").dropna()
mean_fst = fsts.iloc[:,2].mean()

print(args.pop, mean_fst)

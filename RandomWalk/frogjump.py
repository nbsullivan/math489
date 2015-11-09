'__author__' == 'Nick Sullivan'

import random
import pandas as pd
from collections import Counter
from pprint import pprint as pp
class frog(object):
# frog class
# note it is hard coded for using the 1/3, 1/3, 1/3 jump chances
# also frogs are set to pad number 0
	def __init__(self, pad = 0, lilypads = 1):
		# frogs start on padnumber 0 unless specified set by pad
		# lilypads number will be set on the frog level by lilypads
		self.padnumber = pad
		self.lilypad = lilypads


	def getpos(self):
		#returns current frog position
		return self.padnumber

	def jump(self):
		#grab a random integer and make approiate pad
		jumpcode = random.randint(1,9)
		if jumpcode <= 3:
			self.padnumber -= 1
		elif jumpcode >= 7:
			self.padnumber += 1
		return self.padnumber % self.lilypad


class frogsim(object):

	def __init__(self, frognumber, pads, initpos = 0):
		self.frognumbers = [frog(lilypads = pads, pad = initpos) for i in range(frognumber)]
		self.pads = pads
	def jump(self, jumps = 1):

		froglist = []
		longfrog = []
		# grabbing intital position
		initpos = []
		for froggy in self.frognumbers:
			initpos.append(froggy.getpos())

		#construct inital row for summary table
		frogdict = dict((x,initpos.count(x)) for x in set(initpos))
		froglist.append(frogdict)
		
		# construct inital row for long form table
		for key in frogdict:

			frogrow = {"jumpnumber" : 0}
			frogrow["padNumber"] = key
			frogrow["numberOfFrogs"] = frogdict[key]
			longfrog.append(frogrow)

		for num in range(jumps):

			positions = []
			# construct rows for the summary table
			for froggy in self.frognumbers:
				positions.append(froggy.jump())
			
			frogdict = dict((x,positions.count(x)) for x in set(positions))
			froglist.append(frogdict)
			
			# construct rows for the long form table
			for key in frogdict:
				frogrow = {}
				frogrow["jumpnumber"] = num+1	
				frogrow["padNumber"] = key
				frogrow["numberOfFrogs"] = frogdict[key]
				longfrog.append(frogrow)



		pos_df = pd.DataFrame(froglist)
		pos_df = pos_df.fillna(value = 0)
		long_df = pd.DataFrame(longfrog)

		return pos_df, long_df
if __name__ == '__main__':

	# question 2 100 frogs, 10 jumps  lilypad number 5
	q2 = frogsim(frognumber = 100, pads = 5, initpos = 1)
	q2_df, q2_long_df = q2.jump(10)
	q2_df.to_csv("question2.csv")
	q2_long_df.to_csv("question2long.csv")
	# question 3 100 frogs, 20 jumps, lilypad number 10

	q3 = frogsim(frognumber = 100, pads = 10, initpos = 1)
	q3_df, q3_long_df= q3.jump(20)
	q3_df.to_csv("question3.csv")
	q3_long_df.to_csv("question3long.csv")

	# extra sim for 10000 frogs on 10 pads with 100 jumps
	ex = frogsim(frognumber = 10000, pads = 10, initpos = 1)
	ex_df, ex_long_df = ex.jump(100)
	ex_df.to_csv("bigsim.csv")
	ex_long_df.to_csv("bigsimlong.csv")


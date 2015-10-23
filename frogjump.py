'__author__' == 'Nick Sullivan'

import random
import pandas as pd
from collections import Counter

class frog(object):
# frog class
# note it is hard coded for using the 1/3, 1/3, 1/3 jump chances
# also frogs are set to pad number 0
	def __init__(self, pad = 0, lilypads = 0):
		# frogs start on padnumber 0 unless specified
		# lilypads will be set on the frog level
		pass
		self.padnumber = pad
		self.lilypad = lilypads


	def jump(self):
		#grab a random integer and make approiate pad
		jumpcode = random.randint(1,9)
		if jumpcode <= 3:
			self.padnumber -= 1
		elif jumpcode >= 7:
			self.padnumber += 1

		return self.padnumber % self.lilypad

class frogsim(object):

	def __init__(self, frognumber, pads):
		self.frognumbers = [frog(lilypads = pads) for i in range(frognumber)]
		self.pads = pads
	def jump(self, jumps = 1):
		froglist = []
		for num in range(jumps):
			positions = []
			for froggy in self.frognumbers:
				positions.append(froggy.jump())
			froglist.append(dict((x,positions.count(x)) for x in set(positions)))

		pos_df = pd.DataFrame(froglist)
		pos_df = pos_df.fillna(value = 0)
		return pos_df
if __name__ == '__main__':

	mysim = frogsim(100,5)
	print mysim.jump(50)


from enum import Enum
import pydot

class Token(Enum):
	LPAREN = '('
	RPAREN = ')'
	END = '$'
	PLUS = '+'
	MINUS = '-'
	CROSS = '*'
	NUM = '0'


case = {}
for token in Token:
	case[token.value] = token


class lexicalAnalyzer():
	curChar = ''
	def __init__(self, exp):
		self.exp = exp + '$'
		self.cur = -1
		self.nextToken()

	def passBlanks(self):
		blanks = ['\n', '\r', ' ', '\t']
		while self.curChar in blanks:
			self.nextChar()

	def passDigits(self):
		while '1' <= self.exp[self.cur + 1] <= '9':
			nextChar()

	def nextChar(self):
		self.cur += 1
		self.curChar = self.exp[self.cur]

	def nextToken(self):
		self.nextChar()
		self.passBlanks()
		if '0' <= self.curChar <= '9':
			self.curToken = case['0']
			self.passDigits()
		else:
			self.curToken = case[self.curChar]


class Tree():
	def __init__(self, node, *children):
		self.node = node
		self.children = children

	def to_graph(self, graph):
		for child in self.children:
			node1 = pydot.Node(str(hash(self)), label = self.node)
			node2 = pydot.Node(str(hash(child)), label = child.node)
			graph.add_node(node1)
			graph.add_node(node2)
			edge = pydot.Edge(node1, node2)
			graph.add_edge(edge)
			child.to_graph(graph)


def parse(exp):

	def n():
		nonlocal lex
		print(lex.curToken)
		lex.nextToken()
		print(lex.curToken)
		return Tree("n")


	def F():
		nonlocal lex
		if lex.curToken == Token.LPAREN:
			lex.nextToken()
			e = E()
			if lex.curToken != Token.RPAREN:
				raise "')' expected"
			lex.nextToken()
			return Tree("F", Tree('('), e, Tree(')'))
		if lex.curToken == Token.MINUS:
			lex.nextToken()
			return Tree("F", Tree('-'), n())
		return Tree("F", n())

	def Tprime():
		nonlocal lex
		lex.nextToken()
		e = F()
		if lex.curToken != Token.END and lex.curToken == Token.CROSS:
			return Tree("T'", Tree('*'), e, Tprime())
		return Tree("T'", e)

	def T():
		nonlocal lex
		e = F()
		if lex.curToken != Token.END and lex.curToken == Token.CROSS:
			return Tree("T", e, Tprime())
		return Tree("T", e)

	def Eprime():
		nonlocal lex
		char = lex.curChar
		lex.nextToken()
		e = T()
		if lex.curToken != Token.END and (lex.curToken == Token.PLUS or lex.curToken == Token.MINUS):
			return Tree("E'", Tree(char), e, Eprime())
		return Tree("E'", Tree(char), e)

	def E():
		nonlocal lex
		e = T()
		if lex.curToken != Token.END and (lex.curToken == Token.PLUS or lex.curToken == Token.MINUS):
			return Tree("E", e, Eprime())
		return Tree("E", e)

	lex = lexicalAnalyzer(exp)
	return E()

def draw(tree, exp):
	graph = pydot.Dot(graph_type='graph')
	tree.to_graph(graph)
	name = "Tree_of_" + exp + ".png"
	graph.write_png(name)

exp = input()
tree = parse(exp)
draw(tree, exp)



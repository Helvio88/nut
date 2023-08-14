import importlib
import os.path
from nut import Print

_hooks = {}
initialized = False

def init():
	global initialized
	if initialized:
		return False

	initialized = True

def register(name, func):
	global _hooks

	if name not in _hooks:
		_hooks[name] = []

	_hooks[name].append(func)

def call(*argv):
	global _hooks

	argv = list(argv)

	if len(argv) == 0:
		return False

	name = argv.pop(0)

	if name not in _hooks:
		return False

	for func in _hooks[name]:
		try:
			func(*argv)
		except BaseException as e:
			Print.error('plugin exception: %s' % str(e))

	return True

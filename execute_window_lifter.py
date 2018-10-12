from sismic.io import import_from_yaml, export_to_plantuml
from sismic.model import Statechart, Event
from sismic.interpreter import Interpreter
from sismic.testing import event_is_fired

def print_all():
	print('\n')
	for attribute in ['event', 'transitions', 'entered_states', 'exited_states', 'sent_events']:
		print('{}: {}'.format(attribute, getattr(step, attribute)))

with open('.\\window_lifter.yaml') as f:
	statechart = import_from_yaml(f)
	assert isinstance(statechart, Statechart)
	
	# draw the statechart
	#res = export_to_plantuml(statechart)
	#print(res)
	
	# Create an interpreter for this statechart
	interpreter = Interpreter(statechart)
	
	print(interpreter.configuration)
	
	interpreter.queue('windowApprovalOnChange', hasWindowApproval=True)
	interpreter.execute()
	print(interpreter.configuration)
	
	interpreter.queue('moveRequest', request="OPEN")
	step = interpreter.execute()
	assert event_is_fired(step, 'moveCommand')
	print(interpreter.configuration)	

	interpreter.queue('windowApprovalOnChange', hasWindowApproval=False)
	step = interpreter.execute()
	assert event_is_fired(step, 'moveCommand', {'command': 'NONE'})
	print(interpreter.configuration)
# sismic-bdd window_lifter.yaml --features window_lifter.feature

from sismic.io import import_from_yaml, export_to_plantuml
from sismic.model import Statechart

with open('C:\\Users\\Q443952\\entwicklung\\window_lifter.yaml') as f:
	statechart = import_from_yaml(f)
	assert isinstance(statechart, Statechart)
	res = export_to_plantuml(statechart)
	print(res)
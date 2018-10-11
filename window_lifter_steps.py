from sismic.bdd import map_action, map_assertion

map_action('I do not grant window approval',    'I do nothing')
map_action('I grant window approval',    'I send event windowApprovalOnChange with hasWindowApproval=True')
map_action('I withdraw window approval', 'I send event windowApprovalOnChange with hasWindowApproval=False')


map_action('I try to open the window',          'I send event moveRequest with request="OPEN"')
map_action('I try to close the window',         'I send event moveRequest with request="CLOSE"')
map_action('I try to stop any window movement', 'I send event moveRequest with request="NONE"')

map_assertion('command is sent to open the window',  'Event moveCommand is fired with command="OPEN"')
map_assertion('command is sent to close the window', 'Event moveCommand is fired with command="CLOSE"')
map_assertion('command is sent to stop the window', 'Event moveCommand is fired with command="NONE"')

map_assertion('nothing happens', 'Event moveCommand is not fired')

Given arrival of message diffoo.in.foo with parameter p1 == 1
Then send message diffee.out.fee with parameter po = 1 within 50 ms

Given in message diffoo.in.foo with parameter p1 == 1
Then send out message diffee.out.fee with parameter po = 1 within 50 ms

Given in message diffoo.in.foo as IN with IN.p1 == 1
Then send out message diffee.out.fee with parameter po = 1 within 50 ms

Given in message diffoo.in.foo as IN
  containing IN.p1 == 1
Then send out message diffee.out.fee as OUT periodically with period = 100 ms
  containing OUT.po = 1

Given arrival of message diffoo.in.foo with parameter p1 == 1
  And arrival of message diffoo.in.foo with parameter p1 == 1
Then send message diffee.out.fee with parameter po = 1

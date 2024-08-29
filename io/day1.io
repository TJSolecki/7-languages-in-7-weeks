SomeObj := Object clone

SomeObj foo := method("foo" println)
SomeObj bar := method("bar" println)
SomeObj baz := method("baz" println)
SomeObj baf := method("baf" println)
SomeObj doMath := method((1+1) println)

"Provide the name of the slot to execute" println
userProvidedSlot := File standardInput readLine


SomeObj getSlot(userProvidedSlot) call

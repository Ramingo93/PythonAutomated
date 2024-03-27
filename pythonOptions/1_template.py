# python template file 

#import built-in lib
import atexit
# importing external libraries

#importing self-defined lib
import decorators
from decorators import tictoc

#_________

@tictoc
def template_func():
  print("make this code yours")
 
@atexit.register
def exit_handler() -> None:
	print("main execution is going to be terminated") #executed whatever error is going to occur
	#use atexit.unregister(exit_handler) to avoid executing the program termination terminating handler

#_________

# run the code only if this code is run directly from this very file, and not when imported into another project
if "__main__" == __name__:
  template_func()

# python template file 

#import built-in lib
import time
from time import sleep

import atexit

from functools import wraps
from typing import Callable, Any
# importing external libraries

#importing self-defined lib

# logging the execution time of a function
def tictoc(func):
  def wrapper(*args, **kwargs):
    t0 = time.time() #start time
    result = func(*args, **kwargs) #call the decorated function
    dt = time.time() - t0 #time elapsed
    print(f'function {func.__name__!r} ran in'\
        f' {dt:.4f} seconds')
  return wrapper

#
@atexit.register
def exit_handler() -> None:
	print("decorator execution is going to be terminated") #executed whatever error is going to occur
	#use atexit.unregister(exit_handler) to avoid executing the program termination terminating handler

#retry x-times the connection
def retry(retries: int = 3, delay: float = 1) -> Callable:
    """
    Attempt to call a function, if it fails, try again with a specified delay.
    :param retries: The max amount of retries you want for the function call
    :param delay: The delay (in seconds) between each function retry
    :return:
    """
    # Don't let the user use this decorator if they are high
    if retries < 1 or delay <= 0:
        raise ValueError('Are you high, mate?')

    def decorator(func: Callable) -> Callable:
        @wraps(func)
        def wrapper(*args, **kwargs) -> Any:
            for i in range(1, retries + 1):  # 1 to retries + 1 since upper bound is exclusive
                try:
                    print(f'Running ({i}): {func.__name__}()')
                    return func(*args, **kwargs)
                except Exception as e:
                    # Break out of the loop if the max amount of retries is exceeded
                    if i == retries:
                        print(f'Error: {repr(e)}.')
                        print(f'"{func.__name__}()" failed after {retries} retries.')
                        break
                    else:
                        print(f'Error: {repr(e)} -> Retrying...')
                        sleep(delay)  # Add a delay before running the next iteration
        return wrapper
    return decorator

@retry(retries=3, delay=1)
def connect() -> None:
    time.sleep(1)
    raise Exception('Could not connect to internet...')
#!/usr/bin/env python3
'''
Cache class module
'''
import redis
import uuid
from typing import Union, Callable, Any
from functools import wraps


def count_calls(func: Callable) -> Callable:
    '''
    Counts the number of times a method of clas Cache is called
    '''

    @wraps(func)
    def wrapper(self, *args, **kwargs) -> Any:
        '''
        invokes the given method
        '''

        if isinstance(self._redis, redis.Redis):
            self._redis.incr(func.__qualname__)
        return func(self, *args, **kwargs)
    return wrapper


class Cache():
    '''
    Cache class
    '''

    def __init__(self) -> None:
        '''
        Initialize a Cache Instance
        '''

        self._redis = redis.Redis()
        self.flush = self._redis.flushdb()

    @count_calls
    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''
        Store Methods takes a data srgument and returns a string (key)
        '''

        key: str = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key, fn: Callable = None) -> Union[str, bytes, int, float]:
        '''
        Get method
        '''

        data = self._redis.get(key)
        if fn is None:
            return data
        return fn(data)

    def get_str(self, key: str) -> str:
        '''
        Converts value to string
        '''

        return self._redis.get(key, lambda x: str(x, 'UTF-8'))

    def get_int(self, key: str) -> int:
        '''
        Converts value to integer
        '''

        return int(self._redis.get(key, lambda x: int(x)))

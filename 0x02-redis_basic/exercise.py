#!/usr/bin/env python3
'''
Cache class module
'''
import redis
import uuid
from typing import Union


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

    def store(self, data: Union[str, bytes, int, float]) -> str:
        '''
        Store Methods takes a data srgument and returns a string (key)
        '''

        key: str = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

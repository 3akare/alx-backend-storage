#!/usr/bin/env python3
'''
insert a new document into a collection
'''

import pymongo
client = pymongo.MongoClient()


def insert_school(mongo_collection, **kwargs):
    '''
    insert_school fucntion
    '''
    obj = {}
    for k, v in kwargs.items():
        obj[k] = v
    _id = mongo_collection.insert_one(obj).inserted_id
    return _id

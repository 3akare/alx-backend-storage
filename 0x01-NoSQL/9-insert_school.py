#!/usr/bin/env python3
'''
insert a new document into a collection
'''

import pymongo
client = pymongo.MongoClient()

def insert_school(mongo_collection, **kwargs):
    obj = {}
    for k, v in kwargs.items():
        obj[k] = v
    mongo_collection.insert_one(obj)
    return mongo_collection.find(obj).id

#!/usr/bin/env python3
'''
list_all function module
'''


import pymongo
client = pymongo.MongoClient()


def list_all(mongo_collection):
    '''
    Lists all documents in a collection
    '''
    collection = []
    if mongo_collection.find():
        collection = mongo_collection.find()
    return collection

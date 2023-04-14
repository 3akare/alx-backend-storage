#!/usr/bin/env python3
'''
update_topics function module
'''

import pymongo
client = pymongo.MongoClient()


def update_topics(mongo_collection, name, topics):
    '''
    update_topics function
    '''
    update = {
        '$set': {
            'topics': topics
        }
    }
    mongo_collection.update_one({'name': name}, update)

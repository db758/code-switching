from pymongo import MongoClient
 
conn = MongoClient('127.0.0.1',27017)
db_crawl = conn.mydb_crawl #Connect to mydb_test database, if not, it will be created automatically
my_crawl = db_crawl.test_crawl #Use test_set collection, if not, it will be created automatically

# coding:utf8
import urllib
from urllib import request
class HtnlDownloader(object):
    def download(self, url):
        if url is None:
            print("url is None")
            return None
        response = urllib.request.urlopen(url)
        if response.getcode() != 200: # ==200 means that the network request is successful, returning this status means that the data has been obtained
            print("response.getcode():", response.getcode(),"!=200")
            return
        return response.read()
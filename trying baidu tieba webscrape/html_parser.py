# coding:utf8
import re
from urllib import parse
 
from bs4 import BeautifulSoup
 
#from config import *
 
 
class HtmlParser(object):
    def _get_new_urls(self, page_url, soup):
        new_urls = set()
        links = soup.find_all('a',href=re.compile(r".*\/p\/.*"))
        for link in links:
            new_url = link['href']
            new_full_url = parse.urljoin(page_url, new_url)
            new_urls.add(new_full_url)
        return new_urls
 
    def _get_new_data(self, page_url, soup):
 
        str_ = []
        my_crawl = []
        title_node = soup.find('title')# Each post on the homepage of Tieba is a title, click into it and the title of each post is also marked
        title = title_node.get_text()
        # print("title:",title)
 
 
        if soup.find('a',rel = r"noreferrer") is not None:
            para_node = soup.find_all('a', rel=r"noreferrer")
        else:
            para_node = soup.find_all('div',class_="d_post_content_main")
            # print(len(para_node))
            for node in para_node:
                try:
                    temp = node.get_text()
                    temp = str(temp).replace(" ","").replace("\n","")
                    if temp is not "":
                        if temp in title: #Cannot get the second level and later reply content in the post
                                 print(temp,"in title:",title,"skip")
                        else:
                            str_.append(temp)
                except:
                    pass
                my_crawl.extend([{'url':page_url,'title':title,'para':str_}]) #Insert URL, title, para into the database
        return my_crawl

 
 
    def parse(self, page_url, html_cont):
        if page_url is None or html_cont is None:
            return
        soup = BeautifulSoup(html_cont, 'html.parser', from_encoding='utf-8')
        new_urls = self._get_new_urls(page_url, soup)
        #self._get_new_data(page_url,soup)
        new_data = self._get_new_data(page_url, soup)
        return new_urls, new_data
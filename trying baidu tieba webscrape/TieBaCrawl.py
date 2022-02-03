# coding:utf8
import html_parser
import url_manager
import html_downloader
 
 
class SpiderMain(object):
    def __init__(self):
        self.urls = url_manager.UrlManager()
        self.downloader = html_downloader.HtnlDownloader()
        self.parser = html_parser.HtmlParser()
        self.data = []
 
    def craw(self, root_url):
        count = 1
        self.urls.add_new_url(root_url)
        while self.urls.has_new_url():
            try:
                new_url = self.urls.get_new_url()
                #print ('craw %d :%s' % (count, new_url))
                html_cont = self.downloader.download(new_url)
                new_urls, new_data = self.parser.parse(new_url, html_cont)
                self.urls.add_new_urls(new_urls)
                self.data.extend(new_data)
                if count == 100: #TODO: change this !! 
                	break
                count = count + 1
            except:
                print ('craw failed')
                raise 
 
 
if __name__ == "__main__":
	root_url = "https://tieba.baidu.com/f?kw=%E5%8C%97%E4%BA%AC%E5%A4%A7%E5%AD%A6&traceid="
	obj_spider = SpiderMain()
	obj_spider.craw(root_url)
	for page in obj_spider.data:
		print(page['title'] + ' ' + ' '.join(page['para']))

	#TODO: output file here 
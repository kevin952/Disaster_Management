from newsapi import NewsApiClient
import time
from datetime import datetime
import requests
import bs4
from pdb import set_trace
import jsonlines
from utils import *
import pickle 
import joblib


class Spider:

    output = []
    def __init__(self):

        self.time_ = time.time()
        
        # Keep count of news being fetched from different sources
        self.count_api = 0
        self.count_dte = 0
        self.count_demo = 0

        # get news from API
        self.get_news_from_api()

        # get news from links
        self.get_news_from_links()

        print(len(self.output))
        relevant = self.filter_relevant()
        for i,article in zip(relevant,self.output):
            if i:
                print(article[1])

        print(len(relevant))
        print(relevant)
        set_trace()

        # sort as per date  
        self.output.sort(key=lambda x: datetime.strptime(x[0], '%d %b %Y'), reverse=True)


        # write results
        self.write_data()

        # write logs
        self.get_logs()


    def get_news_from_api(self):

        # Init
        newsapi = NewsApiClient(api_key='76eb8da143df4bc586e05edaf8ad2335')

        # /v2/top-headlines
        top_headlines = newsapi.get_top_headlines(
                                                  category='health',
                                                  language='en',
                                                  country='in',)

        # Extract news from the API
        for article in top_headlines['articles']:
            
            try:
                # Fetch all the fields
                date = article['publishedAt']
                title = article['title']
                desc = article['description']
                url = article['url']
                image = article['urlToImage']

                # clean the data 
                date = process_date(date,0)
                title = process_text(title)
                desc = process_text(desc)
                # store the data
                self.output.append([date,title,desc,url,image])
                self.count_api += 1

            except:
                # if any error continue
                continue

    
    def get_news_from_links(self):
        
        # CONSTANTS
        HEADERS = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36'}

        LINKS = [
                # index 0 == downtoearth.org
                'https://www.downtoearth.org.in/category/natural-disasters/news?page=1&per-page=25',
                # index 1 == demonews website
                'https://demo-news-site.netlify.app/'
                ]


        # Extract news from the links mentioned
        for i, link in enumerate(LINKS):
            
            # DownToEarth
            if i == 0:
                # Loop to paginate through downtoearth
                for i in range(1):
                    # Scraping Structure for downtoearth.org
                    sublink = link[:68] + str(i) + link[69:]
                    r = requests.get(sublink, HEADERS)
                    soup = bs4.BeautifulSoup(r.content,'html.parser')
                    container = soup.find_all(class_='single-news-wrapper')

                    for div in container:
                        try:
                            a = div.find_all('a')
                            # get url
                            url = a[0]['href']
                            # get title and desciption
                            title, desc = a[2].find_all('p')
                            title, desc = title.text, desc.text
                            # get date
                            date = div.find_all(class_='pull-left content-date')
                            date = date[0].text
                            # get image
                            image = div.find('img')['src']

                            # clean the data 
                            date = process_date(date,1)
                            title = process_text(title)
                            desc = process_text(desc)


                            # store the data
                            self.output.append([date,title,desc,url,image])
                            self.count_dte += 1
                            
                        except:
                            print('Theres an error with Down_to_earth scraper')    
                print(self.output)
                

            # DemoNews
            if i == 1:
                r = requests.get(link, HEADERS)
                soup = bs4.BeautifulSoup(r.content,'html.parser')
                container = soup.find_all(class_='news')
                
                for div in container:
                    title = div.find('h3').text
                    date = div.find('h6').text
                    desc = div.find('p').text
                    url = ''
                    image = ''

                    # clean the data 
                    date = process_date(date,2)
                    title = process_text(title)
                    desc = process_text(desc)

                    # store the data
                    self.output.append([date,title,desc,url,image])
                    self.count_demo += 1

                print(self.output)


    def filter_relevant(self):
        
        # seperate all the news in a list
        news = []
        for article in self.output:
            news.append(article[1])
        
        # load the pretrained models
        model_test=joblib.load("../ML/model1.pkl")
        vectorizer = joblib.load("../ML/vectorizer.pkl")
        
        # transform testing data into a document-term matrix (using existing vocabulary)
        tokenized_news = vectorizer.transform(news)
        tokenized_news.toarray()

        # prediction
        pred = model_test.predict(tokenized_news)
        return pred


    def write_data(self):

        with jsonlines.open('data.jsonl','a') as f:
            for article in self.output:
                one_article = {
                            'date':article[0],
                            'title':article[1],
                            'description':article[2],
                            'url':article[3],
                            'image':article[4]
                            }
                f.write(one_article)


    def get_logs(self):
        
        if not self.output:
            logs = 'No new rows added'
        else:
            logs = str(len(self.output)) +' rows added.'

        print(f'{datetime.fromtimestamp(self.time_)}: {logs}')

spider = Spider()

import urllib.request

url = 'https://archive.apache.org/dist/spark/spark-3.0.1/spark-3.0.1-bin-hadoop3.2.tgz'
urllib.request.urlretrieve(url, 'spark.tgz')

import requests
from bs4 import BeautifulSoup
from win10toast import ToastNotifier


n = ToastNotifier()


def getdata(url):
    
    r = requests.get(url)
      
    return r.text


htmldata = getdata("https://cad.currencyrate.today/cny")
soup = BeautifulSoup(htmldata, 'html.parser')
# print(soup.prettify())
info_list = []
for info in soup.find_all('span', class_ = 'cc-result'):
    info_list.append(info)
 
currency_rate=info_list[1].text

# print(currency_rate)

result = "Today the currency rate is 1 CAD to " + currency_rate


n.show_toast("Currenty rate update", result, duration = 10)
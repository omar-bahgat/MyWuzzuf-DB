#!/usr/bin/env python
# coding: utf-8

# In[1]:


import time
import re
import requests
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import pandas as pd

# helper functions

def contains_number(input_string):
    pattern = r'\d'
    match = re.search(pattern, input_string)
    return bool(match)

def extract_text(soup_object, attributes):
    if soup_object is not None:
        for element in soup_object:
            text = element.text.strip()
            if text:
                attributes.append(text)
    else:
        attributes.append('')

def get_city(input_string):
    if ',' in input_string:
        words = input_string.split(',')
        word_before_last_comma = words[-2].strip()
        return word_before_last_comma
    else:
        return ''

def run(url):
    driver = webdriver.Chrome()
    driver.get(url)
    website_text = driver.page_source
    soup_website = BeautifulSoup(website_text, 'lxml')
    return soup_website  

def get_links(soup_website):
    company_links = []
    c_link = soup_website.find_all('div', class_='css-d7j1kk')
    for div in c_link:
        anchor = div.find('a')
        if anchor:
            href = anchor.get('href')
            if href is not None:
                company_links.append(href)
    return company_links

def load_page(link):
    driver = webdriver.Chrome()
    driver.get(link)
    
    see_more_selector = '#profile-section > p > span'
    
    try:
        see_more_button = driver.find_element(By.CSS_SELECTOR, see_more_selector)
        see_more_button.click()
        time.sleep(1)
        
    except:
        pass
    
    company_text = driver.page_source
    return BeautifulSoup(company_text, 'lxml')

def get_attributes(soup_company, comp_attributes, comp_sectors):
    
    # Name (PK)
    name = soup_company.find('h1', class_ = 'css-12s37jy')
    extract_text(name, comp_attributes)
    
    # City
    region = soup_company.find('span', class_ = 'css-imwdn1')
    if region is not None:
        city = get_city(region.text)
        comp_attributes.append(city)
    else:
        comp_attributes.append('')

    # Size
    size = soup_company.find_all('span', class_ = 'css-16heon9')
    for element in size:
        if contains_number(element.text):
            extract_text(element, comp_attributes)
       
    # Date
    foundationDate = soup_company.find('span', class_ = 'css-6whuzn')
    extract_text(foundationDate, comp_attributes)

    # URL 
    div_element = soup_company.find('div', class_='css-1517rho')
    if div_element is not None:
        a_tag = div_element.find('a')
        if a_tag is not None:
            url = a_tag['href']
            comp_attributes.append(url)
        else:
            comp_attributes.append('')
    else:
        comp_attributes.append('')
     
    # Description
    companyDescription = soup_company.find('p', class_ = 'css-1ceuc1v')
    extract_text(companyDescription, comp_attributes)
    
    # Sectors
    sectors = soup_company.find('p', class_ = 'css-q6wie4')
    sector = sectors.find_all('a', 'css-tdvcnh')
    comp_sectors.append(comp_attributes[0])      
    if sector is not None:
        for element in sector:
            comp_sectors.append(element.text)
    else: comp_sectors.append('')

def scrape_company_data(start, end):
    companies_data = []
    companies_sectors_data = []

    for i in range(start, end):
        URL = f'https://wuzzuf.net/a/IT-Software-Development-Jobs-in-Egypt?start={i}'
        soup_website = run(URL)

        company_links = get_links(soup_website)

        companies_attributes = []
        companies_sectors = []

        for link in company_links:
            time.sleep(1)
            soup_company = load_page(link)
            comp_attributes = []
            comp_sectors = []
            get_attributes(soup_company, comp_attributes, comp_sectors)
            companies_attributes.append(comp_attributes)
            companies_sectors.append(comp_sectors)

        for row in companies_attributes:
            if len(row) > 6:
                row[:] = row[:6]
            else:
                row += [''] * (6 - len(row))

        for row in companies_attributes:
            for i in range(len(row)):
                row[i] = row[i].replace('\n', '').replace('See Less', '')

        companies_data.extend(companies_attributes)
        companies_sectors_data.extend(companies_sectors)

    return companies_data, companies_sectors_data

def save_to_csv(data, filename):
    
    df = pd.DataFrame(data)
    df.to_csv(filename, index = False)

def main():
    
    start = 0
    end = 65

    companies_data, companies_sectors_data = scrape_company_data(start, end)

    save_to_csv(companies_data, 'companies_table.csv')
    save_to_csv(companies_sectors_data, 'companies_sectors_table.csv')

if __name__ == "__main__":
    main()


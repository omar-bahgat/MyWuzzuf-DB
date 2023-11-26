#!/usr/bin/env python
# coding: utf-8

# In[28]:


import time
import requests
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from bs4 import BeautifulSoup
import pandas as pd

# helper functions

def extract_text(soup_object, attributes):
    if soup_object is not None:
        for element in soup_object:
            text = element.text.strip() 
            if text:  
                attributes.append(text)
    else:
        attributes.append('')
        
def get_city_job(soup_object):
    if soup_object is not None:
        text = soup_object.text.strip()
        words = text.split()
        if words:
            if words[-1] == "Egypt":
                if len(words) > 1 and "," in words[-2]:
                    city = words[-2].split(",")[0]
                else:
                    city = words[-2] if len(words) > 1 else words[-1]
            else:
                city = words[-1]
        else:
            city = ''
    else:
        city = ''
    return city

def run(url):
    driver = webdriver.Chrome()
    driver.get(url) 
    website_text = driver.page_source
    soup_website = BeautifulSoup(website_text, 'lxml')
    return soup_website

def get_links(soup_website):
    jobPost_links = []
    jb_link = soup_website.find_all('h2', class_='css-m604qf')
    for div in jb_link:
        anchor = div.find('a')  
        if anchor:
            href = anchor.get('href')  
            if href is not None:
                jobPost_links.append(href)
    return jobPost_links

def load_page(link):
    driver = webdriver.Chrome()
    driver.get(link)
    jobPost_text = driver.page_source
    return BeautifulSoup(jobPost_text, 'lxml')

def get_attributes(soup_jobPost, jb_attributes, jobPost_categories, jobPost_skills):

    # Title (PK)
    postTitle = soup_jobPost.find('h1', class_ = 'css-f9uh36')
    extract_text(postTitle, jb_attributes)
    
    # City (PK)
    region = soup_jobPost.find('strong', class_ = 'css-9geu3q')
    city = get_city_job(region)
    jb_attributes.append(city)
    
    # Company Name (PK / FK)
    companyName = soup_jobPost.find('a', class_ = 'css-p7pghv')
    extract_text(companyName, jb_attributes)
    
    # Type
    jobType = soup_jobPost.find('span', class_ = 'css-ja0r8m eoyjyou0')
    extract_text(jobType, jb_attributes)
    
    # Date posted
    datePosted = soup_jobPost.find('span', class_ = 'css-182mrdn')
    date_posted_text = datePosted.text.strip() if datePosted else ''
    date_posted_text = ' '.join(date_posted_text.split())
    jb_attributes.append(date_posted_text)

    # Experience, Career, Education, Salary
    group1 = soup_jobPost.find_all('span', class_ = 'css-4xky9y')
    extract_text(group1, jb_attributes)

    # Description
    jobDescription = soup_jobPost.find_all('div', class_ = 'css-1uobp1k')
    extract_text(jobDescription, jb_attributes)
    
    # Job Categories
    jobCategories = soup_jobPost.find('div', class_ = 'css-13sf2ik')
    jc = []
    if jobCategories:
        jc = jobCategories.find_all('span', class_ = 'css-158icaa')
    
    if jb_attributes[0] and jb_attributes[0].strip() and \
       jb_attributes[1] and jb_attributes[1].strip() and \
       jb_attributes[2] and jb_attributes[2].strip():
        if jc is not None:
            for element in jc:
                temp = [jb_attributes[0], jb_attributes[1], jb_attributes[2], element.text]
                jobPost_categories.append(temp)

        
    # Job Skills
    sk = soup_jobPost.find('div', class_ = 'css-s2o0yh')
    skills = []
    if sk:
        skills = sk.find_all('span', class_ = 'css-158icaa')
    
    if jb_attributes[0] and jb_attributes[0].strip() and \
       jb_attributes[1] and jb_attributes[1].strip() and \
       jb_attributes[2] and jb_attributes[2].strip():
        if skills is not None:
            for element in skills:
                temp = [jb_attributes[0], jb_attributes[1], jb_attributes[2], element.text]
                jobPost_skills.append(temp)

            
def scrape_jobPost_data(start, end):

    jobPost_attributes_data = []
    jobPost_categories_data = []
    jobPost_skills_data = []

    for i in range(start, end):
        URL = f'https://wuzzuf.net/a/IT-Software-Development-Jobs-in-Egypt?start={i}'
        soup_website = run(URL)
    
        jobPost_links = get_links(soup_website)

        jobPost_attributes = []
        jobPost_categories = []
        jobPost_skills = []
    
        for link in jobPost_links:
#         if link == 'https://wuzzuf.net/jobs/egypt':
#             continue
            time.sleep(1)
            soup_jobPost = load_page(link)
            jb_attributes = []
            get_attributes(soup_jobPost, jb_attributes, jobPost_categories, jobPost_skills)
        
            if jb_attributes[0] and jb_attributes[0].strip() and \
               jb_attributes[1] and jb_attributes[1].strip() and \
               jb_attributes[2] and jb_attributes[2].strip():
                    jobPost_attributes.append(jb_attributes)

        for row in jobPost_attributes:
            for i in range(len(row)):
                if isinstance(row[i], str):
                    row[i] = row[i].replace('\n', ' ').replace('\xa0', ' ')

        for row in jobPost_categories:
            for i in range(len(row)):
                if isinstance(row[i], str):
                    row[i] = row[i].replace('\n', ' ').replace('\xa0', ' ')

        for row in jobPost_skills:
            for i in range(len(row)):
                if isinstance(row[i], str):
                    row[i] = row[i].replace('\n', ' ').replace('\xa0', ' ')
    
        jobPost_attributes_data.extend(jobPost_attributes)
        jobPost_categories_data.extend(jobPost_categories)
        jobPost_skills_data.extend(jobPost_skills)

    return jobPost_attributes_data, jobPost_categories_data, jobPost_skills_data   

def save_to_csv(data, filename):
    df = pd.DataFrame(data)
    df.to_csv(filename, index = False)
    
def main():
    
    start = 0
    end = 65

    jobPost_attributes_data, jobPost_categories_data, jobPost_skills_data = scrape_jobPost_data(start, end)

    save_to_csv(jobPost_attributes_data, 'jobPosts_table.csv')
    save_to_csv(jobPost_categories_data, 'jobPosts_categories_table.csv')
    save_to_csv(jobPost_skills_data, 'jobPosts_skills_table.csv')

if __name__ == "__main__":
    main()


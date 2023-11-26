#!/usr/bin/env python
# coding: utf-8

# In[328]:


import mysql.connector
import re

mydb = mysql.connector.connect(
    host = "db4free.net",
    user = "omar_bahgat",
    password = "deathlyhallows",
    database = "jobsearch"
)

mycursor = mydb.cursor()


# In[329]:


def Home_Page(flag):
    
    if(flag):
        print("Welcome to MyWuzzuf")
        print()
    
    valid = False
    while(not valid):
        print("Select what you want to do from the following: ")
        print("1. Register a user")
        print("2. Add a new user application for an existing Job posting")
        print("3. Show all the job postings for a given sector")
        print("4. Show all the job postings for a given set of skills")
        print("5. Show the top 5 sectors by number of job posts, and the average salary range for each")
        print("6. Show the top 5 skills that are in the highest demand")
        print("7. Show the top 5 growing startups in Egypt by the amount of vacancies they have compared to their foundation date")
        print("8. Show the top 5 most paying companies in the field in Egypt")
        print("9. Show all the postings for a given company / organization")
        print("10. Show the top 5 categories (other than IT/Software Development) that the postings are cross listed under based on the volume of postings")
        print("11. Exit")
        option = input("Enter the number of the option you want to select: ")
        
        if(option == '1'):
            valid = True
            Query1()
        elif(option == '2'):
            valid = True
            Query2()
        elif(option == '3'):
            valid = True
            Query3()
        elif(option == '4'):
            valid = True
            Query4()
        elif(option == '5'):
            valid = True
            Query5()
        elif(option == '6'):
            valid = True
            Query6()
        elif(option == '7'):
            valid = True
            Query7()
        elif(option == '8'):
            valid = True
            Query8()
        elif(option == '9'):
            valid = True
            Query9()
        elif(option == '10'):
            valid = True
            Query10()
        elif(option == '11'):
            quit()
        else:
            print()
            print("Please select a valid option")
            print()


# In[330]:


def Query1():

    Email = input("Enter email: ")
    City = input("Enter city: ")
    Country = input("Enter country: ")
    FirstName = input("Enter first name: ")
    MiddleName = input("Enter middle name: ")
    LastName = input("Enter last name: ")
    Gender = input("Enter gender (M/F): ")
    Birthdate = input("Enter birthdate (YYYY-MM-DD): ")
    Nationality = input("Enter nationality: ")
    PhoneNumber = input("Enter phone number (11 digits): ")
    EducationLevel = input("Enter education level: ")
    YearsOfExperience = input("Enter years of experience: ")
    GPA = input("Enter GPA: ")

    num_skills = int(input("How many skills will you input? "))
    skills = []
    for i in range(num_skills):
        skill = input(f"Enter skill {i + 1}: ")
        skills.append(skill)

    num_languages = int(input("How many languages will you input? "))
    languages = []
    for i in range(num_languages):
        language = input(f"Enter language {i + 1}: ")
        languages.append(language)

    sql = ("INSERT INTO applicant (Email, City, Country, FirstName, MiddleName, LastName, Gender, Birthdate, "
       "Nationality, PhoneNumber, EducationLevel, YearsOfExperience, GPA) "
       "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)")
    val = (
        Email, City, Country, FirstName, MiddleName, LastName,
        Gender, Birthdate, Nationality, PhoneNumber,
        EducationLevel, YearsOfExperience, GPA
    )

    mycursor.execute(sql, val)

    for skill in skills:
        skill_sql = "INSERT INTO applicantskills (Email, Skills) VALUES (%s, %s)"
        skill_val = (Email, skill)
        mycursor.execute(skill_sql, skill_val)

    for language in languages:
        language_sql = "INSERT INTO applicantlanguages (Email, Languages) VALUES (%s, %s)"
        language_val = (Email, language)
        mycursor.execute(language_sql, language_val)

    mydb.commit()
    print("User information inserted successfully!")   
    print()
    
    Home_Page(flag = False)


# In[331]:


def Query2():
    
    sql_query = """
        SELECT JP.PostTitle, JP.City, C.Name AS CompanyName
        FROM jobpost JP
        INNER JOIN company C ON JP.Name = C.Name
    """
    mycursor.execute(sql_query)
    job_posts_info = mycursor.fetchall()

    print()
    print("Available Job Post Titles:")
    for idx, row in enumerate(job_posts_info, start=1):
        post_title, city, company_name = row
        print(f"{idx}. {post_title} - (City: {city}, Company Name: {company_name})")
    print()

    Email = input("Enter your email: ")

    sql_query = "SELECT * FROM applicant WHERE Email = %s"
    mycursor.execute(sql_query, (Email,))
    existing_email = mycursor.fetchone()

    if existing_email:
        print("Email found. Fetching additional information for application.")
        selected_post_idx = int(input("Choose a Job Post number: "))
        selected_post_title, selected_city, selected_company_name = job_posts_info[selected_post_idx - 1]

        ApplicationDate = input("Enter application date (YYYY-MM-DD): ")
        CoverLetter = input("Enter your cover letter: ")

        sql_query = "INSERT INTO applicantappliesjob (Email, PostTitle, City, Name, ApplicationDate, CoverLetter) VALUES (%s, %s, %s, %s, %s, %s)"
        val = (Email, selected_post_title, selected_city, selected_company_name, ApplicationDate, CoverLetter)

        mycursor.execute(sql_query, val)
        mydb.commit()

        print("New application added successfully!")
    else:
        print("Email not found. No further action taken.")
    print()
    
    Home_Page(flag = False)


# In[332]:


def Query3():
    
    sql_query1 = "SELECT DISTINCT Categories FROM jobpostcategories"
    mycursor.execute(sql_query1)
    categories = mycursor.fetchall()

    cleaned_categories = [category[0].replace('\r', '') for category in categories]
    print()
    print("Job Sectors:")
    for index, category in enumerate(cleaned_categories, start=1):
        print(f"{index}. {category}")

    sector_index = int(input("Choose the row number of the category: "))
    sector = cleaned_categories[sector_index - 1]  # Adjust for 0-based index
    sector += '\r'
    print()

    sql_query2 = """
    SELECT jp.PostTitle, jp.City, jp.Name, jp.Type, jp.DatePosted, jp.YearsOfExperience, 
    jp.CareerLevel, jp.EducationLevel, jp.Salary, jp.Description
    FROM jobpost jp
    INNER JOIN jobpostcategories jpc ON jp.PostTitle = jpc.PostTitle
        AND jp.City = jpc.City
        AND jp.Name = jpc.Name
    WHERE jpc.Categories = %s
    """

    mycursor.execute(sql_query2, (sector,))
    results = mycursor.fetchall()

    i = 1  

    for row in results:
        print(f"{i}. {row}")
        print()  
        i += 1 

    Home_Page(flag=False)


# In[333]:


def Query4():
    
    sql_query1 = "SELECT DISTINCT Skills FROM jobpostskills"
    mycursor.execute(sql_query1)
    job_skills = mycursor.fetchall()

    print()
    print("Available job skills:")
    for idx, skill in enumerate(job_skills, start=1):
        print(f"{idx}. {skill[0]}")  

    num_skills = int(input("How many skills do you want to choose? "))
    skills_set = []
    for i in range(num_skills):
        chosen_skill = input(f"Enter skill {i + 1} (skill itself): ")
        skills_set.append(chosen_skill + '\r')  

    sql_query2 = """
        SELECT JP.PostTitle, JP.City, JP.Name, JP.Type, JP.DatePosted, JP.YearsOfExperience, JP.CareerLevel, JP.EducationLevel, JP.Salary, JP.Description
        FROM jobpost JP
        INNER JOIN jobpostskills JPS ON JP.PostTitle = JPS.PostTitle AND JP.City = JPS.City AND JP.Name = JPS.Name
        WHERE JPS.Skills IN ({})
    """

    placeholders = ', '.join(['%s'] * len(skills_set))
    formatted_query = sql_query2.format(placeholders)

    mycursor.execute(formatted_query, skills_set)

    results = mycursor.fetchall()

    print()
    for idx, row in enumerate(results, start=1):
        print(f"{idx}. {row}")  
        print()  

    Home_Page(flag = False)


# In[334]:


def Query5():
    
    sql_query = """
    SELECT JC.Categories AS Sector,
    COUNT(*) AS JobPostCount,
    AVG(JP.Salary) AS AverageSalary
    FROM jobpostcategories JC
    INNER JOIN jobpost JP
    ON JC.PostTitle = JP.PostTitle
    AND JC.City = JP.City
    AND JC.Name = JP.Name
    GROUP BY JC.Categories
    ORDER BY JobPostCount DESC
    LIMIT 5;
    """
    
    mycursor.execute(sql_query)
    result = mycursor.fetchall()

    print()
    print("Top 5 Sectors by Average Salary Range:")
    for index, row in enumerate(result, start=1):
        sector = row[0].strip()  
        salaries = row[2]  

        if salaries:
            salary_values = [float(s.strip()) for s in str(salaries).split(',') if s.strip()]
            if salary_values:
                average_salary = sum(salary_values) / len(salary_values)
                print(f"{index}. Sector: {sector}, Average Salary: {average_salary:.2f}")
            else:
                print(f"{index}. Sector: {sector}, No valid salary information")
        else:
            print(f"{index}. Sector: {sector}, No salary information")
    print()
    
    Home_Page(flag = False)


# In[335]:


def Query6():
    
    sql_query = """
    SELECT Skills, COUNT(*) AS SkillCount
    FROM jobpostskills
    GROUP BY Skills
    ORDER BY SkillCount DESC
    LIMIT 5;
    """
    
    mycursor.execute(sql_query)
    result = mycursor.fetchall()

    print()
    i = 1
    for row in result:
        skill = row[0].strip()  
        print(f"{i}. {skill}")
        i += 1
        
    print()
    
    Home_Page(flag = False)


# In[336]:


def Query7():
    
    sql_query = """
    SELECT c.Name AS CompanyName, COUNT(j.PostTitle) AS VacancyCount,
           DATEDIFF(CURDATE(), c.FoundationDate) AS DaysSinceFoundation
    FROM company c
    LEFT JOIN jobpost j ON c.Name = j.Name AND c.City = j.City
    GROUP BY c.Name
    ORDER BY (VacancyCount / DaysSinceFoundation) DESC
    LIMIT 5
    """

    mycursor.execute(sql_query)
    results = mycursor.fetchall()
    
    print()
    print("Top 5 Growing Startups in Egypt:")
    for idx, row in enumerate(results, start=1):
        company_name, _, _ = row  
        print(f"{idx}. Company: {company_name}")

    print()
    
    Home_Page(flag = False)


# In[337]:


def Query8():
    
    sql_query = """
    SELECT Name, AVG(Salary) AS AverageSalary
    FROM jobpost
    GROUP BY Name
    ORDER BY AverageSalary DESC
    LIMIT 5;
    """
    
    mycursor.execute(sql_query)
    result = mycursor.fetchall()
    
    print()
    print("Top 5 Most Paying Companies:")
    for index, row in enumerate(result, start=1):
        company_name = row[0]
        salary_string = str(row[1])  

        salary = re.search(r'\d+', salary_string)
        if salary:
            extracted_salary = int(salary.group())
        else:
            extracted_salary = 0

        print(f"{index}. Company: {company_name}, Salary: {extracted_salary}")
    
    print()
    
    Home_Page(flag = False)


# In[338]:


def Query9():
    
    sql_query1 = "SELECT Distinct Name FROM company"
    mycursor.execute(sql_query1)
    companies = mycursor.fetchall()

    print()
    print("Available Companies:")
    for idx, company in enumerate(companies, start=1):
        print(f"{idx}. {company[0]}")

    selected_company_idx = int(input("Choose a company by entering its number: "))
    selected_company_name = companies[selected_company_idx - 1][0] 

    sql_query2 = """
        SELECT *
        FROM jobpost
        WHERE Name = %s
    """

    mycursor.execute(sql_query2, (selected_company_name,))
    postings = mycursor.fetchall()

    print()
    print(f"Postings for {selected_company_name}:")
    for idx, posting in enumerate(postings, start=1):
        print(f"{idx}. {posting}")
        print()  
    
    print()
    
    Home_Page(flag = False)


# In[339]:


def Query10():
    
    sql_query = """
    SELECT Categories, COUNT(*) AS PostCount
    FROM jobpostcategories
    WHERE Categories != 'IT/Software Development\r'
    GROUP BY Categories
    ORDER BY PostCount DESC
    LIMIT 5
    """

    mycursor.execute(sql_query)
    results = mycursor.fetchall()

    print()
    print("Top 5 Categories by Post Count (Excluding IT/Software Development):")
    for idx, row in enumerate(results, start=1):
        category, _ = row  
        print(f"{idx}. Category: {category}")

    
    print()
    
    Home_Page(flag = False)


# In[ ]:


Home_Page(flag = True)


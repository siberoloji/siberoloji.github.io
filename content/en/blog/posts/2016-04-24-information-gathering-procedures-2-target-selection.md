---
draft: false

title:  'Information Gathering Procedures -2- Target Selection'
date: '2016-04-24T01:23:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /information-gathering-procedures-2-target-selection/
 
featured_image: /images/cyber3.jpg
categories:
    - 'Cyber Security'
tags:
    - cybersecurity
---


We have started the Information Gathering process, which is the 2nd Phase of Penetration Testing, with our article found at this link. We will try to explain the Target Selection title, which is one of the main topics we mentioned in that article.



Clear Definition of the Goal



When collecting information about an IT system begins, inevitably many domain names or IP addresses will be discovered. Sometimes, organizations have systems with a .com extension, but also have .net or .xyz addresses. At this point, it should be clearly stated that the team performing the test should never go beyond the scope determined during coordination.



If the scope is subject to restrictive rules, it is not possible to go beyond the main framework. Even if some systems contain very useful and useful information, it should be essential to strictly adhere to the rules of engagement, which we will explain below. Otherwise, it is inevitable that problems will occur both legally and ethically.



Rules of Engagement and Boundaries



The rules that emerge by linking the scope determined in coordination meetings to rules in detail -clear and without any room for doubt- are called rules of engagement. For example, when testing the X server, packets from an out-of-scope data source can be recorded in the analysis software. The rules that dictate which behavior to follow when this data is detected both set limits for the test team and determine the degree of their freedom.



Past experience of the company providing security services is an important criterion in determining the rules of engagement and boundaries. For this reason, while these rules are determined at the coordination meeting, it is of great importance that the security company warns and directs the company that will receive service.



In some cases, a member of the testing team may forget these rules because he is concentrating on something else. For this reason, it is not desirable for penetration tests to be performed by one person. If possible, it should be preferred to have at least two people. If the team consists of 3 people, task sharing and time planning will be more effective and productivity will increase. In this way, it will be possible for the other member to notice the rules and restrictions that are overlooked by one team member.



Complying with the Test Duration and Time Plan



How much of the total time planned for Penetration Testing is allocated to the Information Gathering phase? There may be tests that can and cannot be performed during this time. Some tests and analyses can take 1-2 months depending on their characteristics.



Tests that will go beyond the planned time mean an unplanned need for time and labor. This situation may impose an unplanned cost burden on the company receiving the service. It is very important to determine the tests to be performed according to the rules of engagement, the tests to be performed if time permits, and the tests that cannot be performed, and to give instructions to the test team.



For example, while network connection discovery of a server is being made, analyzing packets transmitted by a group of detected IP addresses may seem like a fast and effective decision at first. However, a failure or error that occurs during network discovery may also render other packet analysis processes useless. In this case, a process that will take a total of 5 hours will take longer due to the division and concentration of resources. This decision should be made by the test team leader based on past experiences.



The conclusion we will reach from here is that it is essential to plan time correctly from the very beginning during coordination. Planning a process that requires a total of 10 hours in 5 hours will be unrealistic and will also stress the test team.



Past experience has shown that 20% should be added to the total planned time for unforeseen delays. This 20% time precautionary measure may or may not be necessary, depending on the situation. If it is not used, it must be reported to the company receiving the service and deducted from the cost account. Otherwise, invoicing would not be ethical.



This time plan   should be clearly stated and put into writing in the Control Measures section, which is a sub-item of the Coordination phase, and in the Payment Method section under other topics.



Remembering the Ultimate Goal of the Test



During information collection, the ultimate purpose of the test should not be forgotten. These operations should be performed using tools that support the ultimate goal of the test.



Using software that will not contribute to the final goal will be a waste of time. Therefore, the question "How critical is the information to be collected in reaching the final goal?" should be taken into consideration at each step.

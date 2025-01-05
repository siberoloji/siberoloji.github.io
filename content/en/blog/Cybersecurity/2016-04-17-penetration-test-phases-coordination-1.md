---
draft: false
title: Penetration Test Phases (Coordination -1)
date: 2016-04-17T23:06:00+03:00
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
url: /penetration-test-phases-coordination-1/
featured_image: /images/cyber3.jpg
categories:
  - Cybersecurity
tags:
  - cybersecurity
---


What are the Penetration Testing Phases? In our article titled ( <a href="https://www.siberoloji.com/sizma-testi-safhalari-nelerdir/" target="_blank" rel="noreferrer noopener">see</a> ), we examined the general definition and content of the phases. In this article, we will look at Phase 1, Coordination, in detail.



In these articles we have prepared, we intend to examine the Penetration Testing processes within the relationship between the service provider and the customer. Preparing technical articles and HOW-TO documents for the Penetration Testing experts who perform the test will constitute the next stage of our project.



# Coordination



If a process is to be implemented, coordination is always required before the implementation phase. Coordination as an indispensable part of planning; It can be defined as the parties having a common understanding with each other and operating effective communication mechanisms. Using a common language with each other, working in harmony in terms of time and understanding the same thing when a topic is expressed, etc. Coordination and coordination measures with relevant meanings are determined and decided upon by the parties in the 1st Phase.



Coordination measures refer to measures that prevent the parties from concentrating on the same goal and deviating from the target for harmony and efficient work. For example, all scopes and agreed points such as the latest start time of a transaction, the latest completion time, the application or IP range to be examined can be considered as coordination measures.



The template below is a list prepared in light of the information gained through long experience. We are providing it here as a guide for coordination meetings. It is possible to expand or narrow it down as needed.



# Coordination Meeting Topics



## **Aim**



This is the part where the expectations and thoughts of the service recipient are shared with the company. It is revealed what the tests to be performed are and what thoughts will be used to carry out these tests. In this way, service company officials can understand the nature of the tests they will be responsible for and create the general framework in their minds.



As a result of the tests, the primary, secondary and final goals ( <a href="https://www.siberoloji.com/sizma-testi-safhalari-nelerdir/" target="_blank" rel="noreferrer noopener">see</a> ) to be achieved are determined. In some cases, it may be revealed that the tests to be performed are incompatible with each other and cannot be performed simultaneously. At this point, the service provider company may offer different suggestions as a consultancy service. As a result of all these meetings, the goals and objectives are determined and decided upon.



## **Scope**



This is the stage where it is clearly determined which systems the Penetration Test will cover in technical terms. In short, it is the determination of the details within the framework of the targets determined in the Purpose section. As a result of these details, the duration and labor requirements of the tests to be performed will also emerge.



Systems Subject to Test



The currently operational system has many layers and members. It should be determined exactly which of these systems will be tested. For example, whether the stock and accounting systems of the service recipient company will be included in the test or whether only the backup parts of these systems will be tested will be sufficient, etc. Topics are discussed. In general terms, the elements on the topology that are included or excluded from the scope are determined.



It is determined with precision which of the Network Test, Web Application Test, Wireless Systems Test, Physical Security Test, Social Engineering Test will be performed and which topology elements will be included in these tests.



You can find detailed questions about these tests, which will be the subject of application, in our article at this link ( <a href="https://www.siberoloji.com/sizma-testi-safhalari-nelerdir/">see</a> ).



Legal Restrictions and Permissions



After determining the systems subject to test, it is necessary to pay attention to whether there are legal restrictions on this issue. It should not be forgotten that it is necessary to act in accordance with the provisions of personal data protection, privacy of private life and other similar legal frameworks.



If the tests to be performed disrupt or disable another critical related system, there is a possibility of legal liability. If there are authorities that require prior permission, the steps to be taken for this are also determined at this point.



Frames and IP Ranges



In some cases, the infrastructure of the receiving company may be spread over a wide geographical area. Testing geographically dispersed systems from a single point may not be appropriate in terms of cost and scheduling. In such cases, tests can be divided into parts in time and space.



However, even if the area is not large, certain IP ranges in the system may be allocated for special purposes and communicate with limited clients. Since there will be traffic congestion in these limited communication channels, it is decided to exclude the tests or conduct them at a different time (for example, at night).



## **Coordination Measures**



The coordination measures to be decided are indispensable for the establishment and harmonious work of teams. It prevents the waste of resources and contributes to the establishment of unity of purpose. For this reason, it should be determined down to the smallest detail. A plan that takes into account past experiences also prevents possible disruptions.



Time Planning



In the light of the issues identified in the scope section, time planning of the process to be carried out is made. It is critical to plan the total time needed and divide this total time into parts and plan them step by step. To give you an idea, WHO? WHERE? WHEN? HOW? WHAT WILL HE DO? In the coordination processes where we seek answers to the questions WHEN? The question is answered and clarified.



Space and Security Planning



During the tests to be performed, the work areas of the assigned teams, their entrances and exits to the facilities, and their past security records (clearance) are discussed at this point. In addition, the social facilities and needs to be provided to the teams are determined at this stage.



The necessary permissions are determined to avoid any incompatibility between the security policies implemented by the service receiving party and the working procedures of the teams.



Communication Topics



During the planning and execution of the testing process, it is determined who both the management and the testing teams will be in contact with. Failure to communicate properly will cause disruptions and time planning may be interrupted. In order to prevent such undesirable situations from occurring, it is essential to establish an effective communication system and provide information to all parties.



There is a separate heading below for unusual situations that arise outside of normal communication needs during transactions.



Coordination with 3rd Parties



The systems of the receiving party may be receiving services from third party companies. For example, cloud systems, Internet service providers or security solution providers. In case of such a third party, coordination with them must be made. If necessary, a separate review should be made for the coordination of the parties in terms of time. In some cases, coordination deficiencies may occur due to time differences.



Social Engineering Topics



If there is a Social Engineering test among the tests determined in the scope article, the issues regarding this should be clarified. Issues such as the techniques to be used in social engineering tests or, if necessary, employee email lists should be decided.



Emergency Matters



Unwanted situations may occur during the tests. In such cases, it must be determined in advance how and to whom the incident will be reported. It should be determined which secure communication technique will be used for this reporting. If necessary, it is determined who will exchange public and private keys.



Although undesirable situations can be predicted to some extent in advance, not every possible possibility can be predicted. These situations may vary depending on the scope, size or physical structure of the company receiving service.



For example, a small command error can cause a Router to become unusable. In this case, reinstalling the device and keeping the installation software available can be considered among the measures that can be taken. In addition, it must be determined who will be notified and who will do this.



## **Other Topics**



Out of Scope Data



During all these tests, although efforts are made to stay within the specified framework, sometimes out-of-scope data may be obtained. What to do about this should be decided clearly and explicitly. For example, rules such as “only the file list will be recorded to prove that a system has been accessed, no photos will be taken from the webcam, no file downloads will be made” etc. should be determined.



Payment method



The payment method, the size of the activity to be carried out, the resource requirement and the coordination should be discussed and agreed upon between the parties at the end. The method generally followed is payment after the delivery of the final result report. If there is a long-term supply or service agreement between the parties, it may be decided that a certain percentage will be paid in advance and the rest will be paid after the report is delivered.



The topics we have tried to explain in general above are the content of the Coordination, which is the 1st Phase of the Penetration Testing activity. The topics mentioned here can be narrowed down and expanded. We hope that it has been guiding and informative for the parties who will receive and provide service. You can let us know your opinions and suggestions.

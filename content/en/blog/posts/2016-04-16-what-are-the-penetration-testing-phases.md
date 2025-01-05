---
draft: false

title:  'What are the Penetration Testing Phases?'
date: '2016-04-16T22:56:00+03:00'
author: İbrahim Korucuoğlu ([@siberoloji](https://github.com/siberoloji))
 
 
url:  /what-are-the-penetration-testing-phases/
 
featured_image: /images/cyber4.jpg
categories:
    - 'Cyber Security'
tags:
    - cybersecurity
---


Tests performed to determine the current status of the information system used and the precautions to be taken are called Penetration Tests. The process referred to as Penetration Testing consists of 7 stages. Although Penetration Test Phases are sometimes not clearly separated from each other, they also contain important differences in character.



It is generally accepted that there are 7 phases of the process to link planning and implementation to a certain procedure. There are also sources that express these stages as 5. We will base our work on 7 stages.



The topics mentioned as standard guide security companies as the service provider and provide control and audit opportunities to the service recipient. For this reason, the stages and details we will explain in our articles concern all parties of the penetration test.



You can review the Penetration Testing Phases list and their general definitions in the section below.



## **Penetration Test Phases**



**1. Coordination**



This phase aims to determine the purpose of the tests to be carried out and to determine which systems will be included in the test. It is the phase where the service recipient and provider parties ask mutual questions in order to understand each other's demands and capabilities and an agreement is reached on all discussed issues.



In the following stages, all necessary coordination is expected to be made and completed in the section called "Coordination" in order to avoid clogging up the process and experiencing delays. In addition to the questions of the party that will provide the Penetration Testing service regarding the system and scope, the party that will receive the service should also ask many questions and clarify them.



**2. Collecting Information**



Gathering information about the system or target to be Penetration Tested is the 2nd phase of the process. At this stage, information collection processes are generally divided into "active information collection" and "passive information collection". However, this distinction actually refers only to the types of information gathering based on the situation of communicating with the target.



The information gathering phase that we will describe here consists of 3 separate layers. The information obtained in each layer may have a meaning on its own, or it may be used as input for the next layer.


#### Layer 1



This layer is the part of information collection that is carried out through the fastest and most automatic programs. These automatic information gathering tools scan search engines and internet archives to produce results about the target.



It also includes investigating whether the target has certain standard information security policies and how well these standards are adhered to. This layer must be implemented in order to be able to say that the Information Gathering phase has been carried out.


#### Layer 2



In addition to the operations carried out in the 1st Layer, these are detailed information collection operations, especially those performed manually. It also includes information gathering methods and Open Source Intelligence that seek answers to specific questions. More details of physical location, address information and business relationships are examined.


#### Layer 3



These are detailed information gathering processes that may be required in very advanced penetration tests. This is a layer that is spread over a long period of time and where every possible technique is used. It is not required to be done in every penetration test. Information gathering for this layer is more relevant to the state level.



**3. Threat Modeling**



At this stage, the assets of the service recipient and the potential threats that may exist against these assets are analyzed. A method similar to the classical SWOT analysis approach can be followed. The important point here is to correctly identify the assets and their values ​​and correctly analyze the threats according to their importance.



One of the most important criteria is the probability of the threat occurring again and again. This is usually directly related to how indispensably the service recipient is attached to the supplier in terms of the systems they use.



As a result of all these analyses, threats and potential threats are revealed.



**4. Vulnerability Analysis**



It is related to the purpose of revealing the physical or logical vulnerabilities and weaknesses of the target system originating from programs. It is the phase of applying the trial and test methods to detect these vulnerabilities.



During the implementation, the restrictive rules determined during the coordination phase, which is the 1st phase, must be followed. It is essential to achieve the determined goals, taking into account time and opportunities.



For example: If our goal is to access the web server as an authorized user, we should try to detect vulnerabilities for this goal. During these efforts, the tester may encounter other vulnerabilities. Even if these are recorded for reporting, the main goal should not be deviated from.



**5. Login to the System**



The system entry phase is about using the entry point into the system by disabling the existing security measures as a result of the 4 previous phases.



If the vulnerability analysis and information gathering phases are carried out efficiently enough, this phase consists of the application of certain techniques. Because the information and analysis obtained have already revealed which vulnerabilities exist in the system in the previous stage. All that remains is to activate the application that exploits this vulnerability.



**6. Post-Entry Procedures**



The first purpose of this phase is to evaluate the information and value of the system to which access is provided.



How sensitive is the data stored on the system's disk? Is this system useful for accessing other systems? Can this system be used if it is necessary to provide persistence for the next step?



In addition to the answers we will give to all these questions, the rules and limits of the scope determined in the Coordination phase, which is the first phase, are very important.



**7. Reporting**



The findings and results obtained at the end of the Penetration Test Phases are presented to the service user in the form of a report. This report does not have a specific format. In fact, each company can produce its own unique report. Although there is no template restriction, the report should be expected to have certain features.



Generally, the first part is expected to contain an “Application Summary” that summarizes the subject and is free of technical details. The second part is the “Technical Report” that guides the technical staff who will carry out the necessary work. In this section, the operations carried out during all stages are reported with technical details. The identified vulnerabilities and their level of importance are expressed. Finally, the report is completed by including thoughts and recommendations in the conclusion section.



We will include the details of the stages that we have briefly explained in this article in our subsequent articles.

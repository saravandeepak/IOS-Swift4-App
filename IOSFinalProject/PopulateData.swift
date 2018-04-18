//
//  PopulateData.swift
//  IOSFinalProject
//
//  Created by Saravan Deepak on 4/14/18.
//  Copyright © 2018 Saravan Deepak. All rights reserved.
//

import Foundation

func populateInstructors() -> [Instructor] {
    var instructors:[Instructor] = []
    let i1 = Instructor()
    i1.name = "Khaled Bugrara"
    i1.title = "Information Systems Program Director"
    i1.about = "Kal Bugrara is an accomplished senior executive, change agent, and entrepreneur. He is acknowledged for ground- breaking software engineering techniques in driving large-scale IT projects that build organizational effectiveness and propel revenue growth. He is a professor with substantial graduate teaching experience and the chairman of a major IT program at the unique intersection of technology and business (an international program that he has transformed over the past 10 years into one of the best in the U.S.) in the College of Engineering at Northeastern University. He is also an accomplished administrator, a computer scientist, and software designer and architect. He has devoted the last ten years to the Atlas technology (with close to 1M lines of java code), a set of tools for re-engineering complex enterprise structures. Recently he has brought together his teaching, mentoring, conference talks, and research to focus specifically the development of Smart Contracts on top of Blockchain platforms."
    i1.imageString = "images/instructors/bugara-k.jpg"
    
    let i2 = Instructor()
    i2.name = "Yusuf Ozbek"
    i2.title = "Assistant Teaching Professor- Boston"
    i2.about = ""
    i2.imageString = "images/instructors/ozbek-y.jpg"
    
    let i3 = Instructor()
    i3.name = "Rabah Ahmed"
    i3.title = "Lecturer- Boston"
    i3.about = "Dr. Rabah Ahmed is a technology professional with over 22 years of experience in both managing projects and developing solutions. He acquired industrial experience through many development positions in Computer/Software Engineering fields, and academic experience through teaching positions at various institutions. He achieved expertise in OO, Client/Server applications, Multi-user and distributed applications, Enterprise Architecture, Business Process Modeling and Automation, mobile technology, and cross platform software development.His recent interests include the application of mobile computing and technology to health care services. Dr. Ahmed holds an M.S. and a Ph.D. in Computer Engineering from Boston University."
    i3.imageString = "images/instructors/ahmed-r.jpg"
    
    let i4 = Instructor()
    i4.name = "Vishal Chawla"
    i4.title = "Lecturer- Boston & Online"
    i4.about = "Vishal Chawla is a Senior Manager/Technical Team Lead at the MIT Lincoln Labs which is based in Lexington, MA. He leads a team of User Experience, Web Development, Application Development and Quality Assurance engineers in his current role. He has more than 17 year of experience in the field of technology and technical management. Along with that he has an interest in teaching technical courses at reputed university as he believes that the best way to learn is to teach. His teaching style is very practical, industry oriented that help student develop necessary skills that will help them succeed in their career."
    i4.imageString = "images/instructors/chawla-v.jpg"
    
    let i5 = Instructor()
    i5.name = "Julian Cooper"
    i5.title = "Lecturer- Boston"
    i5.about = "Julian Cooper has over 11 years in SecOps/TechOps/CloudOps/DevOps operations in varies industries, such as healthcare, financial, engineering, QSR and manufacturing. He holds an advanced degree in Management Engineering and holds certifications, such as CISSP, CISM, and CCSK. His current courses include IT auditing and network structures and cloud computing. His current research interests are in IT security."
    i5.imageString = "images/instructors/cooper-j.jpg"
    
    let i6 = Instructor()
    i6.name = "Robin Hillyard"
    i6.title = "Lecturer- Boston"
    i6.about = "Robin Hillyard has been a software innovator, developer, manager, and architect over a long career—he wrote his first program in 1967. He got his Ph.D. in Computer Science in 1978 from the University of Cambridge (UK), with a dissertation on dimensions and tolerances in computer-aided design. Since moving to the U.S. in 1979, he has worked in many different industries including, CAD, finance, eCommerce, and healthcare. Several of these positions were at startups, including two that he co-founded. Always fascinated by the expressiveness of computer languages for solving problems, Dr. Hillyard has become proficient in a wide range of languages from assembly language, BCPL, Algol68, Fortran, C, Perl, Java, to Scala and many others. A long-time proponent of unit testing, he wrote his first unit test suite (for assembly language) in 1972. Having developed perhaps the world’s first object-relational database, he has previously taught relational databases at Northeastern University. He has a patent pending concerning the use of reactive programming for healthcare information systems. Most recently, he has been involved with “big data” on a Hadoop platform using Spark, GraphX, Scala, Elastic Search and Zeppelin for the recognition of gaps in (health) care."
    i6.imageString = "images/instructors/hillyard-r.jpg"
    
    let i7 = Instructor()
    i7.name = "Sri Krishnamurthy"
    i7.title = "Lecturer- Boston"
    i7.about = "Sri Krishnamurthy teaches courses in Data Science, Visualization and Big Data Analytics. He has more than 15 years experience in analytics, quantitative analysis, statistical modeling and software development. He is also a quantitative specialist with significant experience in designing data mining and analytic systems for some of the world’s largest asset management companies. Sri is the founder of QuantUniversity.com, a data and quantitative analysis company. Sri has worked at MathWorks as a Computational Finance Consultant, Endeca (now Oracle) in their Analytics Group and at Citigroup in their Fixed-Income Group building large-scale analytical and trading systems."
    i7.imageString = "images/instructors/krishnamurthy-s.jpg"
    
    let i8 = Instructor()
    i8.name = "Tricia McConville"
    i8.title = "Lecturer- Boston"
    i8.about = "Tricia McConville, EdD 2016 candidate and MBA, is Associate Dean of Graduate & Continuing Studies at Curry College in Milton, MA. In her role, Tricia is responsible for new program development, outreach, and supporting faculty in the use of technology in teaching and learning. Two years ago, Tricia left Northeastern’s School of Business where she was Executive Director of Online Learning & Educational Technologies for almost three years. Previously, she was Director of Learning & Development for the IT Division of the Commonwealth of Massachusetts. And, before that, she was engaged as Learning & Development Project Manager at Fidelity for a large-scale, technology-driven change effort, the implementation of an enterprise-wide talent planning system. Tricia has spent more than twenty years in the field of leadership, management, and organizational development both as a direct manager and consultant. Internally and externally, she has worked with a variety of organizations ranging from large Fortune 500 companies to smaller non-profits. Tricia worked with all levels of management—from executive to supervisory—in solving business problems. Representative organizations include Fidelity, EMC, Hewlett Packard, Ernst & Young, Citicorp, American Airlines, Verizon, and Digital Equipment."
    i8.imageString = "images/instructors/mcconville-t.jpg"
    
    let i9 = Instructor()
    i9.name = "Rick Sherman"
    i9.title = "Lecturer- Boston & Online"
    i9.about = "Rick Sherman is the founder of Athena IT Solutions. Rick has 30 years of business intelligence (BI), data warehousing (DW) and data integration experience. He has worked on over 50 BI/DW implementations across many industries and from large enterprises to small-to medium businesses (SMB.) In addition, he has provided guidance through assessments and in an advisory role for dozens of other enterprises. Rick is an expert instructor and speaker at numerous conferences, webinars and seminars. He teaches business and IT people BI/DW concepts, design, architectures and project management through onsite training. He teaches BI/DW courses at Northeastern University's Graduate School of Engineering. Morgan Kaufmann published his book The Data Doghouse."
    i9.imageString = "images/instructors/sherman-r.jpg"
    
    let i10 = Instructor()
    i10.name = "Dino Konstantopoulos"
    i10.title = "Lecturer- Boston"
    i10.about = "Dino Konstantopoulos is a Lecturer in the Information Systems Program at Northeastern University.  He has been teaching in the program since Spring 2016. Dino is also a Software Engineer with a Federally Funded Research and Development Center (FFRDC) applying systems engineering and Information Technology to critical national problems, where Dino has worked with the Air Force, the ARMY, the Internal Revenue Service, the Veterans Administration, and the Centers for Medicaid and Medicare. Dino has also worked at Xerox Corporation and as a postdoc at MIT’s Nuclear Engineering department. Dino received his Bachelors of Science from Joseph Fourier University in Grenoble and his Doctorate in Aerospace Engineering from Boston University. Dino tries to maintain a balance between the server-side and the Cloud where there is deep thinking going on, and the client side where there is artistry and passion behind user interface development. Dino’s research interests are patterns in large graphs, monads and matroids, elliptic curves from a Taniyama-Shimura perspective, Recursive Neural Networks, and prime numbers. Dino is an avid sculler and can be found rowing most mornings on the Charles River in Boston."
    i10.imageString = "images/instructors/konstantopoulos-d.jpg"
    
    let i11 = Instructor()
    i11.name = "Mieczyslaw Kokar"
    i11.title = "Affiliated Faculty"
    i11.about = "Professor Kokar technical research interests include Information Fusion, Software Engineering, Ontology-Based Computing, and Modeling Languages. In particular, he is interested in higher-level information fusion and situation awareness, ontology-based software radios, the specification and design of self-controlling software using the control theory metaphor, ontology development, ontological annotation of information, logical reasoning about OWL annotated information, consistency checking, formalization of the UML language, consistency checking of UML models vs. UML Metamodel and of UML Metamodel vs. MOF. Dr. Kokar teaches various graduate courses in software engineering, formal methods and artificial intelligence. He has an M.S. and a Ph.D. in computer systems engineering from Wroclaw University of Technology, Poland. He is a senior member of the IEEE and member of the ACM."
    i11.imageString = "images/instructors/kokar-m_0.jpg"
    
    instructors.append(i1)
    instructors.append(i2)
    instructors.append(i3)
    instructors.append(i4)
    instructors.append(i5)
    instructors.append(i6)
    instructors.append(i7)
    instructors.append(i8)
    instructors.append(i9)
    instructors.append(i10)
    instructors.append(i11)
    
    return instructors
    
}

func populateCourses () -> [Course] {
    var courses:[Course] = []
    
    let i1 = Instructor()
    i1.name = "Khaled Bugrara"
    i1.title = "Information Systems Program Director"
    i1.about = "Kal Bugrara is an accomplished senior executive, change agent, and entrepreneur. He is acknowledged for ground- breaking software engineering techniques in driving large-scale IT projects that build organizational effectiveness and propel revenue growth. He is a professor with substantial graduate teaching experience and the chairman of a major IT program at the unique intersection of technology and business (an international program that he has transformed over the past 10 years into one of the best in the U.S.) in the College of Engineering at Northeastern University. He is also an accomplished administrator, a computer scientist, and software designer and architect. He has devoted the last ten years to the Atlas technology (with close to 1M lines of java code), a set of tools for re-engineering complex enterprise structures. Recently he has brought together his teaching, mentoring, conference talks, and research to focus specifically the development of Smart Contracts on top of Blockchain platforms."
    i1.imageString = "images/instructors/bugara-k.jpg"
    
    let i2 = Instructor()
    i2.name = "Yusuf Ozbek"
    i2.title = "Assistant Teaching Professor- Boston"
    i2.about = ""
    i2.imageString = "images/instructors/ozbek-y.jpg"
    
    let i3 = Instructor()
    i3.name = "Rabah Ahmed"
    i3.title = "Lecturer- Boston"
    i3.about = "Dr. Rabah Ahmed is a technology professional with over 22 years of experience in both managing projects and developing solutions. He acquired industrial experience through many development positions in Computer/Software Engineering fields, and academic experience through teaching positions at various institutions. He achieved expertise in OO, Client/Server applications, Multi-user and distributed applications, Enterprise Architecture, Business Process Modeling and Automation, mobile technology, and cross platform software development.His recent interests include the application of mobile computing and technology to health care services. Dr. Ahmed holds an M.S. and a Ph.D. in Computer Engineering from Boston University."
    i3.imageString = "images/instructors/ahmed-r.jpg"
    
    let i4 = Instructor()
    i4.name = "Vishal Chawla"
    i4.title = "Lecturer- Boston & Online"
    i4.about = "Vishal Chawla is a Senior Manager/Technical Team Lead at the MIT Lincoln Labs which is based in Lexington, MA. He leads a team of User Experience, Web Development, Application Development and Quality Assurance engineers in his current role. He has more than 17 year of experience in the field of technology and technical management. Along with that he has an interest in teaching technical courses at reputed university as he believes that the best way to learn is to teach. His teaching style is very practical, industry oriented that help student develop necessary skills that will help them succeed in their career."
    i4.imageString = "images/instructors/chawla-v.jpg"
    
    let i5 = Instructor()
    i5.name = "Julian Cooper"
    i5.title = "Lecturer- Boston"
    i5.about = "Julian Cooper has over 11 years in SecOps/TechOps/CloudOps/DevOps operations in varies industries, such as healthcare, financial, engineering, QSR and manufacturing. He holds an advanced degree in Management Engineering and holds certifications, such as CISSP, CISM, and CCSK. His current courses include IT auditing and network structures and cloud computing. His current research interests are in IT security."
    i5.imageString = "images/instructors/cooper-j.jpg"
    
    let i6 = Instructor()
    i6.name = "Robin Hillyard"
    i6.title = "Lecturer- Boston"
    i6.about = "Robin Hillyard has been a software innovator, developer, manager, and architect over a long career—he wrote his first program in 1967. He got his Ph.D. in Computer Science in 1978 from the University of Cambridge (UK), with a dissertation on dimensions and tolerances in computer-aided design. Since moving to the U.S. in 1979, he has worked in many different industries including, CAD, finance, eCommerce, and healthcare. Several of these positions were at startups, including two that he co-founded. Always fascinated by the expressiveness of computer languages for solving problems, Dr. Hillyard has become proficient in a wide range of languages from assembly language, BCPL, Algol68, Fortran, C, Perl, Java, to Scala and many others. A long-time proponent of unit testing, he wrote his first unit test suite (for assembly language) in 1972. Having developed perhaps the world’s first object-relational database, he has previously taught relational databases at Northeastern University. He has a patent pending concerning the use of reactive programming for healthcare information systems. Most recently, he has been involved with “big data” on a Hadoop platform using Spark, GraphX, Scala, Elastic Search and Zeppelin for the recognition of gaps in (health) care."
    i6.imageString = "images/instructors/hillyard-r.jpg"
    
    let i7 = Instructor()
    i7.name = "Sri Krishnamurthy"
    i7.title = "Lecturer- Boston"
    i7.about = "Sri Krishnamurthy teaches courses in Data Science, Visualization and Big Data Analytics. He has more than 15 years experience in analytics, quantitative analysis, statistical modeling and software development. He is also a quantitative specialist with significant experience in designing data mining and analytic systems for some of the world’s largest asset management companies. Sri is the founder of QuantUniversity.com, a data and quantitative analysis company. Sri has worked at MathWorks as a Computational Finance Consultant, Endeca (now Oracle) in their Analytics Group and at Citigroup in their Fixed-Income Group building large-scale analytical and trading systems."
    i7.imageString = "images/instructors/krishnamurthy-s.jpg"
    
    let i8 = Instructor()
    i8.name = "Tricia McConville"
    i8.title = "Lecturer- Boston"
    i8.about = "Tricia McConville, EdD 2016 candidate and MBA, is Associate Dean of Graduate & Continuing Studies at Curry College in Milton, MA. In her role, Tricia is responsible for new program development, outreach, and supporting faculty in the use of technology in teaching and learning. Two years ago, Tricia left Northeastern’s School of Business where she was Executive Director of Online Learning & Educational Technologies for almost three years. Previously, she was Director of Learning & Development for the IT Division of the Commonwealth of Massachusetts. And, before that, she was engaged as Learning & Development Project Manager at Fidelity for a large-scale, technology-driven change effort, the implementation of an enterprise-wide talent planning system. Tricia has spent more than twenty years in the field of leadership, management, and organizational development both as a direct manager and consultant. Internally and externally, she has worked with a variety of organizations ranging from large Fortune 500 companies to smaller non-profits. Tricia worked with all levels of management—from executive to supervisory—in solving business problems. Representative organizations include Fidelity, EMC, Hewlett Packard, Ernst & Young, Citicorp, American Airlines, Verizon, and Digital Equipment."
    i8.imageString = "images/instructors/mcconville-t.jpg"
    
    let i9 = Instructor()
    i9.name = "Rick Sherman"
    i9.title = "Lecturer- Boston & Online"
    i9.about = "Rick Sherman is the founder of Athena IT Solutions. Rick has 30 years of business intelligence (BI), data warehousing (DW) and data integration experience. He has worked on over 50 BI/DW implementations across many industries and from large enterprises to small-to medium businesses (SMB.) In addition, he has provided guidance through assessments and in an advisory role for dozens of other enterprises. Rick is an expert instructor and speaker at numerous conferences, webinars and seminars. He teaches business and IT people BI/DW concepts, design, architectures and project management through onsite training. He teaches BI/DW courses at Northeastern University's Graduate School of Engineering. Morgan Kaufmann published his book The Data Doghouse."
    i9.imageString = "images/instructors/sherman-r.jpg"
    
    let i10 = Instructor()
    i10.name = "Dino Konstantopoulos"
    i10.title = "Lecturer- Boston"
    i10.about = "Dino Konstantopoulos is a Lecturer in the Information Systems Program at Northeastern University.  He has been teaching in the program since Spring 2016. Dino is also a Software Engineer with a Federally Funded Research and Development Center (FFRDC) applying systems engineering and Information Technology to critical national problems, where Dino has worked with the Air Force, the ARMY, the Internal Revenue Service, the Veterans Administration, and the Centers for Medicaid and Medicare. Dino has also worked at Xerox Corporation and as a postdoc at MIT’s Nuclear Engineering department. Dino received his Bachelors of Science from Joseph Fourier University in Grenoble and his Doctorate in Aerospace Engineering from Boston University. Dino tries to maintain a balance between the server-side and the Cloud where there is deep thinking going on, and the client side where there is artistry and passion behind user interface development. Dino’s research interests are patterns in large graphs, monads and matroids, elliptic curves from a Taniyama-Shimura perspective, Recursive Neural Networks, and prime numbers. Dino is an avid sculler and can be found rowing most mornings on the Charles River in Boston."
    i10.imageString = "images/instructors/konstantopoulos-d.jpg"
    
    let i11 = Instructor()
    i11.name = "Mieczyslaw Kokar"
    i11.title = "Affiliated Faculty"
    i11.about = "Professor Kokar technical research interests include Information Fusion, Software Engineering, Ontology-Based Computing, and Modeling Languages. In particular, he is interested in higher-level information fusion and situation awareness, ontology-based software radios, the specification and design of self-controlling software using the control theory metaphor, ontology development, ontological annotation of information, logical reasoning about OWL annotated information, consistency checking, formalization of the UML language, consistency checking of UML models vs. UML Metamodel and of UML Metamodel vs. MOF. Dr. Kokar teaches various graduate courses in software engineering, formal methods and artificial intelligence. He has an M.S. and a Ph.D. in computer systems engineering from Wroclaw University of Technology, Poland. He is a senior member of the IEEE and member of the ACM."
    i11.imageString = "images/instructors/kokar-m_0.jpg"
    
    let course1 = Course()
    course1.code = "INFO 5100"
    course1.name = "Application Engineering and Development"
    course1.description = "Covers the basics of Java programming such as arrays, control structures, class definitions, class hierarchies, inheritance, objects, streams, constructors, collections, and GUI components. Describes how to develop and execute Java applications and incorporates several programming projects, which strengthen the understanding of object-based and event-driven programming. Provides the student with the opportunity to achieve a strong working competency in object-oriented programming using the Java programming language."
    course1.instructor = i1
    course1.credits = 4.0
    course1.level = "Graduate"
    course1.type = "Lecture"
    course1.rating = 0.0
    course1.noOfRatings = 0
    
    let course2 = Course()
    course2.code = "INFO 6150"
    course2.name = "Web Design and User Experience Engineering"
    course2.description = "Exposes students to both conceptual and technical aspects of Web design. User experience design is the discipline of creating a useful and usable website or application that is easily navigated and meets the needs of both the site owner and its users. Covers Web standards and best practices. Studies the fundamental concepts, techniques, practices, work flows, and tools associated with the practice of user-experience design in Web interfaces. Offers students an opportunity to learn the core principles of information architecture, usability, marketing hierarchy, and user experience for contextual, value-driven websites. Additional areas of focus include typography, color theory and composition, responsive design, CSS3 concepts, basic scripting, and JavaScript libraries to create functional, effective, and visually appealing websites."
    course2.instructor = i4
    course2.credits = 4.0
    course2.level = "Graduate"
    course2.type = "Lecture"
    course2.rating = 0.0
    course2.noOfRatings = 0
    
    let course3 = Course()
    course3.code = "INFO 6205"
    course3.name = "Program Structure and Algorithms"
    course3.description = "Presents data structures and related algorithms, beginning with a brief review of dynamic memory allocation. Discusses the fundamental data structures in detail, including the abstract representation, supporting algorithms, and implementation methods. Focuses on understanding the application of the abstract data structure and the circumstances that affect implementation decisions. Covers lists, stacks, queues, trees, hash tables, and graphs. Covers recursion and searching and sorting algorithms in detail. Emphasizes data abstraction and encapsulation in code design. Explores external storage structures, time permitting."
    course3.instructor = i4
    course3.credits = 4.0
    course3.level = "Graduate"
    course3.type = "Lecture"
    course3.rating = 0.0
    course3.noOfRatings = 0
    
    let course4 = Course()
    course4.code = "INFO 6210"
    course4.name = "Data Management and Database Design"
    course4.description = "Studies design of information systems from a data perspective for engineering and business applications; data modeling, including entity-relationship (E-R) and object approaches; user-centric information requirements and data sharing; fundamental concepts of database management systems (DBMS) and their applications; alternative data models, with emphasis on relational design; SQL; data normalization; data-driven application design for personal computer, server-based, enterprisewide, and Internet databases; and distributed data applications."
    course4.instructor = i2
    course4.credits = 4.0
    course4.level = "Graduate"
    course4.type = "Lecture"
    course4.rating = 0.0
    course4.noOfRatings = 0
    
    let course5 = Course()
    course5.code = "INFO 6250"
    course5.name = "Web Development Tools and Methods"
    course5.description = "Explores advanced server-side technologies and tools necessary to design and engineer complete web-based enterprise applications quickly. Designed to build on previous experience to cover the life cycle of a web-based application. Focuses on MVC web development frameworks to build server-side, data-intensive, and multitier web applications. Additionally, discusses designing rich internet applications (RIA) using AJAX and service-oriented architecture (SOA) using REST."
    course5.instructor = i2
    course5.credits = 4.0
    course5.level = "Graduate"
    course5.type = "Lecture"
    course5.rating = 0.0
    course5.noOfRatings = 0
    
    let course6 = Course()
    course6.code = "INFO 6350"
    course6.name = "Smartphones-Based Web Development"
    course6.description = "Covers application development for mobile devices using advanced development platforms. Focuses on how to write mobile applications using cross-platform development tools and processes. Topics include user interfaces, the software life cycle, persistent storage, networking using HTTP and other REST interfaces, and mobile/handheld data applications. Requires a final project."
    course6.instructor = i3
    course6.credits = 4.0
    course6.level = "Graduate"
    course6.type = "Lecture"
    course6.rating = 0.0
    course6.noOfRatings = 0
    
    let course7 = Course()
    course7.code = "INFO 7275"
    course7.name = "Advanced Database Management Systems"
    course7.description = "Introduces the skill set required to become a serious database applications developer. Offers an overview of the Oracle9i object-relational database system for those who have mastered the fundamental principles of database design and are competent with basic SQL. Gives students the opportunity to develop a strong understanding of the PL/SQL programming language, which is used to create triggers, user-generated functions, stored procedures, and packages for programming Oracle objects. Emphasizes advanced SQL features and Oracle-specific SQL enhancements. Covers optimization and tuning issues. Covers corresponding material for Transact-SQL (used for Microsoft SQL Server and Sybase database systems) as time and resources permit."
    course7.instructor = i2
    course7.credits = 4.0
    course7.level = "Graduate"
    course7.type = "Lecture"
    course7.rating = 0.0
    course7.noOfRatings = 0
    
    let course8 = Course()
    course8.code = "INFO 7285"
    course8.name = "Organizational Change and IT"
    course8.description = "Focuses on the change effort needed to integrate a project into the firm’s organizational structure, culture, business, and process metrics. Geared for students undertaking enterprise resource planning systems, or those involved in small or large organizational reengineering projects designed to make IT a primary focus of the firm’s business strategy. Topics include management theories and organizational design principles; strategy and critical success factor formulation; methods to reach information systems maturity; business process modeling techniques; quality, the mindset, and the problem-solving tools; human resource, cultural, and technical change enablers; how to plan a business reengineering project; and implementation of major organizational change."
    course8.instructor = i8
    course8.credits = 4.0
    course8.level = "Graduate"
    course8.type = "Lecture"
    course8.rating = 0.0
    course8.noOfRatings = 0
    
    let course9 = Course()
    course9.code = "INFO 7390"
    course9.name = "Advances in Data Sciences and Architecture"
    course9.description = "Covers a wide range of skills and responsibilities that are necessary for managing complex business performance and operational data. Such data tend to be fragmented, poorly organized, and often flawed. Offers students an opportunity to learn how a more up-to-date mapping of complex data works and to be alerted to the care and attention they must give to such a task as well as the implications of the results. Covers best practices for managing all aspects of the data transformation life cycle, covering broad areas such as requirements gathering, meta-model design, data integration and transformation, as well as implementation and ongoing operations. Discusses tools for mapping fragmented data into business intelligence solutions that guide successful strategies."
    course9.instructor = i7
    course9.credits = 4.0
    course9.level = "Graduate"
    course9.type = "Lecture"
    course9.rating = 0.0
    course9.noOfRatings = 0
    
    let course10 = Course()
    course10.code = "INFO 7325"
    course10.name = "Introduction to Information Technology Auditing"
    course10.description = "Designed to provide a foundation for the study and professional career development of information technology (IT) auditing. Introduces the fundamentals of IT auditing, core reasons why this is a specialized area of auditing, and the principle objectives of IT auditing and its relationship to integrated financial or operational auditing. Offers an insight into management‘s objectives regarding IT risk management. Uses the Cobit governance and control framework to emphasize management issues regarding control of IT and the achievement of value through managed IT processes. Introduces three primary types of IT audits: the audits of computerized information systems, IT processing environments, and the process of developing and implementing information systems."
    course10.instructor = i5
    course10.credits = 4.0
    course10.level = "Graduate"
    course10.type = "Lecture"
    course10.rating = 0.0
    course10.noOfRatings = 0
    
    let course11 = Course()
    course11.code = "INFO 7250"
    course11.name = "Engineering of Big-Data Systems"
    course11.description = "Introduces a general framework for thinking about big data. Services such as Web analytics and intelligent e-commerce have promoted a rapid increase in the volume of data generated, analyzed, and archived. In order to solve the problems related to big data, a newer type of database product has emerged. Covers how to apply technologies like Hadoop, Accumulo, MongoDB, and various NoSQL databases to build simple, robust, and efficient systems to manage and analyze big data. Also describes an easy approach to big data systems that can be built and run by a small team of students. Guides students through the theory of big data systems, how to implement them in practice, and how to deploy and operate them once they are built."
    course11.instructor = i10
    course11.credits = 4.0
    course11.level = "Graduate"
    course11.type = "Lecture"
    course11.rating = 0.0
    course11.noOfRatings = 0
    
    let course12 = Course()
    course12.code = "CSYE 7215"
    course12.name = "Foundations of Parallel and Multithreaded Programming"
    course12.description = "Covers all aspects of concurrent program design, development, and implementation utilizing the Java multithreading API/facilities. Topics covered include thread safety and lifetime issues, block structured versus explicit synchronization, intrinsic versus explicit locking, thread pools, liveness issues, deadlock, livelock, race conditions, atomicity, performance and scalability, execution policies, test strategies. Major Java multithreading API/facilities covered include synchronized blocks, wait sets, intrinsic locks and condition variables, synchronized and concurrent collections, executor framework. Comparisons between the Java multithreading API and the Posix Pthreads multithreading standard are provided."
    course12.instructor = i11
    course12.credits = 4.0
    course12.level = "Graduate"
    course12.type = "Lecture"
    course12.rating = 0.0
    course12.noOfRatings = 0
    
    let course13 = Course()
    course13.code = "CSYE 7200"
    course13.name = "Big-Data System Engineering Using Scala"
    course13.description = "Covers the fundamentals of functional programming with Scala and seeks to provide a basic, practical foundation for students who want to use it as a language for working with big-data platforms. Scala is one of a new breed of general-purpose functional programming languages that is strongly typed and is object oriented. It runs on the Java virtual machine and is able to share libraries from the vast collection of open-source projects written in Java. For these reasons it is readily accessible by programmers of Java, C++, and similar languages."
    course13.instructor = i6
    course13.credits = 4.0
    course13.level = "Graduate"
    course13.type = "Lecture"
    course13.rating = 0.0
    course13.noOfRatings = 0
    
    let course14 = Course()
    course14.code = "CSYE 7280"
    course14.name = "User Experience Design and Testing"
    course14.description = "Introduces user experience concepts while working on Web design projects. Offers students an opportunity to build the necessary skill sets to make better decisions when designing contemporary websites that cater to customer needs. Students practice interview techniques to understand user requirements while keeping user experience central to the effort. Uses wireframes and user scenarios to drive the creative design process. Various case studies are introduced and discussed in team settings to emphasize user perspectives. Uses quality assurance and usability testing to drive validation and user-acceptance testing and approvals."
    course14.instructor = i4
    course14.credits = 4.0
    course14.level = "Graduate"
    course14.type = "Lecture"
    course14.rating = 0.0
    course14.noOfRatings = 0
    
    courses.append(course1)
    courses.append(course2)
    courses.append(course3)
    courses.append(course4)
    courses.append(course5)
    courses.append(course6)
    courses.append(course7)
    courses.append(course8)
    courses.append(course9)
    courses.append(course10)
    courses.append(course11)
    courses.append(course12)
    courses.append(course13)
    courses.append(course14)
    
    return courses
}

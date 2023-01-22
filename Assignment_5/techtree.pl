course(ml):-
    writeln('------------------Machine Learning----------------'),
    writeln('Course Code: CSE343'),
    writeln('Credits: 4'),
    writeln('Course Description: This is an introductory course on Machine Learning (ML) that is offered to undergraduate and graduate students. The contents are designed to cover both theoretical and practical aspects of several well-established ML techniques. The assignments will contain theory and programming questions that help strengthen the
theoretical foundations as well as learn how to engineer ML solutions to work on simulated and publicly available real datasets. The project(s) will require students to develop a complete Machine Learning solution requiring preprocessing, design of the classifier/regressor, training and validation, testing and evaluation with quantitative performance comparisons.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE343').

course(aml):-
    writeln('------------------Advanced Machine Learning----------------'),
    writeln('Course Code: CSE642'),
    writeln('Credits: 4'),
    writeln('Course Description: This is an advanced course on Machine Learning. It is intended for senior undergraduate and graduate students who already have background in ML. The course is designed as a set of special topics that will be covered through research papers and books. The course will focus on a combination of theory, algorithms and modeling along with providing a perspective of real-world applications.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE642').

course(dl):-
    writeln('------------------Deep Learning----------------'),
    writeln('Course Code: CSE641'),
    writeln('Credits: 4'),
    writeln('Course Description: Recent advances in machine learning and specifically deep learning techniques have made it a popular and often a default option in many problem domains. The objective of this course is to introduce students through some of the latest techniques in deep learning. The focus of the course will be hands on and the students should be able to design intelligent deep learning systems for solving the problems in the area of their interests. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE641').

course(sml):-
    writeln('------------------Statistical Machine Learning----------------'),
    writeln('Course Code: CSE342/542'),
    writeln('Credits: 4'),
    writeln('Course Description: This course will introduce students to salient topics in machine learning and pattern classification. Fundamentals and advanced theoretical and mathematical concepts related to classification techniques and learning paradigms will be discussed. The programming assignments will provide hands-on experience of implementing some of these techniques. The project component of this course will test the student\'s ability to design, apply, and evaluate classifiers on appropriate datasets. The application domain for the projects will be from diverse areas such as object recognition, handwritten character recognition, and emotion recognition. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE342').

course(nlp):-
    writeln('------------------Natural Language Processing----------------'),
    writeln('Course Code: CSE556'),
    writeln('Credits: 4'),
    writeln('Course Description:  This course will cover a broad range of topics related to NLP, including basic text processing (such as tokenization, stemming), language modeling, morphology, syntax, dependency parsing, distributional and lexical Semantics, sense disambiguation, information extraction etc. We will also introduce underlying theory from probability, statistics, machine learning that are essential to understand fundamental algorithms in NLP such as language modeling, HMM etc. This course will end with more advanced topics in NLP such as stylometry analysis, sentiment analysis, named-entity disambiguation, machine translation etc. The term projects will provide opportunity to the students to get hands-on experience on designing different real-world NLP models.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE556').

course(cv):-
    writeln('------------------Computer Vision----------------'),
    writeln('Course Code: CSE344/544, ECE344/544'),
    writeln('Credits: 4'),
    writeln('Course Description:  This is an introductory course on Computer Vision offered to undergraduate and graduate students. The goal is to develop understanding of the fundamental concepts in computer vision and enable students to understand and develop applications using existing tools. Students will be given theoretical and programming assignments targeted towards solving real-world computer vision problems. Groups of two or three will do a course project and show a demonstration at the end of the semester.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE344').

course(acv):-
    writeln('------------------Advanced Computer Vision----------------'),
    writeln('Course Code: CSE562'),
    writeln('Credits: 4'),
    writeln('Course Description: This course will cover advanced topic in computer vision. We will examine data sources, features, and learning algorithms useful for understanding and manipulating visual data. The emphasis will be on scalability issues as well as acquiring the knowhow to work on interdisciplinary problems. The goal of this course is to give students the background and skills necessary to perform research in computer vision and its application domains such as robotics, healthcare, and forensics. Students should understand the strengths and weaknesses of current approaches to research problems and identify interesting open questions and future research directions. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE562').

course(fpp):-
    writeln('------------------Foundation of Parallel Programming----------------'),
    writeln('Course Code: CSE502'),
    writeln('Credits: 4'),
    writeln('Course Description: Constrained by the heat and power usage, today all computing devices are composed of multicore processors, with little or no increase in clock speed per core. In order to harness the power of the multicore processors, software applications being developed also needs to be parallelized. This makes parallel programming a very important paradigm of computing.This course introduces the fundamentals of parallel programming. It will cover both traditional approaches and new advancements in the area of parallel programming. A key aim of this course is to provide hands-on knowledge on parallel programming by writing parallel programs in different programming models taught in this course. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE502').

course(prmp):-
    writeln('----------------Parallel Runtimes in Modern Processors---------------'),
    writeln('Course Code: CSE513'),
    writeln('Credits: 4'),
    writeln('Course Description: Computing hardware is becoming more and more complex. Today and in the foreseeable future, performance will be delivered principally by increased hardware parallelism. Modern multicore processors scale to over one hundred cores, have wide vector units, maintain a complex memory hierarchy and even share the memory with accelerators such as GPU. Conventional programming models using threads impose significant complexity to organize code into multiple threads of control and balance work amongst threads to ensure proper utilization of computing resources. This shortcoming has helped the advent of parallel runtimes that assist the programmer by efficiently scheduling the parallel tasks over available resources. This course introduces the design and implementation of such a parallel runtime and explores the challenges in achieving performance and energy efficiency over modern processors.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE513').


course(dm):-
    writeln('------------------Data Mining----------------'),
    writeln('Course Code: CSE506'),
    writeln('Credits: 4'),
    writeln('Course Description:  Data mining aims at finding the useful patterns in large data sets. Interest in the field is motivated by the growth of computerized data collection due to ubiquity of Internet enabled devices. This course will cover a set of techniques designed to be used for finding interesting patterns from the data. The techniques include classification, clustering, association rule minin and sequence mining. Students will learn and use the open source R statistical software, see http://www.r-project.org, and machine learning packages such as Weka in this course.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE506').

course(dpm):-
    writeln('------------------Data Processing and Management----------------'),
    writeln('Course Code: ECE560'),
    writeln('Credits: 4'),
    writeln('Course Description: This main objective of this course is to train Mtech students in ECE, specially the CSP and CPS students, to be able to code end to end systems in Python. The course will fulfill a key gap that was highlighted during our interactions with industry and past students on increasing the ability of students to code what they learn during the Mtech program. The course will cover basics of Python, databases, data management methods and packages that include Pandas, SQLalchemy etc. Finally, the course will also cover tools and methods related to devops and end to end applications deployment, preferably through Jupyter notebooks and or flask frameworks. The course will be mainly hands on with assignments every week that will culminate in a sufficiently large and deployable project at the end of the semester. The students should be able to complement this course with their research interests in signal processing and machine learning so that they can code and test simple algorithms rapidly.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=ECE560').


course(ds):-
    writeln('------------------Data Science----------------'),
    writeln('Course Code: CSE558'),
    writeln('Credits: 4'),
    writeln('Course Description: Data science, being an interdisciplinary subject interface with computer science, statistics, machine learning and science of data visualization. This course is designed to enable students to perform exploratory data analysis employing statistical methods and visualization tools. In this course, students will learn to manage and analyze data. They will also learn to use regression techniques to discover and interpret intrinsic patterns in data of various types. Finally, students learn to build custom softwares and web-servers for data analysis. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE558').

course(cn):-
    writeln('------------------Computer Networks----------------'),
    writeln('Course Code: CSE232'),
    writeln('Credits: 4'),
    writeln('Course Description: This course teaches the standard layers in network, circuit and packet switching, protocols at the link layer, routing algorithms, TCP/IP protocol, and new challenges in wireless networks.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE232').

course(ns):-
    writeln('------------------Network Security----------------'),
    writeln('Course Code: CSE350/ECE350'),
    writeln('Credits: 4'),
    writeln('Course Description: The course on Network Security covers essentials of symmetric-key cryptosystems based on block ciphers (such as DES, AES), stream ciphers (such as RC4), public-key cryptosystems based on RSA and ElGamal, key management (including PKI and Certification), message authentication and digital signatures. Applications of these cryptosystems to securing Wi-Fi networks, Email systems, virtual private networks, or providing authentication & message integrity within an organization based on Kerberos or at Transport-layer while access the Web. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE350').

course(wn):-
    writeln('------------------Wireless Networks----------------'),
    writeln('Course Code: CSE538/ECE538 '),
    writeln('Credits: 4'),
    writeln('Course Description: This course will cover a variety of mobile systems (wireless LANs, cellular systems, and sensor networks). This course will cover design of various layers in the network stack in the context of wireless communication. This course will cover challenges in mobile systems. '),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=CSE538').

course(me):-
    writeln('------------------MicroEconomics----------------'),
    writeln('Course Code: ECO301'),
    writeln('Credits: 4'),
    writeln('Course Description: The aim of the course is to deliver thorough understanding of the core concepts and methods of microeconomics. We will analyse the way in which the market system functions as a mechanism for coordinating the independent choices of individual economic agents. The course will develop a basis for evaluating the efficiency and equity implications of competition and other market structures, and a perspective on the appropriate role of government. Included areas are the study of consumer choice, production and cost theory, market structure, and market failure. Students will develop their understanding of economic models specified in standard mathematical terms. Towards the end of the course, students will be able to assess the real microeconomic situations using the tools learnt in the course.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=ECO301').

course(econ):-
    writeln('------------------Econometrics 2----------------'),
    writeln('Course Code: ECO322/522'),
    writeln('Credits: 4'),
    writeln('Course Description: This course will provide training in advanced applied econometrics through two (broad) modules: A) Panel Data Analysis; and B) Microeconometrics.
Panel data (or longitudinal data) run over time and for different observation units like individuals, households, firms, regions, countries, etc. The repeated nature of the individual-level data enables more realistic econometric modeling (e.g., incorporating dynamics at the individual level); more robust estimation methods (e.g., controlling for unobserved heterogeneity) and more powerful statistical inference procedures (e.g. testing for longrun purchasing power parity by pooling a number of countries). We will study the development of the linear regression model in panel data settings involving \'fixed\' and \'random\' effects, and the statistical propoerties of the relevant estimators. Microeconometrics is the study of economic
behavior of individuals or firms b  y employing micro-level dis cr ete r es pons e data and regres s ion methods for panel data . The purpose of this module is to expose students to powerful econometric techniques frequently used in
applied microeconomic research and quantitative policy analysis.'),
    writeln('http://techtree.iiitd.edu.in/viewDescription/filename?=ECO322').
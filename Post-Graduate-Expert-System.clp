; An Expert System that helps post graduate students to choose their suitable master department
; depending on their skills .


; By : 
; 1. Ahmed Abdelsalam
; 2. Mustafa Zaghloul
; 3. Ahmed Adel
; 4. Ahmed Kashkoush
; 5. Mustafa Allam


; Department : CS / IS / IT 
; Concept    : the module
; Courses    : The courses included in the module




;;;;;;;;;;;;;;;;;;;;;;;;;;;;; CS Department ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; 1. This template is for storing the data for each  cs modules
( deftemplate module
   (multislot name_concept_cs)
   (multislot codes_cs)
   (slot dept_cs)
   (multislot name_courses_cs)
)

; 2. This template is for storing the data of module dependent on prerequisites you will enter
( deftemplate module2 
    (slot name_cs)
    (slot CP_cs)  ; credit points
    (slot parent_subject_cs)
    (slot semester_cs)
    (multislot prerequisites_cs) 
    (multislot outcomes_cs) 
)

; 3. This is the data for each module and its courses information
( deffacts module1

   ( module 
   (name_concept_cs Fundamentals-of-CS) 
   (codes_cs CS510,CS611) 
   (dept_cs CS)
   (name_courses_cs "Selected Topics in Mathematics",
   "Design and Analysis of Parallel Algorithms")
   )

   ( module 
   (name_concept_cs AI-and-Expert-System)
   (codes_cs CS521,CS621,CS721,CS722) 
   (dept_cs CS) 
   (name_courses_cs "Artificial Intelligence -2","Advanced Robotics",
   "Neural Networks and Genetic Algorithms","Web Mining")
   )

   ( module 
   (name_concept_cs Programming-Languages)
   (codes_cs 1CS531,CS631,CS731) 
   (dept_cs CS)
   (name_courses_cs "Advanced Programming Languages","Multi-core Programming",
   "3D Game Development")
   )

   ( module 
   (name_concept_cs High-Performance-Computing) 
   (codes_cs CS540,CS641,CS642) 
   (dept_cs CS) 
   (name_courses_cs "Distributed Systems Design","Big Data Analysis and Processing",
   "Parallel Programming-2")
   )

   ( module 
   (name_concept_cs Software-Engineering) 
   (codes_cs CS550,CS650,CS752) 
   (dept_cs CS)
   (name_courses_cs "Software Engineering -3","Software Quality","Secure Code Practices")
   )

   ( module 
   (name_concept_cs System-Software)
   (codes_cs CS561,CS661) 
   (dept_cs CS)
   (name_courses_cs "Operating System-3","Advanced Operating System")
   )

   ( module 
   (name_concept_cs Natural-Language-Processing)
   (codes_cs CS570,CS671,CS771,CS772) 
   (dept_cs CS)
   (name_courses_cs "Compiler construction-2","Knowledge Engineering",
   "Natural Language Processing and Machine Translation","Human- Robot Interaction")
   )

   ( module 
   (name_concept_cs Selected-Topics-in-CS) 
   (codes_cs CS580,CS581,CS68x.CS78x) 
   (dept_cs CS) 
   (name_courses_cs "Project","Selected Topics in CS","Selected Topics in CS",
   "Selected Topics in CS")
   )

)


; 4. This fact is for storing data related to pre requisetes that will be entered by the user 
( deffacts def1
   ( module2 
     (name_cs cloud_computing)
     (CP_cs 3)  ; credit points
     (parent_subject_cs programming_language)
     (semester_cs 1)
     (prerequisites_cs Data-Structure Data-Mining)
     (outcomes_cs "Learning Java and C++","Software Engineering")
   )
)


; 5. Template 1
; 5. This is for taking module's name from the user and stores it in "name_concept_cs" variable
( defrule MAIN::reading-input
   (and(templete_1)(cs))
   =>
   (printout t "Enter Module's Name  : ")
   ( assert ( name_concept_cs ( read ) ) )
)


; 6. This rule to check user input for template 1 (Module's Information) ..
( defrule MAIN::checking-input

   ( name_concept_cs ?name_concept_cs )

   ( module 
     (name_courses_cs $?name_courses_cs1) 
     (codes_cs $?codes_cs1) 
     (dept_cs ?dept_cs1) 
     (name_concept_cs $?name_concept_cs1)
   )

   ; The user will input module name he want to check 
   ; And "test" function will compare it with the existing modules to get the matched module
   ( test (member$ ?name_concept_cs ?name_concept_cs1) )

   =>
   ; If true , this is the output
   ( printout t crlf "Courses Names : " $?name_courses_cs1 crlf 
                     "Courses Codes : " $?codes_cs1 crlf 
                     "Deptartment   : " ?dept_cs1 crlf
   )
)


; 7. Template 2
; 7. This is for taking skills (pre requisites) from the user 
; 7. and stores it in "prerequisites_cs" variable
( defrule reading-input1
   (and(templete_2)(cs))
   =>
   (printout t "Enter the skills you have that is related to preferred department : " crlf)
   ( assert ( prerequisites_cs ( read ) ) )
)


; 8. This rule to check user input for template 2 (Pre requisites Information) ..
( defrule checking-input1

   ( prerequisites_cs ?prerequisites_cs )

   ( module2 
     (name_cs ?name_cs1) 
     (CP_cs ?CP_cs1) 
     (parent_subject_cs ?parent_subject_cs1) 
     (semester_cs ?semester_cs1) 
     (outcomes_cs $?outcomes_cs1) 
     (prerequisites_cs $?prerequisites_cs1)
   )

   ; The user will input skill he have 
   ; And "test" function will check for stored data related to this skill
   ; which is stored in def1
   ( test (member$ ?prerequisites_cs ?prerequisites_cs1) )

   =>
   ; If true , this is the output 
   ( printout t crlf "Course's Name  : " ?name_cs1 crlf 
                     "Credit Points  : " ?CP_cs1 crlf 
                     "Parent Subject : " ?parent_subject_cs1 crlf
                     "Semester       : " ?semester_cs1 crlf 
                     "Outcomes       : " ?outcomes_cs1 crlf
   )

)




;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IS Department ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




; 1. This template is for storing the data for each  is modules
( deftemplate module_is
   (multislot name_concept_is)
   (multislot codes_is)
   (slot dept_is)
   (multislot name_courses_is)
)

; 2. This template is for storing the data of module dependent on prerequisites you will enter
( deftemplate module_pre_is 
   (slot name_is)
   (slot CP_is)
   (slot parent_subject_is)
   (slot semester_is)
   (multislot prerequisites_is) 
   (multislot outcomes_is) 
)

; 3. This is the data for each module and its courses information
( deffacts is-module_is

   ( module_is 
     (name_concept_is Systems-Analysis-and-Design) 
     (codes_is IS511,IS513) 
     (dept_is IS)
     (name_courses_is "Analysis and Design of Information Systems","Advanced Data Structures")
   )

   ( module_is 
      (name_concept_is Database-Systems)
      (codes_is IS521,IS621,IS623,IS721) 
      (dept_is IS) 
      (name_courses_is "Database Design","Advanced Database Systems",
      "Modern Database Models","Databases for New Computing Platforms")
   )

   ( module_is 
      (name_concept_is Distributed-Data-Management)
      (codes_is IS531,IS631,IS731) 
      (dept_is IS)
      (name_courses_is "Data Warehousing",
      "Advanced Topics in Enterprise Systems and Architectures","Advanced Distributed Databases")
   )

   ( module_is 
      (name_concept_is Management-of-IS) 
      (codes_is IS641,IS643,IS741) 
      (dept_is IS) 
      (name_courses_is "Management of Information Systems","E-business",
      "Advanced Topics in Data Management")
   )

   ( module_is 
      (name_concept_is Web-based-IS) 
      (codes_is IS551,IS553,IS651,IS751,IS753) 
      (dept_is IS)
      (name_courses_is "Information Storage and Retrieval","Web Information Processing",
      "Intelligent Web-based IS","Advanced Topics in Information Retrieval")
   )

   ( module_is 
      (name_concept_is Advanced-IS)
      (codes_is IS561,IS661,IS663,IS761,IS763,IS765) 
      (dept_is IS)
      (name_courses_is "Data Mining and Applied Analytics","Spatial Database Design",
      "Advanced Information Systems Engineering","Advanced Information Security",
      "Reasoning with Informatics course")
   )

   ( module_is 
      (name_concept_is IS-Applications)
      (codes_is IS671,IS673,IS771,IS773) (dept_is IS)
      (name_courses_is "IS Applications","Data Management in Bioinformatics",
      "Content Management","Mobile Computing")
   )

   ( module_is (name_concept_is Selected-Topics) 
      (codes_is IS580,IS68x,IS78x) (dept_is IS) 
      (name_courses_is "Project","Selected Topics in IS","Selected Topics in IS")
   )

)

; 4. This fact is for storing data related to pre requisetes that will be entered by the user 
( deffacts def_is
   ( module_pre_is 
      (name_is Query_Optimisation_Evaluation)
      (CP_is 2);;credit point 
      (parent_subject_is Database-Management-Systems)
      (semester_is 1)
      (prerequisites_is SQL-Data-Definition-Language Data-Storage)
      (outcomes_is "Query Optimisation","Relational Operators")
   )
)

; 5. Template 1
; 5. This is for taking module's name from the user and stores it in "name_concept_is" variable
( defrule MAIN::reading-input-is
   (and(templete_1)(is))
   =>
   (printout t "Enter Module's Name : ")
   (assert (name_concept_is (read)))
)

; 6. This rule to check user input for template 1 (Module's Information) ..
( defrule MAIN::checking-input-is
   (name_concept_is ?name_concept_is)
   
   (module_is (name_courses_is $?name_courses_is1) 
      (codes_is $?codes_is1) 
      (dept_is ?dept_is1) 
      (name_concept_is $?name_concept_is1)
   )
   
   (test (member$ ?name_concept_is ?name_concept_is1))
   
   =>
   
   ( printout t crlf "Courses Names : " $?name_courses_is1 crlf 
                     "Courses Codes : " $?codes_is1 crlf 
                     "Deptartment   : " ?dept_is1 crlf
   )


)

; 7. Template 2
; 7. This is for taking skills (pre requisites) from the user 
; 7. and stores it in "prerequisites_is" variable
( defrule reading-input1-is
   (and(templete_2)(is))
   =>
   (printout t "Enter the skills you have that is related to preferred department : " crlf)
   (assert (prerequisites_is (read)))
)

; 8. This rule to check user input for template 2 (Pre requisites Information) ..
( defrule checking-input1-is

   (prerequisites_is ?prerequisites_is)

   ( module_pre_is 
      (name_is ?name_is1) 
      (CP_is ?CP_is1) 
      (parent_subject_is ?parent_subject_is1) 
      (semester_is ?semester_is1) 
      (outcomes_is $?outcomes_is1) 
      (prerequisites_is $?prerequisites_is1)
   )

   (test (member$ ?prerequisites_is ?prerequisites_is1))

   =>

   ( printout t crlf "Course's Name  : " ?name_is1 crlf 
                     "Credit Points  : " ?CP_is1 crlf 
                     "Parent Subject : " ?parent_subject_is1 crlf
                     "Semester       : " ?semester_is1 crlf 
                     "Outcomes       : " ?outcomes_is1 crlf
   )

)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;; IT Department ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  


; 1. This template is for storing the data for each  it modules
( deftemplate module_it
   (multislot name_concept_it)
   (multislot codes_it)
   (slot dept_it)
   (multislot name_courses_it)
)

; 2. This template is for storing the data of module dependent on prerequisites you will enter
( deftemplate module_pre_it 
    (slot name_it)
    (slot CP_it)
    (slot parent_subject_it)
    (slot semester_it)
    (multislot prerequisites_it)
    (multislot outcomes_it)
)

; 3. This is the data for each module and its courses information
( deffacts it-module

   ( module_it 
      (name_concept_it Computer-Networks-and-Network-Security) 
      (codes_it IT511,IT611,IT612,IT711,IT712,IT713) 
      (dept_it IT)
      (name_courses_it "Multimedia Networking","Information Networks-2",
      "Computer networks-4","Advanced Topics in Computer Networks",
      "Advanced topics in Network management","Advanced topics in network security")
   )

   ( module_it 
      (name_concept_it Computer-Vision)
      (codes_it IT521,IT621,IT622,IT721) 
      (dept_it IT) 
      (name_courses_it "Digital Image Processing","Image Processing-3",
      "Computer Vision-2","Advanced Topics in Computer Vision")
   )

   ( module_it (name_concept_it Pattern-Recognition)
      (codes_it IT532,IT631,IT731,IT732) 
      (dept_it IT)
      (name_courses_it "Pattern Recognition-1","Pattern Recognition-2",
      "Advanced Topics in Pattern Recognition","Biometrics")
   )

   ( module_it (name_concept_it Computer-Graphics-and-Virtual Reality) 
      (codes_it IT541,IT542,IT641) 
      (dept_it IT) 
      (name_courses_it "Animation","Network operating system","Virtual Reality-2")
   )
   
   ( module_it (name_concept_it Web-Design-and-Development) 
      (codes_it IT551) 
      (dept_it IT)
      (name_courses_it "Web Development-2")
   )

   ( module_it (name_concept_it Multimedia)
      (codes_it IT661) 
      (dept_it IT)
      (name_courses_it "Advanced Topics in Multimedia")
   )

   ( module_it (name_concept_it Signal-Processing-and-Speech)
      (codes_it IT572,IT671) 
      (dept_it IT)
      (name_courses_it "Speech Recognition-2","Automatic Speech Recognition-3")
   )

   ( module_it (name_concept_it Selected-Topics) 
      (codes_it IT582,IT58x,IT68x,IT683,IT684,IT78x,IT783,IT784,IT785) 
      (dept_it IT) 
      (name_courses_it "Project","Selected Topics in IT","Selected Topics in IT",
      "Advanced Information Technology Applications","Medical Imaging",
      "Selected Topics in IT","Computational Cognitive Science",
      "Computer-Assisted enterventions","Human-Computer enteraction")
   )

)
  
; 4. This fact is for storing data related to pre requisetes that will be entered by the user 
( deffacts def_it
   (module_pre_it 
      (name_it network2)
      (CP_it 2)
      (parent_subject_it network1)
      (semester_it 1)
      (prerequisites_it logic ccna)
      (outcomes_it "Cyber Security","Data Analysis")
   )
)

; 5. Template 1
; 5. This is for taking module's name from the user and stores it in "name_concept_it" variable
( defrule reading-input-it
   (and(templete_1)(it))
   =>
   (printout t "Enter Module's Name : ")
   (assert (name_concept_it (read)))
)

; 6. This rule to check user input for template 1 (Module's Information) ..
( defrule checking-input-it

   (name_concept_it ?name_concept_it)

   (module_it (name_courses_it $?name_courses_it1) 
      (codes_it $?codes_it1) 
      (dept_it ?dept_it1) 
      (name_concept_it $?name_concept_it1)
   )
   
   (test (member$ ?name_concept_it ?name_concept_it1))
   
   =>

   ( printout t crlf "Courses Names : " $?name_courses_it1 crlf 
                     "Courses Codes : " $?codes_it1 crlf 
                     "Deptartment   : " ?dept_it1 crlf
   )
   
)

; 7. Template 2
; 7. This is for taking skills (pre requisites) from the user 
; 7. and stores it in "prerequisites_it" variable
( defrule reading-input1-it
   (and(templete_2)(it))
   =>
   (printout t "Enter the skills you have that is related to preferred department : " crlf)
   (assert (prerequisites_it (read)))
)

; 8. This rule to check user input for template 2 (Pre requisites Information) ..
( defrule checking-input1-it

   (prerequisites_it ?prerequisites_it)

   ( module_pre_it 
      (name_it ?name_it1) 
      (CP_it ?CP_it1) 
      (parent_subject_it ?parent_subject_it1) 
      (semester_it ?semester_it1) 
      (outcomes_it $?outcomes_it1) 
      (prerequisites_it $?prerequisites_it1)
   )

   (test (member$ ?prerequisites_it ?prerequisites_it1))

   =>

   ( printout t crlf "Course's Name  : " ?name_it1 crlf 
                     "Credit Points  : " ?CP_it1 crlf 
                     "Parent Subject : " ?parent_subject_it1 crlf
                     "Semester       : " ?semester_it1 crlf 
                     "Outcomes       : " ?outcomes_it1 crlf
   )
   
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Windows Display ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Ask user to choose the department
( defrule MAIN::output2 

   ; There is no condition because I want it to be shown
   ; It is like (true) :
   =>

   ( printout t "Please, Choose Department : " crlf
   "1 for CS " crlf 
   "2 for IS " crlf 
   "3 for IT " crlf 
   "Your input is : "
   )

   (bind ?deptn (read))   ; bind is like var (as a datatype)

   (
      if (= ?deptn 1) ; It is like :   if(?deptn==1)
      then
      (assert (cs))
      (printout t "Welcome to CS Department :) "crlf)
   )

   (
      if (= ?deptn 2)
      then
      (assert (is))
      (printout t "Welcome to IS Department :) "crlf )
   )

   (
      if (= ?deptn 3)
      then
      (assert (it))
      (printout t "Welcome to IT Department :) "crlf )
   )

)


; Ask user to get modules information or check his skill
( defrule MAIN::output 

   ; Here to be sure that user had choose a department
   (
      or (cs)(it)(is)
   )  
   
   =>

   ( printout t "Enter 1 to get module's information  : " crlf 
                "Enter 2 to check your skills         : "crlf 
                "Your input is                        : "
   )
   
   (bind ?v (read))  ; v is variable refers to user's input

   (
      if (= ?v 1)   ; It is like : if(v == 1) :
      then
      (assert (templete_1))
   )

   (
      if (= ?v 2)
      then
      (assert (templete_2))
   )

)

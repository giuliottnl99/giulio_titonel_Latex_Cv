% Created by Murat Can Karacabey
% this is inspired by Michael Pollind's Awesome CV 
% Created from scratch as a much simpler alternative to it to actually learn LaTeX.
% Might be interpreted as an easier-to-edit or easier-to-understand-what-is-going-on version of it.
\author{Giulio Titonel}
\RequirePackage[dvipsnames]{xcolor} % moved here I guess article class causes option clash with xcolor if used after loading the class
\LoadClass[11pt]{article}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{muratcan_cv}[2020/04/15 Muratcan CV Class]
\RequirePackage[sfdefault]{noto}
\RequirePackage{etoolbox}
\RequirePackage{pgffor}
\RequirePackage{titlesec}
\RequirePackage{tikz}
\RequirePackage{fontspec}
\RequirePackage[left=0.75in,top=0.3in,right=0.75in,bottom=0.6in]{geometry} % Document margins
\RequirePackage{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{mfirstuc}
\RequirePackage{ifthen}
\RequirePackage{lipsum}
\RequirePackage{array}
\pagestyle{empty}


%Setup

\newcommand*{\setname}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\setaddress}[1]{\def\@address{#1}}
\newcommand*{\setmobile}[1]{\def\@mobile{#1}}
\newcommand*{\setposition}[1]{\def\@position{#1}}
\newcommand*{\setmail}[1]{\def\@mail{#1}}
\newcommand*{\setthemecolor}[1]{\def\@themecolor{#1}}
\newcommand*{\setlinkedinaccount}[1]{\def\@linkedinaccount{#1}}
\newcommand*{\setgithubaccount}[1]{\def\@githubaccount{#1}}

%Setup for coverletter

\newcommand*{\setcompanyname}[1]{\def\@companyname{#1}}
\newcommand*{\setcontactperson}[1]{\def\@contactperson{#1}}
\newcommand*{\setclaimedposition}[1]{\def\@claimedposition{#1}}


\hypersetup{
    colorlinks=true,
    urlcolor=cyan,
}

% View commands
% Header

% can makebox also be used?
\newcommand\headerview{
\begin{minipage}{0.25\linewidth}
    \profpic{0.22}{images/profilpicture}
\end{minipage}% 
\hfill
\begin{minipage}{0.45\linewidth}
    \center \name \\[0.05cm] 
    \contact % address \ mobile \\ mail
    \chooseLanguage
\end{minipage}
}

%profilpicture

\newsavebox{\picbox}
\newcommand{\profpic}[2]{%
    \savebox{\picbox}{%
    \includegraphics[scale=#1]{#2}}% 
    \tikz\node [draw, circle,%
    line width=4pt, color=white,% 
    minimum width=\wd\picbox,minimum height=\ht\picbox,%
    path picture={ \node at (path picture bounding box.center)% 
    {\usebox{\picbox}};}]% 
    {};
    }

    
%contactsubviews 
    
    
\newcommand{\githubview}{\href{\@linkedinaccount}{\faLinkedinSquare\ \footnotesize linkedin}}
\newcommand{\linkedinview}{\href{\@githubaccount}{\faGithubSquare\ \footnotesize github}}

\newcommand{\name}{%
    {\large \@firstname \ \textsc{\@lastname}}
}

\newcommand{\contact}{%
        {\small \@address  \cps \@mobile \\ \@mail%
        \\%
        \linkedinview \cps \githubview \\ 
        } % 
}

\newcommand{\chooseLanguage}{% 
        {\small 
        \href{https://giuliotitonel.000webhostapp.com/redirect_en.php}{ITA: \includegraphics[width=10mm ]{images/it_flag.png}}   \cps 
        \href{https://giuliotitonel.000webhostapp.com/redirect_it.php}{ENG: \includegraphics[width=10mm ]{images/en_flag.png}} \\
        } % 
}


% Covverletterview

\newcommand\coverletter[1]{ 
\\  \coverlettersubview 
\section{} \vspace{1ex} 
\textbf{ Dear \@contactperson, \\[0.1cm]}
  #1
}

\newcommand\coverlettersubview{
\begin{tabular}{>{\scshape \bfseries \color{\@themecolor}}l  >{\small }l}
Company: & \@companyname \\
Position: & \@claimedposition \\
\end{tabular}
}


% Helper commands

\newcommand\ruleafter[1]{#1~{\color{black!60!\@themecolor}\hrulefill}} % a trick to put the line with <before> parameter in \titleformat

%colorfulpipeseperator

\newcommand{\cps}{{\color{\@themecolor} \quad\textbar\quad}}
\newcommand{\cpshalf}{{\color{\@themecolor} \hspace{0.2em}\textbar\hspace{0.2em}}}

\newcommand{\coloredbullet}{{\color{\@themecolor} \textbullet}}

% Edit section styles

\titleformat{\section}      % Customise the \section command 
  {\large\bfseries\scshape\raggedright\color{\@themecolor}} % Make the \section headers large (\Large),
                               % small capitals (\scshape) and left aligned (\raggedright)
  {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
  {\ruleafter}                           % Can be used to insert code before the heading

\titlespacing*{\section}{-1pt}{0pt}{0pt}

% Textview commands

\newcommand{\experience}[2]{%
  \mbox { \hspace{1em} \scshape \textbf{#1} }%
}

\newcommand{\datetext}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}

\newcommand{\gradeText}[1]{%
{\itshape  \footnotesize \mdseries  \color{black!60!\@themecolor} #1 } 
}

\newcommand{\datedexperience}[2]{%
  \begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \hfill \datetext{#2}\\[0.01cm] %
}

\newcommand{\gradeAndStudy}[2]{%
  \begin{small} \mbox { \hspace{1em} \scshape #1 } \end{small} \hfill \gradeText{#2}\\[0.01cm] %
    %  \mbox { \scshape \hspace{1.2em} \footnotesize #1}\\[0.05cm]
  %\begin{small} \mbox { \hspace{1em} \scshape \textbf{#1} } \end{small} \hfill \datetext{#2}\\[0.01cm] %

}



\newcommand{\explanation}[1]{%
    \mbox { \scshape \hspace{1.2em} \footnotesize #1}\\[0.05cm]
}

\newcommand{\explanationdetail}[1]{%
    \indent \begin{minipage}{0.96\linewidth} \footnotesize #1 \end{minipage} \\[0.1cm]
}
\newcommand{\explanationdetailWithHiddenText}[2]{%
    \indent \begin{minipage}{0.96\linewidth} \footnotesize \pdftooltip{\dashuline{#1}}{#2} \end{minipage} \\[0.1cm]
}

\newcommand{\hiddenTextUnderlined}[2]{%
    \pdftooltip{\dashuline{#1}}{#2}   
}

\newcommand{\itemwithtext}[1]{%
    \begin{minipage}{\linewidth} \footnotesize \item #1 \end{minipage}
}

\newcommand{\addblocktext}[2]{%
  \section{#1} 
  \indent \explanationdetail{\hspace{4ex} #2}
}

\newcommand\createskill[2]{%
    \textsc{\textbf{#1}} & #2
}

\newcommand\createtablecontent[1]{%
    \foreach \x [count=\xi] in {#1} {\ifthenelse{\xi=1}{\x}{\\ \x}}
}

\newcommand\createskillsanothertry[1]{%not used
  \begin{tabular}{r|l}
      \createtablecontent{#1}
        \end{tabular}
}

\newcommand\createskills[1]{%
\explanationdetail{
  \begin{tabular}{rl}
    \makeatletter
    \@for\thisitem:=#1\do{\thisitem\\[0.1cm]}
    \makeatother
    \end{tabular}
}
}

\newcommand\createbullets[1]{%
    \renewcommand{\labelitemi}{\coloredbullet}
  \begin{itemize}
    \makeatletter
    \@for\thisitem:=#1\do{\itemwithtext{\thisitem}}
    \makeatother
  \end{itemize}
}

\newcommand\createfootnote{%
  \renewcommand{\footnotesize}{\fontsize{7pt}{11pt}\selectfont}
    \renewcommand\footnoterule{\rule{0.3\linewidth}{0.5pt}}
    \let\thefootnote\relax\footnote{\today\ / \href{https://github.com/giuliottnl99/giulio_titonel_Latex_Cv}{github source code} \cpshalf
    \@lblInfoHiddenTexts
    \href{https://smallpdf.com/file\#s=8760a27e-2d9c-48cc-b761-550d4bc5f91b}{\@lblLinkVisibleHiddenTexts}} }

\newcommand{\setContent}{

\section{\@lblEducation}
    \datedexperience{Politecnico di Torino}{Oct2018-Jul2021} 
    \gradeAndStudy{ \@lblManagementEngin }{\hiddenTextUnderlined{95/110}{\@lblNoteAboutGrade}}
    \explanationdetail{\coloredbullet\ % 
     \@lblWorkedWith}
     \explanationdetail{\coloredbullet\ %
     \@lblOthersStudy}
     \explanationdetailWithHiddenText{\coloredbullet\ %
     \@lblTopStudents}{\@lblInfoTopStudents}
     
% Experience
\section{\@lblExperience}
    %
    \datedexperience{\@lblSelfEmployerMinijobs}{2020-2021}
    \explanationdetailWithHiddenText{\coloredbullet\ % 
     \@lblWordPress}{\@lblInfoWordPress}
    \explanationdetailWithHiddenText{\coloredbullet\ % 
     \@lblJsDevelopment}{\@lblInfoJsDevelopment}
    \explanationdetail{\coloredbullet\ % 
     \@lblAndroidDevelopment}
     %
    \datedexperience{Politecnico di Torino}{Jan2021-Jul2021}
    \explanation{\@lblGraphicInterfaceTitle } 
    \explanationdetail{\coloredbullet\ % 
    \href{https://www.youtube.com/watch?v=69zSGqenjFY}{ \@lblGraphicInterfaceDescription} }
%
    \datedexperience{GFT Technologies SE}{Jan2022-current} 
        \explanation{Full stack and BackEnd developer} 
        \explanationdetail{\coloredbullet  \@lblDoneGftPartA}
        \explanationdetail{\coloredbullet  \@lblDoneGftPartB}
        \explanationdetail{\coloredbullet \@lblDoneGftPartC}
        \explanationdetail{\coloredbullet \@lblDoneGftTechnologies}
        \explanationdetailWithHiddenText{\coloredbullet \@lblDoneGftLearnings }{ \@lblDoneGftLearningsInfo }

% Skills
\section{Skills}
    %
    \newcommand{\skillone}{\createskill{Programming Languages}{\textbf{\emph{Experienced:}} \ \  Java \cpshalf Javascript \cpshalf PlSql \ \ \textbf{\emph{Familiar:}} \ \  PHP \cpshalf Bash \cpshalf Python \cpshalf Matlab \cpshalf C \cpshalf \pdftooltip{\dashuline{GS}}{Google Scripts}
}}
    %
    \newcommand{\skilltwo}{\createskill{Software Development}{Programming Paradigms \cpshalf RTC \cpshalf Agile Methodology}}
    %
    \newcommand{\skillthree}{\createskill{Frameworks \ \& \ Libraries}{\textbf{\emph{Experienced:}} \ Jsf \cpshalf MyBatis \ \ \textbf{\emph{Familiar:}}  Spring \cpshalf Vue \cpshalf WordPress \cpshalf Hibernate}}
    %
    \newcommand{\skillfour}{\createskill{Languages}{\textbf{\emph{Native:}} \ \  \@lblItalianLanguage \ \ \textbf{\emph{Fluent:}} \ \ \@lblEnglishLanguage \ \ \textbf{\emph{Beginner:}} \ \  \@lblGermanLanguage }}
    %
    \createskills{\skillone, \skilltwo, \skillthree, \skillfour}
%
\section{\@lblSharableOSProjects}
    \datedexperience{Automated jUnits Writer}{2023}
    \explanationdetail{\coloredbullet\ \@lblJUnitWriterDescription}
    \explanationdetail{\coloredbullet\ \@lblJUnitLanguages % 
      \cpshalf \href{https://www.youtube.com/watch?v=NJGAuvsBNYE}{\@lblJUnitsExplanatoryVideo} \cpshalf \href{https://github.com/giuliottnl99/jUnit_tests_generator/}{\@lbljUnitsSourceCode}}
%
    \datedexperience{\@lblGoogleScripts}{2022-2023}
    %
    \explanationdetail{\coloredbullet\ \href{https://docs.google.com/document/d/1DG5shhLn8m8caoGvE6v_k51gSsOEkItAKewp1RpDoh4/edit}{\@lblGoogleScriptsLink}}






%Footnote
\createfootnote

}


%languageSetters
\newcommand*{\setlblEducation}[1]{\def\@lblEducation{#1}}
\newcommand*{\setlblManagementEngin}[1]{\def\@lblManagementEngin{#1}}
\newcommand*{\setlblNoteAboutGrade}[1]{\def\@lblNoteAboutGrade{#1}}
\newcommand*{\setlblWorkedWith}[1]{\def\@lblWorkedWith{#1}}
\newcommand*{\setlblOthersStudy}[1]{\def\@lblOthersStudy{#1}}
\newcommand*{\setlblTopStudents}[1]{\def\@lblTopStudents{#1}}
\newcommand*{\setlblInfoTopStudents}[1]{\def\@lblInfoTopStudents{#1}}

\newcommand*{\setlblExperience}[1]{\def\@lblExperience{#1}}
\newcommand*{\setlblSelfEmployerMinijobs}[1]{\def\@lblSelfEmployerMinijobs{#1}}
\newcommand*{\setlblWordPress}[1]{\def\@lblWordPress{#1}}
\newcommand*{\setlblInfoWordPress}[1]{\def\@lblInfoWordPress{#1}}
\newcommand*{\setlblJsDevelopment}[1]{\def\@lblJsDevelopment{#1}}
\newcommand*{\setlblInfoJsDevelopment}[1]{\def\@lblInfoJsDevelopment{#1}}
\newcommand*{\setlblAndroidDevelopment}[1]{\def\@lblAndroidDevelopment{#1}}
\newcommand*{\setlblGraphicInterfaceTitle}[1]{\def\@lblGraphicInterfaceTitle{#1}}
\newcommand*{\setlblGraphicInterfaceDescription}[1]{\def\@lblGraphicInterfaceDescription{#1}}
\newcommand{\setlblDoneGftPartA}[1]{\def\@lblDoneGftPartA{#1}}
\newcommand{\setlblDoneGftPartB}[1]{\def\@lblDoneGftPartB{#1}}
\newcommand{\setlblDoneGftPartC}[1]{\def\@lblDoneGftPartC{#1}}
\newcommand{\setlblDoneGftTechnologies}[1]{\def\@lblDoneGftTechnologies{#1}}
\newcommand{\setlblDoneGftLearnings}[1]{\def\@lblDoneGftLearnings{#1}}
\newcommand{\setlblDoneGftLearningsInfo}[1]{\def\@lblDoneGftLearningsInfo{#1}}

\newcommand{\setlblProgrammingLanguages}[1]{\def\@lblProgrammingLanguages{#1}}
\newcommand{\setlblItalianLanguage}[1]{\def\@lblItalianLanguage{#1}}
\newcommand{\setlblEnglishLanguage}[1]{\def\@lblEnglishLanguage{#1}}
\newcommand{\setlblGermanLanguage}[1]{\def\@lblGermanLanguage{#1}}


\newcommand{\setlblSharableOSProjects}[1]{\def\@lblSharableOSProjects{#1}}
\newcommand{\setlblJUnitWriterDescription}[1]{\def\@lblJUnitWriterDescription{#1}}
\newcommand{\setlblJUnitLanguages}[1]{\def\@lblJUnitLanguages{#1}}
\newcommand{\setlblJUnitsExplanatoryVideo}[1]{\def\@lblJUnitsExplanatoryVideo{#1}}
\newcommand{\setlbljUnitsSourceCode}[1]{\def\@lbljUnitsSourceCode{#1}}
\newcommand{\setlblGoogleScripts}[1]{\def\@lblGoogleScripts{#1}}
\newcommand{\setlblGoogleScriptsLink}[1]{\def\@lblGoogleScriptsLink{#1}}
\newcommand{\setlblInfoHiddenTexts}[1]{\def\@lblInfoHiddenTexts{#1}}
\newcommand{\setlblLinkVisibleHiddenTexts}[1]{\def\@lblLinkVisibleHiddenTexts{#1}}



%Italian language
\newcommand{\setItalianLanguage}{

\setlblEducation{Istruzione}
\setlblManagementEngin{Ingegneria gestionale}
\setlblNoteAboutGrade{Nota: nel politecnico la media di laurea triennale è 94 e mediamente uno studente impiega 4 anni a laurearsi (io ne ho messi meno di 3). Inoltre, avrei preso un voto superiore a 100 se nell'ultimo trimestre non fossi stato costretto ad accettare voti molto bassi a causa di una legge italiana sulla reversibilità delle pensioni}
\setlblWorkedWith{Ho lavorato con java avanzato, logiche complesse degli algoritmi, sviluppo web (html, css, javascript, php, sql) e database}
\setlblOthersStudy{Matematica avanzata, fisica, economia, meccanica e ricerca operativa}
\setlblTopStudents{Ero nel \textbf{top 10\% degli studenti} del Politecnico}
\setlblInfoTopStudents{Il punteggio era dato dalla somma per ogni esame di: voto ottenuto*CFU dell'esame. Quindi il punteggio considerava sia i voti sia eventuali ritardi negli studi. Il mio punteggio era nel 10\% dei punteggi più alti, e così ho ottenuto uno sconto per merito sulla retta universitaria}

\setlblExperience{Esperienze di lavoro (2 ANNI)}
\setlblSelfEmployerMinijobs{Altri lavoretti e progettini svolti}
\setlblWordPress{WordPress: uso e modifiche al codice sorgente}
\setlblInfoWordPress{Ho creato siti web usando WordPress e ho fatto piccole modifiche nelle tabelle SQL e nel codice PHP che erano utili per i miei scopi}
\setlblJsDevelopment{Esperienza nello sviluppo di script Javascript}
\setlblInfoJsDevelopment{Ho creato molti script usando javascript e Google script, per gli usi personali più disparati}
\setlblAndroidDevelopment{Basi di sviluppo Android}
\setlblGraphicInterfaceTitle{Interfaccia grafica per il software ECG-DIG}
\setlblGraphicInterfaceDescription{ Creata l'interfaccia grafica di un software che elabora e ricostruisce gli elettrocardiogrammi, così da renderlo effettivamente utilizzabile dai medici}
\setlblDoneGftPartA{Modifiche del codice: backend, frontend, Database (incluse procedures e packages), flussi}
\setlblDoneGftPartB{Debugging, scrittura manuale di Junit tests e automatizzazione dei jUnit tests}
\setlblDoneGftPartC{Scrittura di analisi tecniche. Ho lavorato su tutti gli ambienti, da sviluppo a produzione}
\setlblDoneGftTechnologies{Tecnologie usate: java8 (incluse lambda e reflections), jsf, MyBatis, Bash, Sql, PlSql, RTC, jUnits, basi di microservizi}
\setlblDoneGftLearnings{Tecnologie imparate con i corsi: Spring, Hibernate, PlSql}
\setlblDoneGftLearningsInfo{Ho completato un corso di PlSql. Sto studiando Spring anche se sono già familiare. Ho studiato hibernate abbastanza bene.}

\setlblItalianLanguage{Italiano}
\setlblEnglishLanguage{Inglese}
\setlblGermanLanguage{Tedesco}

\setlblSharableOSProjects{Progetti condivisibili \& link}
\setlblJUnitWriterDescription{Questo script può semplificare la scrittura dei jUnit tests e può essere usato anche da chi ha accordi di segretezza sul codice}
\setlblJUnitLanguages{Scritto in HTML, CSS e Javascript}
\setlblJUnitsExplanatoryVideo{Video esplicativo}
\setlbljUnitsSourceCode{codice sorgente}
\setlblGoogleScripts{Google scripts per trading e altri usi personali}
\setlblGoogleScriptsLink{Qui c'è una lista di alcuni Google scripts personali che posso condividere}

\setlblInfoHiddenTexts{Se vuoi vedere i testi "nascosti", apri questo pdf con un pdf reader professionale come Adobe. }
\setlblLinkVisibleHiddenTexts{In alternativa qui puoi vederlo da un editor online che funziona bene}
}





%english language
\newcommand{\setEnglishLanguage}{
\setlblEducation{Education}
\setlblManagementEngin{Management engineering}
\setlblNoteAboutGrade{Note that: in the Politecnico di Torino the average vote is 94 and the average time used to get the bachelor's degree is 4 years (I needed 3 years).
    Furthermore, I could have gotten at least 100/110 but I was forced to accept some bad grades in the last semester due to an Italian law on pension reversibility }
\setlblWorkedWith{Worked with advanced java and algorithms logic, web development (html, css, javascript, php, sql), Databases.}
\setlblOthersStudy{Advanced Math, Phisics, Economics, Mechanics and Operative Research }
\setlblTopStudents{I was in the \textbf{top 10\% students} of the University
}
\setlblInfoTopStudents{The score was calculated as the sum for every exam of: obtained vote*CFU of the exam. So the score considered both grades and timing. My score was in the 10\% highest, therefore I received a merit discount in the tuition fee}

\setlblExperience{Experience (2 YEARS)}
\setlblSelfEmployerMinijobs{Self-employer mini-jobs: What I learnt}
\setlblWordPress{WordPress: use and code changes}
\setlblInfoWordPress{I created websites using WordPress and I made a little changes in SQL tables and php source code that were useful}
\setlblJsDevelopment{Javascript development experience}
\setlblInfoJsDevelopment{I created a lot of scripts using javascript and Google scripts for different uses}
\setlblAndroidDevelopment{Basics of Android Development}
\setlblGraphicInterfaceTitle{Graphic interface for ECG-DIG software}
\setlblGraphicInterfaceDescription{Created the graphic interface of a software that elaborates and reconstructs ElectroCardioGrams, so that Doctors can actually use it}
\setlblDoneGftPartA{Code modifications of: backend, frontend, Databases (procedures and packages included), Flows.}
\setlblDoneGftPartB{Debugging of code, handwrited jUnit tests and automatizarion of jUnit tests writing}
\setlblDoneGftPartC{Writing of Technical Analysis. Work on either development, intermediate and production environment}
\setlblDoneGftTechnologies{Technologies used on the job: java8 (including reflections and lambda expressions), jsf, MyBatis, Bash, Sql, PlSql, RTC, jUnits, Microservices infrastructure (basics)}
\setlblDoneGftLearnings{Technologies learnt by courses:  Spring, Hibernate, PlSql}
\setlblDoneGftLearningsInfo{I completed a course in PlSql, while I'm going on studying Spring even though I am familiar enough. I studied Hibernate well enough.}

\setlblItalianLanguage{Italian}
\setlblEnglishLanguage{English}
\setlblGermanLanguage{German}


\setlblSharableOSProjects{Sharable Open Source Projects \& Links}
\setlblJUnitWriterDescription{This software/script can simplify jUnit tests writing: useful for those who cannot use IA systems because of privacy agreements}
\setlblJUnitLanguages{Written in HTML, CSS and Javascript}
\setlblJUnitsExplanatoryVideo{Explanatory video}
\setlbljUnitsSourceCode{Source code}
\setlblGoogleScripts{Google Scripts for trading scripts \& personal use}
\setlblGoogleScriptsLink{Here is a list of Google Scripts I once used for trading or for personal use}

\setlblInfoHiddenTexts{In order to be able to see hidden texts, open this pdf with a professional pdf reader such as Adobe. }
\setlblLinkVisibleHiddenTexts{Otherwise you can click here to see the pdf on an online editor that works fine}


}


%!TEX encoding = UTF-8 Unicode

% --------------------------------------------------------------------------------------
% ----------------------------------- Identification -----------------------------------
% --------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ULrapport}[2016/08/12 - Rapport de stage (Université Laval)]


% --------------------------------------------------------------------------------------
% ------------------------------------ Initial code ------------------------------------
% --------------------------------------------------------------------------------------

% Flags logiques permettant l'insertion des listes des figures et des tableaux
\RequirePackage{ifthen}
\newboolean{InsertFiguresList}
\newboolean{InsertTablesList}


% --------------------------------------------------------------------------------------
% ------------------------------- Declaration of options -------------------------------
% --------------------------------------------------------------------------------------
\DeclareOption{lof}{\setboolean{InsertFiguresList}
\DeclareOption{lot}{\setboolean{InsertTablesList}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}


% --------------------------------------------------------------------------------------
% -------------------------------- Execution of options --------------------------------
% --------------------------------------------------------------------------------------
\ProcessOptions \relax


% --------------------------------------------------------------------------------------
% ----------------------------------- Package loading ----------------------------------
% --------------------------------------------------------------------------------------
\LoadClass{report}

\RequirePackage{geometry}
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[USenglish,french]{babel}
\RequirePackage{caption}
\RequirePackage{textcomp}        % For \textcelsius, \textmu, \textohm
\RequirePackage{array}
\RequirePackage{amstext}         % For \text
\RequirePackage{tabularx}
\RequirePackage{colortbl}
\RequirePackage{longtable}
\RequirePackage{graphicx}
\RequirePackage{rotating}
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}


%--------------------------------------------------------------------------------------
%-------------------------------------- Main code -------------------------------------
%--------------------------------------------------------------------------------------

% Definition of the `hyperref` package parameters
\hypersetup{plainpages=false,%
            breaklinks=false,%
            colorlinks=true}

% Definition of the page's dimensions (package `geometry`)
\geometry{letterpaper,%
          centering,%
          hmargin={2.5cm,2.5cm},%
          vmargin={2.5cm,2.5cm},%
          heightrounded,%
          includehead}

% Package `caption` used for:
%    - Redefinition of the separation character in the legends as `babel` defines it
%      because `caption` (or `float`) redefines it as ':'
%    - Uniformizes the legends between `tables`, `longtables` and `supertabular`
%    - Specifies that the legend of the tables will be placed on top.
%      Switches the spacing dimensions (before and after the legend)
\DeclareCaptionLabelSeparator{as-Babel-french}{\space\textendash\space}
\captionsetup{margin=0.1\textwidth,labelsep=as-Babel-french}
\captionsetup[table]{position=top}


% Redefinition of `thebibliography` so that it is mentionned in the table of contents
\newenvironment{thebibliographyUL}[1]%
               {\clearpage%
                \begin{thebibliography}{#1}%
                \addcontentsline{toc}{chapter}{\bibname}%
                \raggedright%
               }%
               {\end{thebibliography}}


% Header and footer by default
\pagestyle{headings}


% Definition of the default graphics path
\graphicspath{{./fig/}}

% Title page definition
\renewcommand{\maketitle}{%
    \thispagestyle{empty}%
    \pagenumbering{roman}%

    \begin{titlepage}%
        \setcounter{page}{999}%                      % Associate the number '0' to the title page

        \begin{minipage}{.45\linewidth}
            \begin{flushleft}
                \includegraphics[width=12em]{ul_logo}
            \end{flushleft}
        \end{minipage}

        \hfill

        \begin{minipage}{.45\linewidth}
            \begin{flushright}
                \CourseName   \\
                \CourseNumber \\
                \Session      \\
                \ProgramName
            \end{flushright}
        \end{minipage}

        \vspace*{\stretch{2}}

        \begin{center}
            \parbox{\textwidth}{\centering\Large\bfseries \InternTitle - \CompanyName} \\[5ex]
            \parbox{\textwidth}{\centering\large\bfseries \ReportType}                 \\

            \vspace*{\stretch{2}}

            \parbox{\textwidth}{\centering\bfseries Destinataire} \\
            \parbox{\textwidth}{\centering\bfseries \Destination}
        \end{center}

        \vspace*{\stretch{2}}

        \begin{flushleft}
            \ReportDeliveryDate
        \end{flushleft}

        \hline

        \begin{minipage}{.45\linewidth}
            \begin{flushleft}
                \StudentName \\
                \StudentNumber
            \end{flushleft}
        \end{minipage}

        \hfill

        \begin{minipage}{.45\linewidth}
            \begin{flushright}
                \SupervisorName
            \end{flushright}
        \end{minipage}

    \end{titlepage}%

    \clearpage%
    \let\maketitle\relax%
}

% Definition of the functions to set the title page parameters
\def\SetCompanyName#1{\def\CompanyName{#1}}
\def\SetCourseName#1{\def\CourseName{#1}}
\def\SetCourseNumber#1{\def\CourseNumber{#1}}
\def\SetDestination#1{\def\Destination{#1}}
\def\SetInternTitle#1{\def\InternTitle{#1}}
\def\SetProgramName#1{\def\ProgramName{#1}}
\def\SetReportDeliveryDate#1{\def\ReportDeliveryDate{#1}}
\def\SetReportType#1{\def\ReportType{#1}}
\def\SetSession#1{\def\Session{#1}}
\def\SetStudentName#1{\def\StudentName{#1}}
\def\SetStudentNumber#1{\def\StudentNumber{#1}}
\def\SetSupervisorName#1{\def\SupervisorName{#1}}
\def\SetSupervisorTitle#1{\def\SupervisorTitle{#1}}

% Definition of the default title page parameters
\def\CompanyName{Company Name}
\def\CourseName{Course Name}
\def\CourseNumber{Course Number}
\def\Destination{Destination}
\def\InternTitle{Intern Title}
\def\ProgramName{Program Name}
\def\ReportDeliveryDate{Report Delivery Date}
\def\ReportType{Report Type}
\def\Session{Session}
\def\StudentName{Student Name}
\def\StudentNumber{Student Number}
\def\SupervisorName{Supervisor Name}
\def\SupervisorTitle{Supervisor Title}

% Definition of the maximum hierarchic level covered by the table of contents
\setcounter{tocdepth}{3}            % default = 2

% Definition of the maximum hierarchic level for elements having a numerotation
\setcounter{secnumdepth}{3}         % default = 2

% Definition of `hyperref` parameters
\AtBeginDocument{%
   \hypersetup{pdftitle={\CourseName},%
               pdfsubject={\ReportType},%
               pdfauthor={\StudentName - \StudentNumber}}%
}

% Selection of `babel` language by default
\AtBeginDocument{%
   \selectlanguage{french}%
}

% Changes words used by `babel` by default (figure and table)
\AtBeginDocument{%
   \renewcommand{\figurename}{\textsc{Figure}}%
   \renewcommand{\tablename}{\textsc{Tableau}}%
}

% Generates title page
\AtBeginDocument{%
   \maketitle
}

% Table of contents, list of figures and list of tables generation
\AtBeginDocument{%
   \tableofcontents
   \ifthenelse{\boolean{InsertFiguresList}}%
              {\clearpage%
               \listoffigures%
               \addcontentsline{toc}{chapter}{\listfigurename}}{}
   \ifthenelse{\boolean{InsertTablesList}}%
              {\clearpage%
               \listoftables%
               \addcontentsline{toc}{chapter}{\listtablename}}{}
}

% `page` counter reinitialization (value and style)
\AtBeginDocument{%
   \cleardoublepage%
   \setcounter{page}{1}%
   \pagenumbering{arabic}%
}

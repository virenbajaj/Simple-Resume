\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simple_resume}[2020/07/30 My custom simple resume class]
\LoadClass{article}
% \RequirePackage{fontspec}
% \settmainfont{[Tahoma.ttf]}
\RequirePackage{titlesec}
% Needed to configure page layout
\RequirePackage{geometry}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
\RequirePackage[T1]{fontenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fontawesome}
\RequirePackage{setspace}
\RequirePackage{xifthen}
\RequirePackage{ragged2e}
\RequirePackage{parskip}
\RequirePackage{tabularx}
\RequirePackage{array}
% ---------------------------------------------------------
%                Layout
%----------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=0.8in, top=0.5in, right=0.8in, bottom= 0.5in, footskip=24pt}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}
% ---------------------------------------------------------
%                Header
%----------------------------------------------------------


\newcommand{\headersep}{ | }
\newcommand{\makeheader}[6]{
    \begin{center}
        {\LARGE \textbf{#1}} \\ % name
        \vspace{1ex}
        {#2} \\ % address
        \vspace{1ex}
        {\faMobile \ #3} \headersep 
        {\href{mailto:#4}{\faEnvelope \ #4}} \headersep 
        \href{https://www.linkedin.com/in/#5}{\faLinkedinSquare \ #5} \headersep
        \href{https://www.github.com/#6}{\faGithubSquare \hspace{.1em} #6}
    \end{center}
}

% ---------------------------------------------------------
%                Footer
%----------------------------------------------------------

\newcommand{\makefooter}[3]{
    \fancyfoot[l]{\small \textsc{#1}}
    \fancyfoot[c]{\small \textsc{#2}}
    \fancyfoot[r]{\small \textsc{#3}}
}
% ---------------------------------------------------------
%                Section Format
%----------------------------------------------------------

\titleformat{\section}
  {\large\scshape\bfseries}
  {}{0em} % section prefix
  {} %before-code
  [\titlerule]
  
\titleformat{\subsection}
  {\raggedright}
  {}{0em}
  {}

\newcommand{\locatedsubsection}[2]{
    \subsection[#1]{\textbf{#1} \hfill #2}
}
\newcommand{\datedsubsection}[2]{
    \subsection[#1]{\textit{#1} \hfill #2}
}
% ---------------------------------------------------------
%                Education
%----------------------------------------------------------

\newcommand{\educationentry}[6][]{
    \setstretch{0.1}
    \locatedsubsection{#2}{#3}
    \vspace{-1ex}
    \datedsubsection{#4}{#5}
    \vspace{-.5ex}
    \fontsize{11}{13}
    % \renewcommand\labelitemi{{\boldmath$\cdot$}}
    \renewcommand\labelitemi{\raisebox{0.25ex}{\tiny$\bullet$}}
    
    {\underline{Courses:} #6}\\
        \ifthenelse{\equal{#1}{}}{}{{\underline{Honors:} #1}}
    \setstretch{1.0}
}
% ---------------------------------------------------------
%                Experience
%----------------------------------------------------------
\newcommand{\experienceentry}[4]{
    \locatedsubsection{#1}{#2}
    \vspace{-1ex}
    \datedsubsection{#3}{#4}
}
% Define an environment for items
\newenvironment{items}{
    \setstretch{0.1}
    \vspace{-1ex}
    \setstretch{0.0}
    \begin{itemize}
}{  \end{itemize} 
    \setstretch{1.0}
}

% ---------------------------------------------------------
%                Skills
%----------------------------------------------------------
% Define an environment for skills
\newenvironment{skills}{
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}  l l }
}{
    \end{tabular*}
}

\newcommand{\skill}[2]{\textbf{#1} & {#2}\\}
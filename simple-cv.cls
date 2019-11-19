\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{simple-cv}[2011/12/23 My Class]

%% Article options
\DeclareOption{10pt}{
  \PassOptionsToClass{\CurrentOption}{article}
}

%% Custom package options
\DeclareOption{sansserif}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}
\DeclareOption{neverindent}{
  \PassOptionsToPackage{\CurrentOption}{paxcommands}
}

%% Fallback
\DeclareOption*{
  \ClassWarning{simple-cv}{Unknown option '\CurrentOption'}
}

%% Execute default options
\ExecuteOptions{10pt}

%% Process given options
\ProcessOptions\relax

%% Load base
\LoadClass[a4paper]{article}
\RequirePackage[utf8]{inputenc}

\renewcommand{\familydefault}{\sfdefault}

\RequirePackage{afterpage}
\RequirePackage{hyperref}
\RequirePackage{color}
\RequirePackage{xcolor}

\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,       % no lik border color
   allbordercolors=white    % white border color for all
}

\definecolor{pblue}{HTML}{0395DE}

%%%%%%%%%% 
% Colors %
%%%%%%%%%% 

\RequirePackage{xcolor}
\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{blue}{HTML}{006789}

\colorlet{header}{darkgray}
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}
\colorlet{fillheader}{blue}

%%%%%%%%%% 
% Header %
%%%%%%%%%% 

\RequirePackage{tikz}
\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{center}
    \Huge Curriculum Vitae\\
    \large \textcolor{fillheader}{#3}\\ \vspace{0.2cm}
    \Large #1 #2\\
  \end{center}
  \vspace{0.5cm}
}

\newenvironment{linktaglist}
  {\vspace{-1cm}\begin{center}}
  {\end{center}}

\RequirePackage{graphicx}
\RequirePackage{ifthen}
\setlength{\tabcolsep}{2pt}

% arguments: url graphic and title
\newcommand{\linktag}[3]{\begin{tabular}{ll}
  \raisebox{-.2\height}{\includegraphics[scale=0.08]{graphics/#2}}
  & \ifthenelse{\equal{#1}{}}
    {#3}
    {\href{#1}{#3}}
\end{tabular}
}

\newcommand{\home}[1]{\linktag{}{home}{#1}}
\newcommand{\phone}[1]{\linktag{}{phone}{#1}}
\newcommand{\email}[1]{\linktag{mailto:#1}{email}{#1}}
\newcommand{\linkedin}[1]{\linktag{https://www.linkedin.com/in/#1}{linkedin}{#1}}
\newcommand{\facebook}[1]{\linktag{https://www.facebook.com/#1}{facebook}{#1}}
\newcommand{\google}[2]{\linktag{https://plus.google.com/#2}{google}{#1}}
\newcommand{\skype}[1]{\linktag{}{skype}{#1}}
\newcommand{\github}[1]{\linktag{https://github.com/#1}{github}{#1}}
\newcommand{\bitbucket}[1]{\linktag{https://bitbucket.org/#1}{bitbucket}{#1}}
\newcommand{\stackoverflow}[2]{\linktag{https://stackoverflow.com/users/#2/#1}{stackoverflow}{#1}}


%%%%%%%%%%%%%%
% Entrylist  %
%%%%%%%%%%%%%%

\RequirePackage{tabularx}
\newenvironment{entrylist}{%
  \hspace{-0.55cm}
  \begin{tabular*}{16.5cm}{@{\extracolsep{\fill}}ll}
    }{%
  \end{tabular*}\vspace{-0.3cm}
}

\newcommand{\entry}[4]{%
  \parbox[t]{2cm}{#1}&
  \parbox[t]{14.1cm}{%
    \textbf{#2}%
    \hfill%
    \footnotesize\color{blue}{#3}\\%
    \color{black}{#4} \\\vspace{\parsep}%
  }\\}

\newcommand{\smallentry}[3]{%
  \parbox[t]{2cm}{#1}&
  \parbox[t]{14.1cm}{%
    \textbf{#2}%
    \hfill%
    \footnotesize\color{blue}{#3}\\%
    % #4 \\\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%%%%
% Sections      %
%%%%%%%%%%%%%%%%%

\renewcommand{\section}[2]{
  \vspace{0.5cm}
  \par\hspace{-0.55cm}
  {%
    \includegraphics[height=16pt]{#1}
    \hspace{0.2cm}
    \LARGE\color{blue}{#2}%
  }
  \par\vspace{0.3cm}
}

%%%%%%%%%%%%%%%%%
% Extra tweeks  %
%%%%%%%%%%%%%%%%%
\RequirePackage[left=2cm,top=2.5cm,right=2.5cm,bottom=2.5cm,nohead,nofoot]{geometry}
\endinput

%%% Local Variables:
%%% mode: latex
%%% TeX-master: "cv"
%%% End:

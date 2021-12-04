\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}
\RequirePackage{xunicode}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

\newfontfamily{\bodyfont}[]{Print Bold}
\newfontfamily{\thinfont}[]{Print Clearly}
\newfontfamily{\dashedfont}[]{Print Dashed}
\newfontfamily{\jobfont}[]{SkarpaLT}
\newfontfamily{\headingfont}[]{Arial Bold}

\defaultfontfeatures{Color=textcolor}
\setmainfont[
    UprightFont= HelveticaNeue-Light,
    BoldFont=HelveticaNeue-CondensedBold,
    ItalicFont=HelveticaNeue-UltraLightItal
	]{HelveticaNeue}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\headernamefirst}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}{\dashedfont #2}{\bodyfont #3}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \jobfont #4%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

\newcommand{\header}[4]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      {\thinfont #2}{\dashedfont #3}{\bodyfont #4}%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        orange\or%
        red\or%
        blue\or%
        green\or%
        purple\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}
\RequirePackage{pifont}

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}
  {\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}}
  {\end{tabular*}}

\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newcommand{\discretright}[1]
  {\hfill{\footnotesize\addfontfeature{Color=lightgray} #1}}

\newcommand{\markedright}[1]
  {\hfill{\footnotesize\addfontfeature{Color=gray}\textbf{#1}}}

\newcommand{\entry}[4]
  {#1 & \parbox[t]{13.5cm}
    {\textbf{#2}\discretright{#3}\\%
      #4
      \vspace{\parsep}%
    }\\%
  }

\newlist{capabilitize}{itemize}{1}
\setlist[capabilitize,1]{label=\textbullet, leftmargin=*, align=left}
\newcommand{\capability}[3]{%
	\item[\textbf{#1}] {\hfill
		\discretright{#2}\\
		#3
	}
}

\renewcommand{\labelenumi}{\ding{120}}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(0.7, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}


%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=5cm,top=2cm,right=0.8cm,bottom=2.5cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

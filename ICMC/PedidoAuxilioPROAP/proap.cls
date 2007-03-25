\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{monograph}[2003/08/19 ICMC Monograph]
\LoadClass[12pt,oneside,a4paper]{article}

\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[pdftex]{graphicx}

\RequirePackage[pdftex]{geometry}
\geometry{a4paper,left=2.5cm,right=2cm,top=2cm,bottom=2cm}

\RequirePackage{setspace}
\onehalfspace

\RequirePackage{textcomp}

\RequirePackage{times}

\setlength{\parindent}{1.3cm}

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}%
	\newpage%
	\null%
	\begin{center}%
		\vfill%
		{\large \textbf{\@title} \par}%
		\vskip 4em%
		{\textbf{\textit{\@author}} \par}%
		\vskip 3em%
		{\textbf{Orientador: \textit{\@advisor}} \par}%
	\end{center}%
	\vfill%
	\begin{flushright}
		\begin{minipage}{.7\linewidth}
			{\hyphenpenalty=10000 Monografia apresentada ao Instituto de Ciências Matemáticas e de Computação - ICMC-USP, para o Exame de Qualificação, como parte dos requisitos para a obtenção do título de Mestre em Ciências de Computação e Matemática Computacional. \par}%
		\end{minipage}
	\end{flushright}
	\vfill%
	\begin{center}
		USP - São Carlos \par%
		\@date \par
	\end{center}%
\end{titlepage}%
}

\newenvironment{committee}{%
	\renewcommand{\labelitemi}{}%
	\begin{itemize}}
	{\end{itemize}}
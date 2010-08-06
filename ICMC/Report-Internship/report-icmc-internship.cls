\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report-internship}[2010/06/23 Report for internships]
\LoadClass[12pt,a4paper,twoside]{article}

\RequirePackage{common}
\RequirePackage{indentfirst}

\RequirePackage{multirow}

\def\cleardoublepage{%
	\clearpage%
	\if@twoside%
		\ifodd%
			\c@page%
		\else%
			\hbox{}%
			\thispagestyle{empty}%
			\newpage%
			\if@twocolumn%
				\hbox{}%
				\newpage%
			\fi%
		\fi%
	\fi%
}
  
\renewcommand\tableofcontents{%
	\if@twocolumn%
		\@restonecoltrue\onecolumn%
	\else%
		\@restonecolfalse%
	\fi%
	\section*{\contentsname\@mkboth{%
		\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
	\@starttoc{toc}%
	\if@restonecol%
		\twocolumn%
	\fi%
    \thispagestyle{empty}%
    \cleardoublepage%
	\setcounter{page}{1}%
}


\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\def\grant#1{\gdef\@grant{#1}}
\def\@subtitle{\@latex@error{No \noexpand\grant given}\@ehc}

\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}

\def\coadvisor#1{\gdef\@coadvisor{#1}}
\def\@coadvisor{\@latex@error{No \noexpand\coadvisor given}\@ehc}

\def\coadvisorinst#1{\gdef\@coadvisorinst{#1}}
\def\@coadvisorinst{\@latex@error{No \noexpand\coadvisorinst given}\@ehc}


\def\begindate#1{\gdef\@begindate{#1}}
\def\@begindate{\@latex@error{No \noexpand\begindate given}\@ehc}

\def\enddate#1{\gdef\@enddate{#1}}
\def\@enddate{\@latex@error{No \noexpand\enddate given}\@ehc}

\def\reportdate#1{\gdef\@reportdate{#1}}
\def\@reportdate{\@latex@error{No \noexpand\reportdate given}\@ehc}


\def\@maketitle{%
	\thispagestyle{empty}%
	\sffamily%
	\parindent0ex
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}cl} 
	% \begin{tabular}{cl}
		\multirow{3}{*}{%
			\centering
			\includegraphics[width=0.088\textwidth]{icmc-logo}%
		}%
		&\raisebox{-1.5ex}{%
			\resizebox{0.8\textwidth}{!}{UNIVERSIDADE DE SÃO PAULO}%
		}\\%
		&\resizebox{0.8\textwidth}{!}{INSTITUTO DE CIÊNCIAS MATEMÁTICAS E DE COMPUTAÇÃO}\\%
		&\resizebox{0.8\textwidth}{!}{PROGRAMA DE CIÊNCIAS DE COMPUTAÇÃO E MATEMÁTICA COMPUTATIONAL}\\%
		&\resizebox{0.8\textwidth}{!}{Caixa Postal 668 -- CEP 13560-970 -- São Carlos / SP -- Telefone (16) 3373-9700 -- Fax (16) 3371-2238}\\%
		\hline\hline
	\end{tabular*}
		
	\begin{center}
		\vskip 4em
		{\large \@subtitle{} \par}

		\vfill
		\begin{minipage}{.75\linewidth}
			\centering
			\hrule
			\vskip 0.5em
			{\LARGE \@title{} \par}
			\vskip 0.2em
			{\large Período: \@begindate{} - \@enddate{} \par}
		
			\vskip 2.5em
			{\large \textbf{Aluno}: \@author{} \par}
			\vskip 0.2em
			{\@grant{} \par}
		
			\vskip 1.5em
			{\large \textbf{Orientador}: \@advisor{} \par}
			{\large \textbf{Coorientador (\@coadvisorinst)}: \@coadvisor{} \par}%
			\vskip 0.5em
			\hrule
		\end{minipage}
		
		
		\vfill
		{\large \@reportdate{}}
	\end{center}
	\cleardoublepage
}

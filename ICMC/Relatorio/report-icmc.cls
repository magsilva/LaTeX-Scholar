\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report-internship}[2004/01/29 Report for internships]
\LoadClass[12pt,a4paper]{article}

\RequirePackage[brazil]{babel}
\RequirePackage[latin1]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{setspace}
\RequirePackage[brazil]{varioref}
\RequirePackage{indentfirst}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\geometry{a4paper,left=2cm,right=2cm,top=2cm,bottom=2cm}
\RequirePackage{longtable}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{multirow}
\RequirePackage{ae}

\RequirePackage{lscape}

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\@latex@error{No \noexpand\subtitle given}\@ehc}

\def\grant#1{\gdef\@grant{#1}}
\def\@subtitle{\@latex@error{No \noexpand\grant given}\@ehc}

\def\advisor#1{\gdef\@advisor{#1}}
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}

\def\coadvisor#1{\gdef\@coadvisor{#1}}
\def\@coadvisor{\@latex@error{No \noexpand\coadvisor given}\@ehc}

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
		&\resizebox{0.8\textwidth}{!}{DEPARTAMENTO DE SISTEMAS DE COMPUTAÇÃO (SSC)}\\%
		&\resizebox{0.8\textwidth}{!}{Caixa Postal 668 -- CEP 13560-970 -- São Carlos / SP -- Telefone (16) 3373-9700 -- Fax (16) 3371-2238}\\%
		\hline\hline
	\end{tabular*}
		
	\begin{center}
		\vskip 5em
		{\large \@subtitle{} \par}

		\vfill
		\begin{minipage}{.75\linewidth}
			\centering
			\hrule
			\vskip 0.5em
			{\LARGE \@title{} \par}
			\vskip 0.5em
			{\large Período: \@begindate{} - \@enddate{} \par}
		
			\vskip 4em
			{\large \textbf{Aluno}: \@author{} \par}
			\vskip 0.5em
			{\@grant{} \par}
		
			\vskip 3.5em
			{\large \textbf{Orientador}: \@advisor{} \par}
			{\large \textbf{Orientador (PUCRS)}: \@coadvisor{} \par}%
			\vskip 0.5em
			\hrule
		\end{minipage}
		
		
		\vfill
		{\large \@reportdate{}}
	\end{center}
	\newpage%
	\setcounter{page}{1}%
}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{project-proposal}[2006/07/05 PhD Project Proposal]

\LoadClass[twoside,12pt,onecolumn,a4paper]{article}

\RequirePackage{latexscholar-common}




\def\email#1{\gdef\@email{#1}}%
\def\@email{\@latex@error{No \noexpand\email given}\@ehc}%


% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\section*{\bibname}%
	\list{
		\@biblabel{\@arabic\c@enumiv}
	}{
		\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}
	}
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m
}{
	\def\@noitemerr
	{\@latex@warning{Empty thebibliography environment}}
	\endlist
}

\newenvironment{resumo}{
	\setstretch{1}
	\narrower
	\begin{center}
		\textbf{Resumo}
		\vspace{-6pt}
	\end{center}
	\vspace{-3pt}
}{
}


\renewenvironment{abstract}{
	\setstretch{1}
	\narrower
	\begin{center}
		\textbf{Abstract}
		\vspace{-6pt}
	\end{center}
	\vspace{-3pt}
}{
}



\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\institution#1{\gdef\@institution{#1}}%
\def\@institution{\@latex@error{No \noexpand\institution given}\@ehc}%

\def\graduationprogram#1{\gdef\@graduationprogram{#1}}%
\def\@graduationprogram{\@latex@error{No \noexpand\graduationprogram given}\@ehc}%

\def\degree#1{\gdef\@degree{#1}}%
\def\@degree{\@latex@error{No \noexpand\degree given}\@ehc}%

\def\date#1{\gdef\@date{#1}}%
\def\@date{\@latex@error{No \noexpand\date given}\@ehc}%

\def\shortdate#1{\gdef\@shortdate{#1}}%
\def\@shortdate{\@latex@error{No \noexpand\shortdate given}\@ehc}%

\def\cnae#1{\gdef\@cnae{#1}}%
\def\@cnae{\@latex@error{No \noexpand\cnae given}\@ehc}%

\def\knowledgearea#1{\gdef\@knowledgearea{#1}}%
\def\@knowledgearea{\@latex@error{No \noexpand\knowledgearea given}\@ehc}%

\def\abstract#1{\gdef\@abstract{#1}}%
\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}%


\newcommand{\projectname}{Projeto de pesquisa}
\newcommand{\projectsummaryname}{Dados gerais}
\newcommand{\projecttitlename}{Título do projeto}
\newcommand{\projectcandidatename}{Candidato}
\newcommand{\projectadvisorname}{Proponente}
\newcommand{\projectinstitutionname}{Instituição}
\newcommand{\projectprogramname}{Programa}
\newcommand{\projectdegreename}{Nível}
\newcommand{\projectdatename}{Data}
\newcommand{\projectcnaename}{CNAE}
\newcommand{\projectknowledgeareaname}{Área de conhecimento}

% Folha de rosto e capa
\renewcommand{\maketitle}{%
	{\LARGE \bf \noindent\projectname}
	\vspace{.2em}
		
	% \section*{\projectsummaryname}
	%
	\begin{description}
		\item[\projecttitlename] \@title
		\item[\projectcandidatename] \@author
		\item[\projectadvisorname] \@advisor
		\item[\projectinstitutionname] \@institution{} (\@university{}) 
		\item[\projectprogramname] \@graduationprogram
		\item[\projectknowledgeareaname] \@knowledgearea
		\item[\projectcnaename] \@cnae
		\item[\projectdegreename] \@degree
	\end{description}
	
	{\noindent \Large \textbf{\abstractname} \par}
	\noindent \@abstract
	\clearpage
}

\setlength{\parskip}{0pt}

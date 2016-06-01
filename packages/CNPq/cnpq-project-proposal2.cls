\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfpr-project-proposal}[2013/03/27 UTFPR Project]

\LoadClass[oneside,12pt,onecolumn,a4paper]{article}

\RequirePackage{latexscholar-common}


\RequirePackage[nottoc,notindex,notlot,notlof,numbib]{tocbibind}

\RequirePackage{latexscholar-hacks}

% % Do no use uppercase for \bibname.
% \renewenvironment{thebibliography}[1]{
% 	\section*{\bibname}%
% 	\list{
% 		\@biblabel{\@arabic\c@enumiv}
% 	}{
% 		\settowidth\labelwidth{\@biblabel{#1}}%
% 		\leftmargin\labelwidth
% 		\advance\leftmargin\labelsep
% 		\@openbib@code
% 		\usecounter{enumiv}%
% 		\let\p@enumiv\@empty
% 		\renewcommand\theenumiv{\@arabic\c@enumiv}
% 	}
% 	\sloppy
% 	\clubpenalty4000
% 	\@clubpenalty \clubpenalty
% 	\widowpenalty4000%
% 	\sfcode`\.\@m
% }{
% 	\def\@noitemerr
% 	{\@latex@warning{Empty thebibliography environment}}
% 	\endlist
% }



\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\date#1{\gdef\@date{#1}}%
\def\@date{\@latex@error{No \noexpand\date given}\@ehc}%

\def\campus#1{\gdef\@campus{#1}}%
\def\@campus{\@latex@error{No \noexpand\campus given}\@ehc}%

\def\knowledgearea#1{\gdef\@knowledgearea{#1}}%
\def\@knowledgearea{\@latex@error{No \noexpand\knowledgearea given}\@ehc}%

\def\projecttype#1{\gdef\@projecttype{#1}}%
\def\@projecttype{\@latex@error{No \noexpand\project given}\@ehc}%

\def\graduationprogram#1{\gdef\@graduationprogram{#1}}%
\def\@graduationprogram{\@latex@error{No \noexpand\graduationprogram given}\@ehc}%

\def\cnae#1{\gdef\@cnae{#1}}%
\def\@cnae{\@latex@error{No \noexpand\cnae given}\@ehc}%

\def\abstract#1{\gdef\@abstract{#1}}%
\def\@abstract{\@latex@error{No \noexpand\abstract given}\@ehc}%

\newcommand{\projectinstitutionname}{Instituição}
\newcommand{\campusname}{}
\newcommand{\projectname}{Projeto de}
\newcommand{\projectcoordinator}{Coordenador}
\newcommand{\projecttitlename}{Título do projeto}
\newcommand{\projectknowledgeareaname}{Área de conhecimento (CNPq)}
\newcommand{\projectheadonename}{Ministério da Ciência, Tecnologia e Inovação}
\newcommand{\projectheadtwoname}{Conselho Nacional de Desenvolvimento Científico e Tecnológico}
\newcommand{\projectsummaryname}{Identificação do projeto}
\newcommand{\projectprogramname}{Programa}
\newcommand{\projectdatename}{Data}

% Folha de rosto e capa
\renewcommand{\maketitle}{%
	\begin{minipage}[t][2.5cm][c]{.1\textwidth}
		\noindent
		\raggedright
		\includegraphics[height=2.2cm]{brasil}
 	\end{minipage}
	\begin{minipage}[t][2.5cm][c]{.75\textwidth}
		\centering
		\noindent
		\textbf{\projectheadonename{}}\\\projectheadtwoname{}
	\end{minipage}
	
	\begin{center}
		\vspace{3cm}
		{\Large \bf \noindent\@title}

		\vfill
		\noindent\@author
		\\\projectname{}  \@projecttype
		\\\projectknowledgeareaname{} \@knowledgearea{}
		
		\vfill
		\noindent\campusname{} \@campus{}, \@date
	\end{center}
	\cleardoublepage

	{\LARGE \bf \noindent\projectname \@projecttype}
        \vspace{1em}
                
        \section*{\projectsummaryname}
        \begin{description}
                \item[\projecttitlename] \@title
                \item[\projectcoordinator] \@author
                \item[\projectinstitutionname] \@university
                \item[\projectprogramname] \@graduationprogram
                \item[\projectknowledgeareaname] \@knowledgearea
                \item[\projectdatename] \@date
		\item[Resumo] \@abstract
        \end{description}
	\cleardoublepage
}

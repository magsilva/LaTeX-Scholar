\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfpr-project-proposal}[2013/03/27 UTFPR Project]

\LoadClass[twoside,12pt,onecolumn,a4paper]{article}

\RequirePackage{common}


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


\newcommand{\campusname}{Campus}
\newcommand{\projectname}{Projeto de}
\newcommand{\projecttitlename}{Título do projeto}
\newcommand{\projectknowledgeareaname}{Área de conhecimento (CNPq)}
\newcommand{\projectheadonename}{Ministério da Educação}
\newcommand{\projectheadtwoname}{Pró-Reitoria de Pesquisa e Pós-Graduação}

% Folha de rosto e capa
\renewcommand{\maketitle}{%
	\begin{minipage}[t][2.5cm][c]{.1\textwidth}
		\noindent
		\raggedright
		\includegraphics[height=2.2cm]{brasil}
 	\end{minipage}
  \begin{minipage}[t][2.5cm][c]{.65\textwidth}
		\centering
		\noindent
		\textbf{\projectheadonename{}}\\\@university{}\\\projectheadtwoname{}
	\end{minipage}
	\begin{minipage}[t][2.5cm][c]{.15\textwidth}
		\raggedleft
		\noindent
		\includegraphics[height=1.1cm]{utfpr}
	\end{minipage}
	
	\begin{center}
		\vspace{3cm}
		{\Large \bf \noindent\@title}

		\vfill
		\noindent\@author
		\\\projectname{}  \@projecttype
		\\\projectknowledgeareaname{}: \@knowledgearea{}
		
		\vfill
		\noindent\campusname{} \@campus{}, \@date
	\end{center}
	\clearpage
}

\setlength{\parskip}{0pt}

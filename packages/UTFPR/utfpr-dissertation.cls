\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfpr-pdm}[2014/11/17 PDM]

\LoadClassWithOptions{book}
\RequirePackage{latexscholar-book}

\RequirePackage{fancyhdr}

\RequirePackage{tocvsec2}
\maxtocdepth{subsubsection}

\def\titleen#1{\gdef\@titleen{#1}}%
\def\@titleen{\@latex@error{No \noexpand\titleen given}\@ehc}%

\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\address#1{\gdef\@address{#1}}%
\def\@address{\@latex@error{No \noexpand\address given}\@ehc}%

\def\university#1{\gdef\@university{#1}}%
\def\@university{\@latex@error{No \noexpand\university given}\@ehc}%

\def\universitycampus#1{\gdef\@universitycampus{#1}}%
\def\@universitycampus{\@latex@error{No \noexpand\universitycampus given}\@ehc}%

\def\universityunit#1{\gdef\@universityunit{#1}}%
\def\@universityunit{\@latex@error{No \noexpand\universityunit given}\@ehc}%

\def\program#1{\gdef\@program{#1}}%
\def\@program{\@latex@error{No \noexpand\program given}\@ehc}%

\def\depositshortdate#1{\gdef\@depositshortdate{#1}}%
\def\@depositshortdate{\@latex@error{No \noexpand\depositshortdate given}\@ehc}%

\def\dissertationgoal#1{\gdef\@dissertationgoal{#1}}%
\def\@dissertationgoal{\@latex@error{No \noexpand\dissertationgoal given}\@ehc}%

\newcommand{\coverpageone}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\begin{center}
			\null
			\allcaps{\@university}
			\par
			\allcaps{\@universitycampus}
			\par
			\allcaps{\@universityunit}
			\par
			\allcaps{\@program}
			\par
			\vfill
			{\allcaps{\@author} \normalsize \par}
			\vfill
			{\large\textbf{\textsf{\allcaps{\@title}}} \par}
			\vfill
			{
				\allcaps{Dissertação -- Mestrado} \par
			}
			\vfill
			\vspace{2.5cm}
			{\bf\allcaps{\@address} \par}
			{\bf\allcaps{\@depositshortdate} \par}
		\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
}


\newcommand{\coverpagetwo}{
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
		\vspace{2.6cm}
		\begin{center}
			{\allcaps{\@author} \par}
			\vfill
			{\large{\textbf{\textsf{\allcaps{\@title}}}} \par}
			\vspace{2.4cm}
			\begin{flushright}
				\begin{minipage}{8.5cm}
					{\hyphenpenalty=10000 \singlespacing \@dissertationgoal \par}%
					\vspace{.3cm}
					{\advisorname: \@advisor \par}
				\end{minipage}
			\end{flushright}		
			\vspace{2.5cm}
			{\bf\allcaps{\@address} \par}
			{\bf\allcaps{\@depositshortdate} \par}
		\end{center}
	\end{adjustwidth}
}

% Title and cover page
%
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\coverpageone
		\coverpagetwo
	\end{titlepage}
}


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % TERMO DE APROVACAO
% 
% \providecommand{\ABNTtextoaprovacaodata}{}
% \newcommand{\textoaprovacao}[1]{\renewcommand{\ABNTtextoaprovacaodata}{#1}}
% 
% \providecommand{\ABNTprimeiroassinadata}{}
% \newcommand{\primeiroassina}[1]{\renewcommand{\ABNTprimeiroassinadata}{#1}}
% 
% \providecommand{\ABNTsegundoassinadata}{}
% \newcommand{\segundoassina}[1]{\renewcommand{\ABNTsegundoassinadata}{#1}}
% 
% \providecommand{\ABNTterceiroassinadata}{}
% \newcommand{\terceiroassina}[1]{\renewcommand{\ABNTterceiroassinadata}{#1}}
% 
% \providecommand{\ABNTquartoassinadata}{}
% \newcommand{\quartoassina}[1]{\renewcommand{\ABNTquartoassinadata}{#1}}
% 
% \providecommand{\ABNTlocaldiadata}{}
% \newcommand{\localdia}[1]{\renewcommand{\ABNTlocaldiadata}{#1}}
% 
% \newcommand{\termodeaprovacao}
% {
% 	\begin{titlepage}
% 		\pretextualchapter{TERMO DE APROVA\c{C}\~AO}
% 		\vspace{-0.25cm}
% 		\begin{center}
% 			\large\ABNTautordata
% 		\end{center}
% 		\vspace{0.75cm}
% 		\begin{center}
% 			\large\allcaps{\ABNTtitulodata}
% 		\end{center}
% 		\vspace{0.75cm}
% 		{
% 			\singlespacing
% 			\noindent\ABNTtextoaprovacaodata\par
% 		}
% 		\setlength{\ABNTsignthickness}{0.4pt}
% 		\setlength{\ABNTsignskip}{1.75cm}
% 		\ABNTifnotempty{\ABNTprimeiroassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTprimeiroassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTsegundoassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTsegundoassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTterceiroassinadata}%
% 		{
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTterceiroassinadata}
% 		\end{center}
% 		}
% 		\ABNTifnotempty{\ABNTquartoassinadata}%
% 		{%
% 		\begin{center}
% 			\vspace{-0.5cm}
% 			\assinatura{\ABNTquartoassinadata}
% 		\end{center}
% 		}
% 		\vfill
% 		\begin{center}
% 			\ABNTlocaldiadata
% 		\end{center}
% 	\end{titlepage}
% }
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Ficha catalografica
\providecommand{\UTFPRfichacatpumdata}{}
\newcommand{\fichacatpum}[1]{\renewcommand{\UTFPRfichacatpumdata}{#1}}
\providecommand{\UTFPRfichacatautordata}{}
\newcommand{\fichacatautor}[1]{\renewcommand{\UTFPRfichacatautordata}{#1}}
\providecommand{\UTFPRfichacatpgbibdata}{}
\newcommand{\fichacatpgbib}[1]{\renewcommand{\UTFPRfichacatpgbibdata}{#1}}
\providecommand{\UTFPRfichacatpalchadata}{}
\newcommand{\fichacatpalcha}[1]{\renewcommand{\UTFPRfichacatpalchadata}{#1}}
\providecommand{\UTFPRfichacatpdoisdata}{}
\newcommand{\fichacatpdois}[1]{\renewcommand{\UTFPRfichacatpdoisdata}{#1}}
\providecommand{\UTFPRfichacatbibdata}{}
\newcommand{\fichacatbib}[1]{\renewcommand{\UTFPRfichacatbibdata}{#1}}

\usepackage{refcount}
\newcommand{\pagedifference}[2]{%
	\number\numexpr\getpagerefnumber{#2}-\getpagerefnumber{#1}\relax}

\newcommand{\fichacat}{
	\newcommand{\lenauthor}{\hspace{8px}}
	\newcommand{\lencore}{\hspace{8px}}
	\thispagestyle{empty}{
		\footnotesize{
			\vspace*{12.8cm}
			\begin{center}
				\begin{tabular}{c}
					Dados Internacionais de Cataloga\c{c}\~{a}o na Publica\c{c}\~{a}o
				\end{tabular}
			\end{center}
		}
		\vspace{-25px}
		\begin{center}
			\line(1,0){385}
		\end{center}
		\vspace{-15px}
		\begin{table}[h!]
			\begin{center}
				\scriptsize
				\begin{tabular}{lp{12cm}}
					\UTFPRfichacatpumdata
					\lenauthor & \UTFPRfichacatautordata \\
					\lenauthor & \lencore \@title / \@author. \@address. UTFPR,  \@depositshortdate. \\
					& \lencore \pageref{LastPage}. f. : il. ; 30 cm \\
					& \\
					& \lencore Orientador: \@advisor. \\
					\@ifundefined{@coadvisor}{}{
						& \lencore \coadvisorlabel: \@coadvisor \\
					}
					& \lencore Monografia (Graduação) - \@university. \@program. \@address, \@depositshortdate.\\
					& \lencore Bibliografia: f. \pageref{bibstart} - \pageref{bibend}. \\
					& \\
					& \lencore \UTFPRfichacatpalchadata \\
					& \\
					& \hfill \UTFPRfichacatpdoisdata \\
				\end{tabular}
			\end{center}
		\end{table}
		\vspace{-50px}
		
		\begin{center}
			\line(1,0){385}
		\end{center}
		
		\vspace{-25px}
		\center \footnotesize \UTFPRfichacatbibdata
		\newpage
	}
}

% Environment to write abstract (in English and native language). This
% environment has narrower margins.
\newenvironment{abstract}{
	\chapter*{Abstract}
	\setlength{\parindent}{0pt}
	
	\vspace{1cm}
	\UTFPRfichacatautordata. \@titleen. \@depositshortdate.
	\pageref{LastPage}. f. Monografia (\@program), \@university.
	\@address, \@depositshortdate.
	
	\vspace{1cm}
}{
\vspace{1cm}
}

\newenvironment{resumo}{
	\chapter*{Resumo}
	\setlength{\parindent}{0pt}
	
	\vspace{1cm}
	\UTFPRfichacatautordata. \@title. \@depositshortdate.
	\pageref{LastPage}. f. Monografia (\@program), \@university.
	\@address, \@depositshortdate.
	
	\vspace{1cm}
}{
\vspace{1cm}
}

\newcommand{\palavraschaves}[1]{\noindent\textbf{Palavras-chaves:} #1}

\newcommand{\keywords}[1]{\noindent\textbf{Keywords:} #1}


% Avoids widow lines (do not set a value higher than 10000 as this may disable
% the intended behaviour, do not ask me why!).
\widowpenalty = 9999
\clubpenalty = 9999

% Gives some extra spacing between paragraphs.
\setlength{\parskip}{3pt}

% Do no use uppercase for \bibname.
\renewenvironment{thebibliography}[1]{
	\addcontentsline{toc}{chapter}{\numberline{}\bibname}
	\chapter*{\bibname}%
	
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
\def\@noitemerr{\@latex@warning{Empty thebibliography environment}}
\endlist
}

% Command to create a dedicate page.
\newcommand{\dedicate}{
	\cleardoublepage
	\vfill
	\hfill
	\parbox{.4\linewidth}{\textsl{\@dedication}}
	\vspace{3cm}
}

\newenvironment{agradecimentos}{
	\cleardoublepage
	\chapter*{Agradecimentos}
}{
}

% Pretty chapter start at frontmatter
\newpagestyle{frontmatter}{
	\sethead{}
	{}
	{}
	\setfoot{}
	{}
	{}
}

% Pretty chapter start at mainmatter
\newpagestyle{mainmatter}[\small\sffamily]{
	\sethead{}
	{}
	{}
	\setfoot{}
	{\thepage}
	{}
}

% Pretty chapter start at backmatter
\newpagestyle{backmatter}{
	\sethead{}
	{}
	{}
	\setfoot{}
	{\thepage}
	{}
}


\renewcommand\frontmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{empty}
	\pagenumbering{gobble}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagestyle{mainmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}


\def\pagenumbering#1{%
	\gdef\thepage{\csname @#1\endcsname \c@page}}


\renewcommand\backmatter{%
	\cleardoublepage
	\@mainmatterfalse
	\pagestyle{backmatter}
	\pagenumbering{arabic}
	\titlespacing{\chapter}{0pt}{0em}{2em}[0pt]
}

\newlength{\chaptertitleheight}
\titleformat{\chapter}[display]
{\normalfont\Large\sffamily} % Text format
{ % Label
	\rule[32pt]{.7\linewidth}{4pt}
	\hspace{-10pt}
	\shadowbox{
		\begin{minipage}{.18\linewidth}
			\centering
			\textsc{\Large\chaptertitlename}\\
			\vspace{1ex}
			{\fontsize{80}{100}\selectfont\thechapter}\\
			\vspace{1ex}
		\end{minipage}
	}
	\hspace{-14pt}
	\leaders\hbox{\rule[32pt]{.1pt}{4pt}}\hfill
}
{0pt}
{\Huge\raggedright}
[\rule{\linewidth}{4pt}]

\newsavebox{\scholar@chaptertitle}%
\let\scholar@oldchapter\chapter%
\renewcommand*\chapter{%
	\@ifstar{\scholar@oldchapter@starred}{\@dblarg\scholar@oldchapter@notstarred}}

\newcommand*\scholar@oldchapter@starred[1]{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#1}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{3cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]
	\scholar@oldchapter*{#1}}

\def\scholar@oldchapter@notstarred[#1]#2{
	\savebox{\scholar@chaptertitle}{\Huge\parbox[t]{\textwidth}{#2}}%
	\settototalheight{\chaptertitleheight}{\usebox{\scholar@chaptertitle}}%
	\addtolength{\chaptertitleheight}{7cm}%
	\titlespacing{\chapter}{0pt}{0em}{\chaptertitleheight}[0pt]%
	\scholar@oldchapter[{#1}]{#2}}%

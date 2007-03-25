\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-dissertation}[2007/03/23 Customized dissertation]

\LoadClass{common-book}

\RequirePackage{fancyhdr}

% Vari�veis utilizadas para criar a capa da disserta��o
% - advisor: Nome completo do(a) orientador(a)
% - fulldate: Data por extenso da entrega da disserta��o
% - dedication: Dedicat�ria
% - keywords: Palavras-chaves
\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

\def\keywords#1{\gdef\@keywords{#1}}%
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}%


% Folha de rosto e capa
\renewcommand{\maketitle}{%
\pagestyle{empty}
\begin{titlepage}
	\newpage
	\null
	\begin{adjustwidth}{-.5cm}{}
	\vfill
	\begin{center}
		\rule{.8\linewidth}{.3mm}
		\begin{minipage}{.7\linewidth}
			\begin{center}
				\vskip 1.5em
				{\Large \textsf{\@title} \par}
				\vskip 2em
				{\large \textbf{\textit{\@author}} \normalsize \par}
				\vskip 1.5em
			\end{center}
		\end{minipage}
		\rule{.8\linewidth}{.3mm}
	\end{center}
	\vfill
	\newpage
	\null
	\begin{flushright}
		\begin{boxedminipage}[t]{8cm}
			\begin{center}
				\begin{footnotesize}
				SERVI�O DE P�S-GRADUA��O DO ICMC-USP \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Dep�sito: \@fulldate \par
			\vskip 1em
			Assinatura: \rule{.7\linewidth}{.05mm} \par
		\end{boxedminipage}
	\end{flushright}
	\begin{center}
		\vfill
		{\large \textbf{\@title} \par}
		\vskip 4em
		{\textbf{\textit{\@author}} \par}
		\vskip 3em
		{\textbf{Orientador: \textit{\@advisor}} \par}
	\end{center}
	\vfill
	\begin{flushright}
		\begin{minipage}{.7\linewidth}
			{\hyphenpenalty=10000 Disserta��o apresentada ao Instituto de Ci�ncias Matem�ticas e de Computa��o - ICMC-USP, como parte dos requisitos para a obten��o do t�tulo de Mestre em Ci�ncias de Computa��o e Matem�tica Computacional. \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		USP - S�o Carlos \par
		\@date \par
	\end{center}
	\clearpage
	\end{adjustwidth}
\end{titlepage}
}


% Macro para destacar as primeiras letras do texto. Um texto do tipo:
%
%  \begin{document}
%    \versal{IN} THE beginning God created the heaven and the earth.  Now the
%    earth was unformed and void, and darkness was upon the face of the
%    deep; and the spirit of God hovered over the face of the waters.
%  \end{document}
%
%  produzir� algo como:
%
%  I I\  I THE beginning God  created the heaven and  the earth.
%  I I \ I Now the earth was unformed and void, and darkness was
%  I I  \I upon the face of the deep; and the spirit of God hov-
%  ered over the face of the waters.
\font\versalfont= pzcmi scaled 6500
\newcommand{\versal}[1]{{\noindent
    \setbox0\hbox{\versalfont #1 }%
    \count0=\ht0                   % height of versal
    \count1=\baselineskip          % baselineskip
    \divide\count0 by \count1      % versal height/baselineskip
    \dimen1 = \count0\baselineskip % distance to drop versal
    \advance\count0 by 1\relax     % no of indented lines
    \dimen0=\wd0                   % width of versal
    \global\hangindent\dimen0      % set indentation distance
    \global\hangafter-\count0      % set no of indented lines
    \hskip-\dimen0\setbox0\hbox to\dimen0{\raise-\dimen1\box0\hss}%
    \dp0=0in\ht0=0in\box0}}


%%%%%%%%%%%%%%%%%%%%%%%%
% Title definitions
%
% The 'titlesec' package is fabulous! Changing the \chapter and friends is a nightmare. That
% package makes the job easy, piece of cake actually!
%
% noindentafter: Do not indent the first paragraph after a title definition
% rigidchapters: Set a fixed space for chapters
% nobottontitles*: Do not allow a title hanging at the botton (like a widow line)
% largestsep: Uses the largest space between two following titles.
% clearempty: Do not show the page number in an empty page (pretty common in doubleepage docs).
\RequirePackage[noindentafter,rigidchapters,nobottomtitles*,largestsep,clearempty]{titlesec}
% \RequirePackage[sf,sl,outermarks]{titlesec}

% Add a dot after the section/subsection/etc counters.
\titlelabel{\thetitle.\quad}

% titlespacing{<command>}{<left>}{<before>}{<after>}[<right>]
\titlespacing{\section}{0pt}{1.5em}{1em}[0pt]

% Pretty chapter start
\font\chapternumberfont= goxi2074 scaled 2000
\titleformat{\chapter}[display]
	{\normalfont\Large\sffamily}
	{
		\filright
		\rule[32pt]{.7\linewidth}{4pt}
		\hspace{-8pt}
		\shadowbox{
			\begin{minipage}{.18\linewidth}
				\centering
				\textsc{\Large\chaptertitlename}\\
				\vspace{1ex}
				{\chapternumberfont \thechapter}\\
				\vspace{1ex}
			\end{minipage}
		}
	}
	{0pt}
	{\filcenter\Huge}
	[\hfill\rule{.8\textwidth}{0.5pt}\\\vskip-1.8ex\hfill\rule{.7\textwidth}{3pt}]

% Cria o cabe�alho da p�gina inicial do cap�tulo.
%\titleformat{\chapter}[display]
%	{
%		\sffamily\Huge
%	}
%	{
%		\begin{tabular}{|c|}
%			\rowcolor{black}
%			\color{white}
%			\large
%			\scshape
%			\chaptername \\
%			\vspace{-2ex} \\
%			\Huge
%			\slshape
%			\scaletoheight{1cm}{\thechapter} \\ \hline
%		\end{tabular}
%	}
%	{8pt}
%	{\Huge\bfseries\filleft}
%	[\hfill\rule{.8\textwidth}{0.5pt}\\
%	\vskip-2.4ex\hfill\rule{.8\textwidth}{2pt}\\
%	\vskip 1.5ex]


% Configura cabe�alho e rodap� das p�ginas do corpo do texto para
% conter, p�ginas pares, o nome da se��o e, nas p�ginas impares, o nome
% do cap�tulo.
\renewcommand\frontmatter{%
	% \pagestyle{fancy}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
	\cleardoublepage
	\@mainmatterfalse
	\pagenumbering{roman}
}

\renewcommand\mainmatter{
	\cleardoublepage
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{fancy}
	\titlespacing{\chapter}{0pt}{2.5em}{20em}[0pt]
	\acresetall{}
}

\renewcommand\backmatter{%
	% \pagestyle{fancy}
	\titlespacing{\chapter}{0pt}{2.5em}{10em}[0pt]
	\cleardoublepage
	\@mainmatterfalse
}

\fancyhead{}
\fancyhead[RO,LE]{\thepage}
\fancyhead[RE]{\slshape \rightmark} % pagina par - se��o
\fancyhead[LO]{\slshape \leftmark} % pagina impar - cap�tulo


% Remove o nome do cap�tulo dos cabe�alhos das p�ginas
% \renewcommand{\chaptermark}[1]{
% }
%
% Remove o nome das se��es dos cabe�alhos das p�ginas
%\renewcommand{\sectionmark}[1]{
%}


\renewcommand{\chaptermark}[1]{
	\markboth{
		\chaptername
		{\thechapter\ ---\ #1}
	}{}
}

\renewcommand{\sectionmark}[1]{
	\markright{\thesection\ #1}
}

% Traduz os nomes de listagens e fragmentos de c�digo para portugu�s
\renewcommand{\lstlistingname}{Fragmento de c�digo}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de c�digo}
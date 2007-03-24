\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-monograph}[2007/03/23 Customized monograph]

\LoadClass{common-book}

\RequirePackage{fancyhdr}

% Variáveis utilizadas para criar a capa da dissertação
% - advisor: Nome completo do(a) orientador(a)
% - fulldate: Data por extenso da entrega da dissertação
% - dedication: Dedicatória
\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\fulldate#1{\gdef\@fulldate{#1}}%
\def\@fulldate{\@latex@error{No \noexpand\fulldate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

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
				SERVIÇO DE PÓS-GRADUAÇÃO DO ICMC-USP \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Depósito: \@fulldate \par
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
			{\hyphenpenalty=10000 Dissertação apresentada ao Instituto de Ciências Matemáticas e de Computação - ICMC-USP, como parte dos requisitos para a obtenção do título de Mestre em Ciências de Computação e Matemática Computacional. \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
		USP - São Carlos \par
		\@date \par
	\end{center}
	\clearpage
	\end{adjustwidth}
\end{titlepage}
}

% Cria o cabeçalho da página inicial do capítulo.
\titleformat{\chapter}[display]
	{
		\sffamily\Huge
	}
	{
		\begin{tabular}{|c|}
			\rowcolor{black}
			\color{white}
			\large
			\scshape
			\chaptername \\
			\vspace{-2ex} \\
			\Huge
			\slshape
			\scaletoheight{1cm}{\thechapter} \\ \hline
		\end{tabular}
	}
	{8pt}
	{\Huge\bfseries\filleft}
 	[\hfill\rule{.8\textwidth}{0.5pt}\\
 	\vskip-2.4ex\hfill\rule{.8\textwidth}{2pt}\\
 	\vskip 1.5ex]


% Configura cabeçalho e rodapé das páginas do corpo do texto para
% conter, páginas pares, o nome da seção e, nas páginas impares, o nome
% do capítulo.
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
\fancyhead[RE]{\slshape \rightmark} % pagina par - seção
\fancyhead[LO]{\slshape \leftmark} % pagina impar - capítulo


% Remove o nome do capítulo dos cabeçalhos das páginas
% \renewcommand{\chaptermark}[1]{
% }
%
% Remove o nome das seções dos cabeçalhos das páginas
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
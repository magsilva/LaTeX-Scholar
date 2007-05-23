\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-dissertation}[2007/03/23 Customized dissertation]

\LoadClass{common-book}

\RequirePackage{fancyhdr}

% Variáveis utilizadas para criar a capa da dissertação
% - advisor: Nome completo do(a) orientador(a)
% - fulldate: Data por extenso da entrega da dissertação
% - dedication: Dedicatória
% - keywords: Palavras-chaves
\def\advisor#1{\gdef\@advisor{#1}}%
\def\@advisor{\@latex@error{No \noexpand\advisor given}\@ehc}%

\def\depositdate#1{\gdef\@depositdate{#1}}%
\def\@depositdate{\@latex@error{No \noexpand\depositdate given}\@ehc}%

\def\defensedate#1{\gdef\@defensedate{#1}}%
\def\@defensedate{\@latex@error{No \noexpand\defensedate given}\@ehc}%

\def\dedication#1{\gdef\@dedication{#1}}%
\def\@dedication{\@latex@warning{No \noexpand\dedication given}\@ehc}%

\def\keywords#1{\gdef\@keywords{#1}}%
\def\@keywords{\@latex@error{No \noexpand\keywords given}\@ehc}%

\def\graduationsecretary#1{\gdef\@graduationsecretary{#1}}%
\def\@graduationsecretary{\@latex@error{No \noexpand\graduationsecretary given}\@ehc}%

\def\dissertationgoal#1{\gdef\@dissertationgoal{#1}}%
\def\@dissertationgoal{\@latex@error{No \noexpand\dissertationgoal given}\@ehc}%

\newcommand{\defensebox}{
\begingroup
	\begin{flushright}
		\begin{boxedminipage}[t]{8cm}
			\begin{center}
				\begin{footnotesize}
				\allcaps{\@graduationsecretary \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Defesa: \@defensedate \par
			\vskip 1em
			Assinatura: \rule{.7\linewidth}{.05mm} \par
		\end{boxedminipage}
	\end{flushright}
\endgroup


\newcommand{\depositbox}{
\begingroup
	\begin{flushright}
		\begin{boxedminipage}[t]{8cm}
			\begin{center}
				\begin{footnotesize}
				\allcaps{\@graduationsecretary \par
				\end{footnotesize}
			\end{center}
			\vskip .5em
			Data de Depósito: \@depositdate \par
			\vskip 1em
			Assinatura: \rule{.7\linewidth}{.05mm} \par
		\end{boxedminipage}
	\end{flushright}
\endgroup


\newcommand{\title1stpage}{
	\begingroup
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}
	\vfill
	\begin{center}
		\rule{.8\linewidth}{.3mm}
		\begin{minipage}{.7\linewidth}
			\begin{center}
				\vskip 1.5em
				% {\Large \textsf{\@title} \par}
				{\textbf{\fontsize{15pt}{19pt} \selectfont{\normalfont\Large\sffamily\bfseries \@title}
				\vskip 2em
				% {\large \textbf{\textit{\@author}} \normalsize \par}
				{\fontsize{13pt}{6pt} \selectfont \textbf{\emph{\large\@author}}}
				\vskip 1.5em
			\end{center}
		\end{minipage}
		\rule{.8\linewidth}{.3mm}
	\end{center}
	\vfill
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
	\endgroup
}


\newcommand{\title2ndpage}{
	\begingroup
	\thispagestyle{empty}
	\begin{adjustwidth}{-.5cm}{}

	\depositbox
	% \defensebox
	\begin{center}
		\vfill
		{\textbf{\fontsize{16pt}{21pt} \selectfont \@title}}
            	% {\large \textbf{\@title} \par}
		\vskip 4em
		{\textbf{\textit{\@author}} \par}
		\vskip 3em
		{\textbf{Orientador: \textit{\@advisor}} \par}
	\end{center}
	\vfill
	\begin{flushright}
		\begin{minipage}{.7\linewidth}
			{\hyphenpenalty=10000 \@dissertationgoal \par}%
		\end{minipage}
	\end{flushright}
	\vfill
	\begin{center}
	 	% ``\textsc{Versão Revisada Após a Defesa}'' \par
		USP - São Carlos \par
		\@date \par
	\end{center}
	\end{adjustwidth}
	\clearpage{\pagestyle{empty}\cleardoublepage}
	\endgroup
}

% Folha de rosto e capa
\renewcommand{\maketitle}{%
	\begin{titlepage}
		\title1stpage
		\title2ndpage
	\end{titlepage}
}

% Traduz os nomes de listagens e fragmentos de código para português
\renewcommand{\lstlistingname}{Fragmento de código}
\renewcommand{\lstlistlistingname}{Lista de fragmentos de código}
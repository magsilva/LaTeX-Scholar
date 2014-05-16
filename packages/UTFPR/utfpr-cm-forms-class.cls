\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{utfpr-cm-forms-class}[2014/05/16 Form to request replacement, postpone or antecipation of class]

\LoadClassWithOptions{article}

\usepackage{latexscholar-i18n}
\usepackage{latexscholar-margin}
\usepackage{latexscholar-graphic}

\usepackage{latexscholar-table}
\usepackage{tabularx}
\usepackage{array}

\newcolumntype{C}{>{\centering\arraybackslash}X}
\newcolumntype{Y}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\setlength{\parindent}{0cm}

\def\coordination#1{\gdef\@coordination{#1}}%
\def\@coordination{\@latex@error{No \noexpand\coordination given}\@ehc}%

\def\department#1{\gdef\@department{#1}}%
\def\@department{\@latex@error{No \noexpand\department given}\@ehc}%

\def\solicitationdate#1{\gdef\@solicitationdate{#1}}%
\def\@solicitationdate{\@latex@error{No \noexpand\solicitationdate given}\@ehc}%

\def\reason#1{\gdef\@reason{#1}}%
\def\@reason{\@latex@error{No \noexpand\reason given}\@ehc}%

\newboolean{willpostpone}
\newboolean{willanticipate}
\newboolean{willsurrogate}
\setboolean{willpostpone}{false}
\setboolean{willanticipate}{false}
\setboolean{willsurrogate}{false}

\newcommand{\@utfpr@form@postpone}{
	\ifthenelse{\boolean{willpostpone}}{X}{\hphantom{X}}
}
\newcommand{\@utfpr@form@anticipate}{
	\ifthenelse{\boolean{willanticipate}}{X}{\hphantom{X}}
}
\newcommand{\@utfpr@form@surrogate}{
	\ifthenelse{\boolean{willsurrogate}}{X}{\hphantom{X}}
}	

\newcommand{\formheader}{
	\begin{tabularx}{\textwidth}{|cX|}
		\hline
		\multirow{4}{4cm}{\includegraphics[width=3.9cm]{utfpr}}
			& Ministério da Educação\\
			& Universidade Tecnológica Federal do Paraná\\
			& Câmpus Campo Mourão\\
			& \textbf{Coordenação: \@coordination}\\
		\hline
		\multicolumn{2}{|c|}{\LARGE\textsc{Substituição / Reposição / Antecipação de Aulas}}\\
		\hline
	\end{tabularx}
}

\newcommand{\formauthor}{
	\par
	\vspace{.4cm}
	\begin{tabularx}{\textwidth}{|C|C|Y{4cm}|}
		\hline
		\textbf{Nome do professor solicitante} & \textbf{Departamento} & \textbf{Data da solicitação}\\
		\@author          & \@department                 & \@solicitationdate\\
		\hline
	\end{tabularx}
}

\newcommand{\formreason}{
	\par
	\vspace{.3cm}
	\begin{tabularx}{\textwidth}{|p{3cm}|X|}
		\hline
																							& \textbf{Motivo:}\\
		( \@utfpr@form@surrogate ) Substituição   & \multirow{4}{10cm}{\@reason}\\
		( \@utfpr@form@postpone ) Reposição       & \\
		( \@utfpr@form@anticipate ) Antecipação   & \\
													 & \\
		\hline
	\end{tabularx}
}

\newenvironment{formschedule}{
	\par
	\vspace{.3cm}
	\small
		\tabularx{\textwidth}{|c|c|c|c|c|X|}
			\hline
			\textbf{Data da aula} & \textbf{Data e horário propostos} & \textbf{Disciplina} & \textbf{Turma} & \textbf{Sala} & \textbf{Professor substituto}\\\hline
}{
	\endtabularx
	\normalsize
}

\newcommand{\formfooter}{
	\par
	\vspace{.3cm}
	{
		\renewcommand{\arraystretch}{1.5} 
		\begin{tabularx}{\textwidth}{|X|}
			\hline
			\large\textbf{\textsc{Parecer da Coordenação:}}\\
			\\
			\hline\\
			\hline\\
			\hline
		\end{tabularx}
	}

	\vspace{.3cm}
	{
		\renewcommand{\arraystretch}{2} 
		\begin{tabular}{|p{.473\textwidth}|p{.473\textwidth}|}
			\hline
			\textbf{\large Assinatura do professor solicitante:} & \textbf{\large Ciente dos professores substitutos}\\
																											   & \\
			\cline{2-2}                                          & \\\hline
			\textbf{\large Aprovação da Coordenação}             & \\
			\cline{2-2}                                          & \\
			\cline{2-2}                                          & \\\hline
		\end{tabular}
	}

	\vspace{.3cm}
	{
		\renewcommand{\arraystretch}{1.8} 
		\begin{tabularx}{\textwidth}{|X|p{5cm}|}
			\hline
			\textbf{\large Observações:} & \textbf{\large Atenção:}\\
                  & \multirow{3}{5cm}{No caso de antecipação ou reposição de aulas, deverá consta no verso deste formulário a relação dos alunos com as respectivas assinaturas, concordando com a alteração do horário das aulas.}\\
			\cline{1-1} &\\
			\cline{1-1} &\\
			\cline{1-1} &\\
			\hline
		\end{tabularx}
	}
}

\AtBeginDocument{
	\formheader{}
	\formauthor{}
	\formreason{}
}

\AtEndDocument{
	\formfooter{}
}
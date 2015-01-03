%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lilypond engraving by Graham Okely
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\version "2.16.0"  % necessary for upgrading to future LilyPond versions.
\header{
	title 			=	\markup \override #'(font-size . 8) "Love is Patient"
	composer		=	"Music (c) Graham Okely 1988"
	poet			=	"Lyrics 1st Corinthians 13:4-8"
	tagline			=	"Graham.Vocal@Gmail.com"
	copyright		=	"Graham.Vocal@Gmail.com"
}
\paper {
	#(set-default-paper-size "a4")
	head-separation 			=	3\mm
	top-margin 				=	3\mm
        system-system-spacing #'basic-distance 	= 	2\mm  
        system-system-spacing #'padding  	= 	1\mm
	ragged-bottom				=	##f
	ragged-last-bottom			=	##t
	% system-count 				=	#9
myStaffSize = #20
#(define fonts
 (make-pango-font-tree "Go Boom!" 
"Go Boom!" 
"Go Boom!"
(/ myStaffSize 20)))
}
guitarChords = \chordmode {
  % Introduction
  \override ChordName   #'font-size = #+2
  \set majorSevenSymbol = "maj7"
  \set chordChanges = ##t
  f1:7 f1:7 
  % verse 1
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g:m c:7 c2:m7 f:7
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g1:m  bes2 c:m7 bes1
  % Break
  f1:7 f1:7
  % Verse 2
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g:m c:7 c2:m7 f:7
  bes1 d2:m7 g c1:m es2:m7 f:7
  d1:7 g1:m
  % Repeated tag
  bes2 c:m7 bes1 f:7
  bes2 c:m7 c1:m7 c1:m7
  bes1
  }
verseMelody =  \relative c' {
	\override Score.MetronomeMark #'padding = #6
	\tempo 4=105
	\time 4/4
	\clef treble
	\key bes \major
	\set fontSize = #+1
	% Introduction
	r1 r1 
	% Love is patient
	f1 f2 d4 f \break		
	%  Love is kind 
	g1 ges2 f 
	% It does not envy
	d8 d fis4 a8 a4. 	
	% it does not boast
	bes8 bes a4 g2	\break	
	%Love is not proud
	r4 c g e c2 r2 
	% Love is not rude
	f1 f4 f4 d2 \break
	% Love is not self seeking
	g1 ges8. ges16 ges4 f f	
	% It is not easily angered
	d8 d fis4 a8 a a4 bes4\( a g4.\) g8
	% It keeps no record of wrongs
	bes4 bes bes8 bes bes4 bes1
	%======================================
	% Break
	r1 r1
	%======================================
	% verse 2
	% Love does not de
	f1 \break f2 d4. d8 		
	%  light in evil 
	g1 ges2 f4 f 
	% But rejoices 
	d4 fis a a \break
	% in the truth it
	bes4 a g4. g8		
	% always protects
	c2 g4 e c2 r2		
	% always trusts
	f1 \break f2 d2 
	% always hopes
	g1 ges2 f	
	% always persevers
	d4 ( fis) a4 a
	bes4 a g2 \break
        bes2 bes4 bes4 bes1 r1
        bes2 bes4 bes4 ~ 
        bes2 ees8 ees4. \fermata | 
        g8 g4. ~ g2 \fermata | 
        f1 \bar "|." 
	\break
}
verseWords = \lyricmode {
    \override LyricText #'font-size = #+3
    %======================================
    % Verse 1
    Love is pat- ient
    Love is kind
    It does not en- vy
    It does not boast
    Love is not proud
    Love is not rude
    Love is not self seek- ing
    It is not eas- i- ly a- n- gered
    It keeps no rec- ord of wrongs
    %======================================
    % Break   
    %======================================
    % Verse 2
    Love does not 
    de- light in ev- il
    but re- joi- ces in the truth
    It al- ways pro- tects
    Al- ways trusts
    Al- ways hopes
    Al-  al- ways per- sev- eres
    Love ne- ver fails
    Love ne- ver ne- ver ne- ver fails.
    %======================================
}


\bookpart {
       \score {
       <<
           \new ChordNames \guitarChords
           \new Voice = "one" \verseMelody
           \new Lyrics \lyricsto "one" \verseWords
       >>
       }
}


% --format=png -dresolution=300
